library(tidyverse)


#ganho e não ganho
#setwd('/home/anderson/Documentos/analise/')
dados <- read.csv("ANÁLISE - Questionários_ Atividades - ganho_naoganho.csv")
view(dados)


dados %>% 
  ggplot(aes(resultado, houve_ganho, fill=resultado, color=resultado)) + 
  geom_boxplot(alpha=0.5) + 
  geom_jitter()



dados %>% ggplot(aes(x=houve_ganho, y=geral)) + 
  geom_boxplot(fill='brown4', alpha=0.1, width=.5)+
  stat_summary(fun=mean, geom = 'point', col='brown4', shape=8)+
  labs(x=NULL, y='Pré e Pós', title='Resultado do Pré e Pós Teste')+
  theme_minimal()

dados %>% ggplot(aes(x = resultado, y = pre_teste_geral, pos_teste_geral))+ 
  geom_boxplot(fill='brown4', alpha=0.1, width=.5)+
  stat_summary(fun=mean, geom = 'point', col='brown4', shape=8)+
  labs(x=NULL, y='Pré e Pós', title='Resultado do Pré e Pós Teste')+
  theme_minimal()





#importar os dados
setwd('/home/anderson/Documentos/analise/')
dados <- read.csv("ANÁLISE - Questionários_ Atividades - index.csv")
view(dados)

#construindo os boxplots

#geral
dados %>% ggplot(aes(x = tipo_teste, fill = geral))+ 
  geom_boxplot(fill='brown4', alpha=0.1, width=.5)
#+  stat_summary(fun=mean, geom = 'point', col='brown4', shape=8)+  labs(x=NULL, y='Experiência Ativa', title='Estilo de Aprendizagem')+  theme_minimal()

#perfil dos estudantes
dados %>% ggplot(aes(x = estilo_aprendizagem, y = exp_ativa..x_1q.))+ 
  geom_boxplot(fill='brown4', alpha=0.1, width=.5)+
  stat_summary(fun=mean, geom = 'point', col='brown4', shape=8)+
  labs(x=NULL, y='Experiência Ativa', title='Estilo de Aprendizagem')+
  theme_minimal()


dados %>% ggplot(aes(x = estilo_aprendizagem, y = exp_concreta..y_2q.))+ 
  geom_boxplot(fill='brown4', alpha=0.1, width=.5)+
  stat_summary(fun=mean, geom = 'point', col='brown4', shape=8)+
  labs(x=NULL, y='Experiência Concreta', title='Estilo de Aprendizagem')+
  theme_minimal()

dados %>% ggplot(aes(x = estilo_aprendizagem, y = obs_reflexiva..x_3q.))+ 
  geom_boxplot(fill='brown4', alpha=0.1, width=.5)+
  stat_summary(fun=mean, geom = 'point', col='brown4', shape=8)+
  labs(x=NULL, y='Observação Reflexiva', title='Estilo de Aprendizagem')+
  theme_minimal()


dados %>% ggplot(aes(x = estilo_aprendizagem, y = con_abstrata.y_4q.))+ 
  geom_boxplot(fill='brown4', alpha=0.1, width=.5)+
  stat_summary(fun=mean, geom = 'point', col='brown4', shape=8)+
  labs(x=NULL, y='Conceituação Abstrata', title='Estilo de Aprendizagem')+
  theme_minimal()

#construir os testes
wilcox.test(dados$geral~dados$tipo_teste)
