#------------------------------------------------------------------------------
# Codigo para correcao dos resultados
#
# Equipe MAT02219-EAD 2019/1
#
# Passo a passo para correcao:
# 1. ??? criar pasta para cada turma
# 2. ???colar em cada pasta o arquivo .csv (ou .xls) com info doa alunos
# 3. colar nas pastas os respectivos arquivos .pdf com provas escaneadas
# 4. Mudar a pasta de trabalho para cada turma
# 5. 
# 6. verificar as provas com ERRO, que foram movidas para a pasta 'manual'
#------------------------------------------------------------------------------


## carrgando pacotes
library("exams")
library("stringr")
library("pdftools")
library("readxl")
library("here")

#------------------------------------------------------------------------------
# correcao das provas
setwd(here("correcao20192"))

## convertendo arquivos .pdf em .png
pdfs <- list.files(pattern = ".pdf", full.names = TRUE) # .pdf devem estar na pasta de trabalho
for(ii in 1:length(pdfs)) pdf_convert(pdfs[ii], format = "png", dpi = 300)


## lendo arquivos .png gerados 
img <- list.files(pattern = ".png", full.names = TRUE)  # lista os arquivos .png
nops_scan(img)


# scan_out <- nops_scan(images = img, file = FALSE)       # verificação inicial
# scan_out2 <- str_split_fixed(scan_out, " ", n = 2)      # cria banco com variavel indicando erros
# # corrigindo as que nao tiveram erros 
# nops_scan(img[scan_out2[,2] != "ERROR"])                 
# # criando pasta com os erros 
# dir.create("manual")                                    # cria pasta para correcao manual
# file.copy(img[scan_out2[,2] == "ERROR"], "manual")      # copia provas com erros para pasta
# unlink(img[scan_out2[,2] == "ERROR"]) # deletar???      # deleta provas com erros da pasta de trabalho


## importando banco com info dos alunos
banco <- read_excel("lista_alunos_turmas.xlsx")               
banco <- data.frame(registration = str_pad(banco[[2]], 
                                           width = 8, 
                                           side="left", 
                                           pad="0"), 
                    name = banco[[3]], id = banco[[3]]) 
write.csv2(banco, "lista_alunos.csv", row.names = FALSE) 
banco_csv <- read.csv2("lista_alunos.csv")               


## corrigindo e criando saidas
objeto <- nops_eval(
  register = "lista_alunos.csv",
  solutions = "mat02219_a1_.rds",
  scans = Sys.glob("nops_scan_*.zip"),
  results = "provas_corrigidas",
  eval = exams_eval(partial = FALSE, negative = FALSE),
  #interactive = FALSE, 
  language = "pt-BR"
)


## salva informacoes da correcao
write.csv2(objeto, "notas_finais.csv")


#------------------------------------------------------------------------------
# envio de email com resultados
library(rJava)
library(mailR)
sender <- "sendermail@ufrgs.br"  
recipients <- c("anonymous1@gmail.com", "anonymous2@gmail.com")
email <- send.mail(from = sender, to = recipients,          # De:... Para:...
                   subject = "Ordenacao da especializacao", # Assunto do email
                   body = "Test!",                          # corpo do email
                   smtp = list(host.name = "smtp.ufrgs.br", 
                               port = 465, 
                               user.name = "username",      # no. cartao
                               passwd = "password",         # senha portal 
                               ssl = TRUE), 
                   authenticate = TRUE,
                   attach.files = c("Exam_anonymous.png"),   # html da correcao
                   send = FALSE,
                   debug = TRUE)
email$send() # execute to send email
