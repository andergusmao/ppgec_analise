library(tidyverse)
library(readxl)

#carregando a base de dados
dados <- read_xlsx("1.ganho_naoganho/ganho_naoganho.xlsx")


#plotando o gráfico de estilo de aprendizagem
dados %>% ggplot(aes(resultado, houve_ganho, fill=resultado, color=resultado)) + 
  geom_boxplot(alpha=0.3) + geom_jitter() +
  labs(x=NULL, y=NULL, title='Ganho de Aprendizagem')+
  theme_minimal()

