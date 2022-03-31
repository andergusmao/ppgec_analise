library(tidyverse)
library(ggplot2)

#ganho e não ganho
setwd('/home/anderson/Documentos/analise/')
dados <- read.csv("ganho_naoganho.csv")
view(dados)


dados %>% ggplot(aes(resultado, houve_ganho, fill=resultado, color=resultado)) + 
  geom_boxplot(alpha=0.3) + geom_jitter() +
  labs(x=NULL, y=NULL, title='Ganho de Aprendizagem')+
  theme_minimal()

