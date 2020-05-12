library(exams)
library(tidyverse)

list.files(path = exams2pdf("questoes_area1"))

setwd("/questoes_area1")
exams2pdf("1_1_amostra_facil.Rmd") #OK
exams2pdf("1_1_classifica_variavel_2_facil.Rmd") #OK
exams2pdf("1_1_classifica_variavel_3_facil.Rmd") #OK
