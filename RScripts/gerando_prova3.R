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

#lista_questoes3=list.files(path = "questoes_area3")   # listas as questoes da prova
#setwd("/cloud/project/questoes_area3") ## manda mduar o diretorio
#write.table(lista_questoes3, file = "lista_questoes3.txt", sep = "\t", row.names = FALSE)   #### salva o arquivo com os nomes das questoes


# --------------------------------------------------
# Especificando a lista de questões para a geração
# da atividade de avaliação
#     objeto do tipo lista
#     o nome do slot corresponde ao número de
#     questões a ser sorteado do slot/subarea

lista.questoes <- list(
  ### 1 - Tipo de erro, p-valor e alfa #####
  "1" = c("3_1_erro_tipo_dois_facil.Rmd",
          "3_1_erro_tipo_um_facil.Rmd",
          "3_1_erros_tipo_um_e_dois.Rmd",
          "3_1_tipo_erro_facil.Rmd",
          "3_1_p_valor_alpha_facil.Rmd",
          "3_1_teste_p_valor_alfa_facil.Rmd",
          "3_1_decisao_valor_p_pesquisador_facil.Rmd"),    
  ### 2 - Teste - teoria e hipóteses #####
  "1" = c("3_1_teste_hipotese_teorica_facil.Rmd",
          "3_1_teste_hipotese_teorica2_facil.Rmd",
          "3_2_tipos_de_testes_medio.Rmd",
          "3_x_tudo_muitodificil.Rmd",
          "3_1_classificar_teste_processador_programa_facil.Rmd",
          "3_1_construir_hipoteses_CPDs_facil.Rmd"), 
  ### 3 - Teste 1 média #####
  "1" = c("3_2_estatistica_t_facil.Rmd",
          "3_2_montagem_teste_media_facil.Rmd",
          "3_2_teste_media_facil.Rmd",
          "3_2_teste_t_dificil.Rmd",
          "nao_usar_essa_3_2_estatistica_t_alfa_medio.Rmd",
          "3_2_teste_media_banco_dados_dificil.Rmd"),
  ## 4 - Teste 2 médias ##
  "1" = c("3_1_intervalo_de_confianca_medio.Rmd",
          "3_2_teste_duas_medias_pareadas_facil.Rmd",
          "3_2_teste_duas_medias_valor_facil.Rmd",
          "3_2_teste_t_diferenca_medias_dificil.Rmd",
          "3_2_teste_media_duas_pop_sistemasAB_dificil.Rmd"),
  ##### 5 - p-valor: cálculo - média ou proporção #####
  "1" = c("3_2_valor_probabilistico_dificil.Rmd",
          "3_2_valor_probabilistico_duas_medias_dificil.Rmd",
          "3_2_valor_probabilistico_facil.Rmd",
          "3_4_nivel_sign_proporcao_dificil.Rmd",
          "3_4_nivel_sign_proporcao2_dificil.Rmd"),
  ### 6 - Teste variância  ##########
  "1" = c("3_3_teste_homogeneidade_variancia_notebooks_dificil.Rmd",
          "3_3_teste_variancia_banco_dados_dificil.Rmd",
          "3_3_teste_variancia_netbooks_facil.Rmd"),
  ### 7 - Teste proporção #############
  "1" = c("3_4_erro_padrao_proporcoes_facil.Rmd",
          "3_4_teste_proporcao_facil.Rmd",
          "3_1_valor_esperado_IA_facil.Rmd",
          "3_4_teste_duas_prop_intel_facil.Rmd",
          "3_4_teste_prop_consoles_dificil.Rmd",
          "3_4_teste_prop_fones_ouvido_facil.Rmd",
          "3_4_teste_prop_placas_mae_dificil.Rmd",
          "3_4_teste_prop_robos_dificil.Rmd"),
  ### 8 - correlação - cálculo ou teste ##############
  "1" = c("3_5_calculo_coeficiente_memoria_RAM_dificil.Rmd",
          "3_5_calculo_coeficiente_pais_filhos_facil.Rmd",
          "3_5_estatistica_de_teste_correlacao_facil.Rmd",
          "3_5_hipoteses_correlacao_facil.Rmd"),
   ###### 9 - correlação/regressão - interpretação #######
  "1" = c("3_5_teste_correlacao_facil.Rmd",
          "3_5_classifica_coeficiente_facil.Rmd",
          "3_6_coeficiente_de_inclinacao_medio.Rmd",
          "3_6_reta_regressao_facil.Rmd",
          "3_6_reta_regressao2_facil.Rmd",
          "3_6_classifica_variavel_dependente_independente_facil.Rmd",
          "3_6_funcao_sistema_sorvete_facil.Rmd"),              
  ###### 10 - regressão - cálculo #######
  "1" = c("3_6_calculo_alpha_beta_CPU_facil.Rmd",
          "3_6_calculo_reta_comprimento_cabo_facil.Rmd",
          "3_6_calculo_reta_erros_digitadores_facil.Rmd",
          "3_6_calculo_reta_viagem_facil.Rmd",
          "3_6_modelo_linear_leite_dificil.Rmd")
)

# --------------------------------------------------
# exams2nops: gera a(s) avaliação(ões) com base no
# objeto lista.questões
# O output é um arquivo no formato pdf
#   Prova com folha de respostas

# fixa semente
semente <- 201902

set.seed(semente)

exams2nops(file = lista.questoes, # lista com as questões do banco de questões
           n = 8,                 # número de versões da avaliação
           nsamp = as.numeric(names(lista.questoes)), # vetor com o nº de 
           # questões a ser sorteado para cada slot/subarea de lista.questoes
           language = "pt-BR2",   # linguagem da avaliação (ver Observações)
           edir = here("questoes_area3"), # diretório com os arquivos das questões
           logo = here("images", "Logo-40-anos-estatistica.png"), # arquivo do logo
           institution = "UFRGS", # nome da instituição
           title = "Prova 3",     # nome da avaliação
           course = "2219",       # nome do curso
           dir = here("prova3"), # diretório destino do output das avaliações
           name = "mat02219_a3_", # nome do arquivo
           date = "2019-02-03",   # data da avaliação (ano-semestre-area)
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
          n = 8,                 # número de versões da avaliação
          nsamp = as.numeric(names(lista.questoes)), # vetor com o nº de 
          # questões a ser sorteado para cada slot/subarea de lista.questoes
          language = "pt-BR2",   # linguagem da avaliação (ver Observações)
          edir = here("questoes_area3"), # diretório com os arquivos das questões
          logo = here("images", "Logo-40-anos-estatistica.png"), # arquivo do logo
          institution = "UFRGS", # nome da instituição
          title = "Prova 3",     # nome da avaliação
          course = "2219",       # nome do curso
          dir = here("prova3"), # diretório destino do output das avaliações
          #template = here("templates", "solucao.tex"), # template da solução
          name = "mat02219_SOL_a3_", # nome do arquivo
          date = "2019-02-03",   # data da avaliação (ano-semestre-area)
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

