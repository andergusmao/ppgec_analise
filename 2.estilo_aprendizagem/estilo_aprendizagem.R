library(tidyverse)
library(readxl)

#carregando a base de dados
dados <- read_xlsx("2.estilo_aprendizagem/estilo_aprendizagem.xlsx")

#plotando o gráfico de estilo de aprendizagem
dados %>% ggplot(aes(resultado, houve_ganho, color=estilo_aprendizagem)) + 
  geom_boxplot(alpha=0.3) + geom_jitter() +
  labs(x=NULL, y=NULL, title='Ganho de Aprendizagem', color='Estilo de Aprendizagem')+
  theme_minimal()

