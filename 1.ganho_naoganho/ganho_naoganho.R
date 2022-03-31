library(tidyverse)

#carregando a base de dados geral
dados <- read.csv("ANÁLISE - Questionários_ Atividades - ganho_naoganho.csv")
view(dados)

#plotando o gráfico do ganho e não ganho do pré e pós teste
dados %>% ggplot(aes(resultado_geral, ganho_geral, fill=resultado_geral, color=resultado_geral)) + 
  geom_boxplot(alpha=0.3) + geom_jitter() +
  labs(x=NULL, y=NULL, title='Ganho de Aprendizagem do Pré e Pós Teste', fill=NULL, color=NULL)+
  theme_minimal()

#plotando o gráfico do ganho e não ganho do pré e pós teste por sexo
dados %>% ggplot(aes(resultado_geral, ganho_geral, fill=sexo)) + 
  geom_boxplot(alpha=0.3) + geom_jitter() +
  labs(x=NULL, y=NULL, title='Ganho de Aprendizagem do Pré e Pós Teste por Sexo', fill='Sexo', color=NULL)+
  theme_minimal()
