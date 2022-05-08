library(tidyverse) #manipulação dos dados e filtragem
library(plotly) #plotagem interativa
library(gcookbook) 
library(lubridate)

#importando as bases
dados <- read_csv("dados/mmla.csv")

#renomear variáveis
dados <- dados %>% rename(c("Nervoso"="angry", ))
dados <- dados %>% rename(c("Temeroso"="fearful"))
dados <- dados %>% rename(c("Feliz"="happy"))
dados <- dados %>% rename(c("Triste"="sad"))
dados <- dados %>% rename(c("Surpreso"="surprised"))

#renomeando níveis das variáveis
dados$situacao <- 
  factor(dados$situacao, label = c("Duplas com ganho de aprendizagem", "Duplas sem ganho de aprendizagem"), levels = c("ganho","nao_ganho"))


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
       color="Estados Emocionais", title = "Atividade: Plugada") +
  facet_wrap(~situacao) 







