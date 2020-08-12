library(exams)
library(tidyverse)
library(tinytex)

# list.files(path = exams2pdf("./questoes_area1"))

# muda o diretorio
setwd("./questoes_area1")

# pre visualizar questao e solucao
exams2pdf("1_1_amostra_facil.Rmd") # em formato pdf, erro "File `Sweave.sty' not found." 
exams2html("1_1_amostra_facil.Rmd") # formato html
exams2moodle("1_1_amostra_facil.Rmd") # formato xml, para importar no moodle... o arquivo gerado esta na pasta 'questoes_area1'


# tente com outras questoes
exams2pdf("1_1_classifica_variavel_2_facil.Rmd") #OK
exams2pdf("1_1_classifica_variavel_3_facil.Rmd") #OK
