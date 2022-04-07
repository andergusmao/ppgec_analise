library(tidyverse)
library(ggplot2)

#carregando a base de dados geral
plugada <- read.csv("mmla/dupla 1/plugada_01.csv")
view(plugada)

#plotando o gráfico do ganho e não ganho do pré e pós teste 

plugada %>% ggplot(x = person, fill = happy) + geom_abline()
