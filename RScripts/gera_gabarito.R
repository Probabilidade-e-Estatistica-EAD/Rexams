# --------------------------------------------------
# Carregando pacotes

library(exams)
library(here)

# --------------------------------------------------
# Gabarito

gabarito <- readRDS(file = here("nops_pdf", "mat02219_a1_.rds"))
gabarito <- exams_metainfo(gabarito)

print(gabarito, 1)
print(gabarito, 2)
print(gabarito, 3)
print(gabarito, 4)
print(gabarito, 5)
