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
# library(tinytex)  # para instalar dsit. latex 

# --------------------------------------------------
# Especificando a lista de questões para a geração
# da atividade de avaliação
#     objeto do tipo lista
#     o nome do slot corresponde ao número de
#     questões a ser sorteado do slot/subarea

lista.questoes <- list(
  "1" = c("2_1_esperanca_desvio_defeito_sistema_facil.Rmd",
          # "2_1_esperanca_florista_dificil.Rmd",
          "2_1_esperanca_variancia_empresa_robos_facil.Rmd",
          "2_1_val_esperado_acoes_facil_econ_adm_aleat.Rmd",
          "2_1_val_esperado_moeda_facil_sem_area_aleat.Rmd",
          "2_1_val_esperado_moeda2_facil_sem_area_aleat.Rmd",
          "2_1_valoresperado_acoes_facil_econ_adm_aleat.Rmd",
          "2_1_variancia_urna_facil_sem_area_aleat.Rmd",
          "2_1_desv_padrao_facil_teorica.Rmd"),
  "1" = c("2_1_bernoulli_binom_poisson_eng_dificil_aleat.Rmd",
    "2_1_binom_poisson_dificil_eng_aleat.Rmd",
    "2_1_hipergeometrica_placas_de_video_dificil.Rmd"),
  "1" = c("2_1_poisson_consulta_banco_dados_facil.Rmd",
    "2_1_poisson_erro_bits_facil.Rmd",
    "2_1_poisson_mensagens_servidor_facil.Rmd",
    "2_1_poisson_requisicoes_sistema_facil.Rmd",
    "2_1_processo_poisson_fila_mercado_dificil_econ_adm_aleat.Rmd"),
  "1" = c("2_2_densidade_integra_um_facil_sem_area_aleat.Rmd",
          "2_2_densidade_probabilidade_facil_sem_area_aleat.Rmd",
          "2_2_prob_densidade_banco_dados_dificil.Rmd",
          "2_2_prob_funcao_densidade_trava_seguranca_medio_eng_aleat.Rmd"),
  "1" = c("2_2_exponencial_banco_dados_dificil.Rmd",
          "2_2_exponencial_transistor_facil.Rmd"),
  "1" = c("2_2_agua_normal_facil.Rmd",
    "2_2_normal_calculo_direto_facil.Rmd",
    "2_2_normal_concursoprova_dificil_sem_area_aleat.Rmd",
    "2_2_normal_estoque_dificil.Rmd",
    "2_2_normal_massa_notebook_facil.Rmd",
    "2_2_normal_n_prob_dificil_biol_saud_aleat.Rmd",
    "2_2_normal_prob_agua_facil_biol_saud_aleat.Rmd",
    "2_2_normal_prob_basquete_facil_biol_saud_aleat.Rmd"),
  "1" = c("2_3_normal_amostra_erropadrao_lampada_facil_eng_aleat.Rmd",
    "2_3_normal_amostra_media_desconhecida_leite_em_po_dificil_eng_aleat.Rmd",
    "2_3_xbarra_normal_padrao_sem_area_medio_aleat.Rmd",
    "2_3_IC_tcl_normal_padrao_medio_sem_area_aleat.Rmd"),
  "2" = c("2_4_IC-mediapop_sigmaconhecido_facil_sem_area_aleat.Rmd",
    "2_4_IC_media_automoveis_facil_econ_adm_aleat.Rmd",
    "2_4_IC_media_banco_dados_facil.Rmd"),
  "1" = c("2_4-tamanho-amostra-p-conhecido-facil.Rmd",
          "2_4-tamanho-amostra-p-desconhecido-facil.Rmd")
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
           n = 5, # número de versões da avaliação
           nsamp = as.numeric(names(lista.questoes)), # vetor com o nº de 
           # questões a ser sorteado para cada slot/subarea de lista.questoes
           language = "pt-BR2",   # linguagem da avaliação (ver Observações)
           edir = here("questoes_area2"), # diretório com os arquivos das questões
           logo = here("images", "Logo-40-anos-estatistica.png"), # arquivo do logo
           institution = "UFRGS", # nome da instituição
           title = "Prova 2",     # nome da avaliação
           course = "2219",       # nome do curso
           dir = here("prova2"), # diretório destino do output das avaliações
           name = "mat02219_a2_", # nome do arquivo
           date = "2019-02-02",   # data da avaliação (ano-semestre-area)
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
          edir = here("questoes_area2"), # diretório com os arquivos das questões
          logo = here("images", "Logo-40-anos-estatistica.png"), # arquivo do logo
          institution = "UFRGS", # nome da instituição
          title = "Prova 2",     # nome da avaliação
          course = "2219",       # nome do curso
          dir = here("prova2"), # diretório destino do output das avaliações
          template = here("templates", "solucao.tex"), # template da solução
          name = "mat02219_SOL_a2_", # nome do arquivo
          date = "2019-02-02",   # data da avaliação (ano-semestre-area)
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

