library(tidyverse) #manipulação dos dados e filtragem
library(plotly) #plotagem interativa
library(gcookbook) 
library(lubridate)

#importando as bases
dados <- read_csv("mmla.csv")


#renomear variáveis
dados <- dados %>% rename(c("Nervoso"="angry", ))
dados <- dados %>% rename(c("Temeroso"="fearful"))
dados <- dados %>% rename(c("Feliz"="happy"))
dados <- dados %>% rename(c("Triste"="sad"))
dados <- dados %>% rename(c("Surpreso"="surprised"))

#renomeando níveis das variáveis
dados$situacao <- 
  factor(dados$situacao, label = c("Estudantes que Teve Ganho de aprendizagem", "Estudantes que Não Teve Ganho de aprendizagem"), levels = c("ganho","nao_ganho"))


#### PLOTANDO OS GRÁFICOS ####

#estados emocionais para a atividade plugada
dados %>% 
  filter(abordagem == "plugada") %>% 
  gather("Nervoso",
         "Temeroso",
         "Feliz",
         "Surpreso",
         key = emocoes, value = probabilidades) %>%
  ggplot(aes(frame, probabilidades, color = emocoes)) +
  geom_smooth(alpha=0.5) + 
  labs(x="Frames da atividade", y="Probabilidades", 
       color="Estados Emocionais", ) +
  facet_wrap(~situacao) 


#estados emocionais para a atividade plugada
dados %>% 
  filter(abordagem == "plugada") %>% 
  filter(participantes != "monitor") %>% 
  drop_na() %>%
  gather("Nervoso",
         "Temeroso",
         "Feliz",
         "Surpreso",
         key = emocoes, value = probabilidades) %>%
  ggplot(aes(frame, probabilidades, color = emocoes)) +
  geom_smooth(alpha=0.5) + 
  labs(x="Frames da atividade", y="Probabilidades", 
       color="Estados Emocionais", ) +
  facet_wrap(~situacao) 


#estados emocionais para a atividade robotica
dados %>% 
  filter(abordagem == "robotica") %>% 
  gather("Nervoso",
         "Temeroso",
         "Feliz",
         "Surpreso",
         key = emocoes, value = probabilidades) %>%
  ggplot(aes(frame, probabilidades, color = emocoes)) +
  geom_smooth(alpha=0.5) + 
  labs(x="Frames da atividade", y="Probabilidades", 
       color="Estados Emocionais") +
  facet_wrap(~situacao) 


#estados emocionais para a atividade robotica
dados %>% 
  filter(abordagem == "robotica") %>% 
  filter(participantes != "monitor") %>% 
  drop_na() %>%
  gather("Nervoso",
         "Temeroso",
         "Feliz",
         "Surpreso",
         key = emocoes, value = probabilidades) %>%
  ggplot(aes(frame, probabilidades, color = emocoes)) +
  geom_smooth(alpha=0.5) + 
  labs(x="Frames da atividade", y="Probabilidades", 
       color="Estados Emocionais" ) +
  facet_wrap(~situacao) 




