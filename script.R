#token
#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


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

#plotando o gráfico de estilo de aprendizagem geral 
dados %>% ggplot(aes(resultado_geral, ganho_geral, color=estilo_aprendizagem)) + 
  geom_boxplot(alpha=0.3) + geom_jitter() +
  labs(x=NULL, y=NULL, title='Ganho de Aprendizagem Geral', color='Estilo de Aprendizagem')+
  theme_minimal()

#plotando o gráfico do ganho e não ganho do conteúdo sequência
dados %>% ggplot(aes(resultado_sequencia, ganho_sequencia, fill=resultado_sequencia, color=resultado_sequencia)) + 
  geom_boxplot(alpha=0.3) + geom_jitter() +
  labs(x=NULL, y=NULL, title='Ganho de Aprendizagem do Conteúdo: Sequência', fill=NULL, color=NULL)+
  theme_minimal()


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