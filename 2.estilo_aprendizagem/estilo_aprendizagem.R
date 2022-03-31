library(tidyverse)
library(ggplot2)

#estilo de aprendizagem
setwd('/home/anderson/Documentos/analise/2.estilo_aprendizagem/')
dados <- read.csv("estilo_aprendizagem.csv")
view(dados)


dados %>% ggplot(aes(resultado, houve_ganho, color=estilo_aprendizagem)) + 
  geom_boxplot(alpha=0.3) + geom_jitter() +
  labs(x=NULL, y=NULL, title='Ganho de Aprendizagem', color='Estilo de Aprendizagem')+
  theme_minimal()

