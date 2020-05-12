# --------------------------------------------------
# Observações: 
#     1. LINGUAGEM DA AVALIAÇÃO: O arquivo pt-BR2 
#        deve constar no diretório do pacote exams 
#        (exams/nops)
#     2. DATA: estamos utilizando o seguinte padrão
#        para a data da avaliação
#           ano-semestre-area
#        Exemplo: Área 1 do 2º semestre do 
#           ano de 2019 fica 2019-02-01
# --------------------------------------------------
# Carregando pacotes

library(exams)
library(here)

# --------------------------------------------------
# Especificando a lista de questões para a geração
# da atividade de avaliação
#     objeto do tipo lista
#     o nome do slot corresponde ao número de
#     questões a ser sorteado do slot/subarea

lista.questoes <- list(
  "2" = c("definicoes1.Rmd", "definicoes2.Rmd",
          "definicoes3.Rmd", "definicoes4.Rmd",
          "questao_amostragem.Rmd"), 
  "1" = c("Desc7_Dist-freq.Rmd", "Desc8_Dist-freq.Rmd",
          "aed_boxplot.Rmd"),
  "2" = c("medidas_def.Rmd", "medidas_media_var.Rmd",
          "medidas_media_var_propriedades.Rmd",
          "medidas_media_ponderada.Rmd",
          "medidas_media_cv.Rmd",
          "questao_media_ponderada.Rmd"),
  "1" = c("medidas_dados_agrupados.Rmd",
          "medidas_dados_agrupados2.Rmd"),
  "1" = c("Prob18_Enum.Rmd", "Prob19_Venn.Rmd",
          "Prob20_Venn.Rmd"),
  "1" = c("Prob21_Prod-Prob.Rmd", "Prob22_Prod-Prob.Rmd",
          "Prob23_Teoremas.Rmd", "Prob25_Teoremas.Rmd",
          "Prob26_Teoremas.Rmd"),
  "1" = c("Prob27_Cond.Rmd", "Prob28_Cond.Rmd",
          "questao_cigarro.Rmd"),
  "1" = c("Prob29_Bayes.Rmd", "Prob30_Bayes.Rmd",
          "questao_bayes.Rmd")
)

# --------------------------------------------------
# exams2nops: gera a(s) avaliação(ões) com base no
# objeto lista.questões
# O output é um arquivo no formato pdf
#   Prova com folha de respostas

# fixa semente
semente <- 21092019

set.seed(semente)

exams2nops(file = lista.questoes, # lista com as questões do banco de questões
           n = 5,                 # número de versões da avaliação
           nsamp = as.numeric(names(lista.questoes)), # vetor com o nº de 
           # questões a ser sorteado para cada slot/subarea de lista.questoes
           language = "pt-BR2",   # linguagem da avaliação (ver Observações)
           edir = here("banco_questoes"), # diretório com os arquivos das questões
           logo = here("images", "Logo-40-anos-estatistica.png"), # arquivo do logo
           institution = "UFRGS", # nome da instituição
           title = "Prova 1",     # nome da avaliação
           course = "2219",       # nome do curso
           dir = here("nops_pdf"), # diretório destino do output das avaliações
           name = "mat02219_a1_", # nome do arquivo
           date = "2019-02-01",   # data da avaliação (ano-semestre-area)
           blank = 0,             # nº de folhas em branco para resolução
           duplex = FALSE,        # folhas em branco após folha de respostas (duplica esta folha?)
           encoding = "UTF-8",    # enconding do arquivo: UTF-8 costuma funcionar
           points = rep(x = sum(as.numeric(names(lista.questoes)))/10, # ponto de cada questão: avaliação vale 10 pontos no total
                        times = sum(as.numeric(names(lista.questoes)))), # as questões tem todas o mesmo peso/pontos
           showpoints = TRUE,     # mostra os pontos de cada questão no arquivo da avaliação
           samepage = TRUE,       # força a lista de alternativas a estar na mesma página da questão
           twocolumn = FALSE,     # força o arquivo final a apresentar um única coluna (FALSE) ou duas colunas (TRUE)
           reglength = 8,         # número de algarismos do registro de ID do documento de avaliação (matrícula)
           nchoice = 5            # número de alternativas de cada questão
           )

# --------------------------------------------------
# exams2pdf: gera a(s) solução (ões) da(s) 
# avaliação(ões) com base no
# objeto lista.questões
# O output é um arquivo no formato pdf
#   Prova solucionada

# fixa semente: deve ser a mesma que gerou a prova
set.seed(semente)

exams2pdf(file = lista.questoes, # lista com as questões do banco de questões
          n = 5,                 # número de versões da avaliação
          nsamp = as.numeric(names(lista.questoes)), # vetor com o nº de 
          # questões a ser sorteado para cada slot/subarea de lista.questoes
          language = "pt-BR2",   # linguagem da avaliação (ver Observações)
          edir = here("banco_questoes"), # diretório com os arquivos das questões
          logo = here("images", "Logo-40-anos-estatistica.png"), # arquivo do logo
          institution = "UFRGS", # nome da instituição
          title = "Prova 1",     # nome da avaliação
          course = "2219",       # nome do curso
          dir = here("nops_pdf"), # diretório destino do output das avaliações
          template = here("templates", "solucao.tex"), # template da solução
          name = "mat02219_SOL_a1_", # nome do arquivo
          date = "2019-02-01",   # data da avaliação (ano-semestre-area)
          blank = 0,             # nº de folhas em branco para resolução
          duplex = FALSE,        # folhas em branco após folha de respostas (duplica esta folha?)
          encoding = "UTF-8",    # enconding do arquivo: UTF-8 costuma funcionar
          points = rep(x = sum(as.numeric(names(lista.questoes)))/10, # ponto de cada questão: avaliação vale 10 pontos no total
                       times = sum(as.numeric(names(lista.questoes)))), # as questões tem todas o mesmo peso/pontos
          showpoints = TRUE,     # mostra os pontos de cada questão no arquivo da avaliação
          samepage = TRUE,       # força a lista de alternativas a estar na mesma página da questão
          twocolumn = FALSE,     # força o arquivo final a apresentar um única coluna (FALSE) ou duas colunas (TRUE)
          reglength = 8,         # número de algarismos do registro de ID do documento de avaliação (matrícula)
          nchoice = 5            # número de alternativas de cada questão
)

