#gitcreds::gitcreds_set()

library(tidyverse)

#plotando o gráfico do desempenho individual do pré e pós teste
dados <- read.csv("ANÁLISE - Questionários_ Atividades - pre&pos&teste_individual.csv")
view(dados)

dados %>% ggplot(aes(resultado_geral, ganho_geral, 
                    fill = resultado_geral, color = resultado_geral)) + 
  geom_errorbar(stat = "boxplot", width = 0.2, 
                position = position_dodge(width = 0.6)) +
  geom_boxplot(width = 0.6, alpha = 0.1, outlier.color = NA,
               outlier.shape = 1, outlier.size = 2) +
  geom_jitter(alpha = 0.6, height = 0, width = 0.29,
              color = "black") +
  labs(y = NULL, x = NULL, fill = NULL, 
       color = NULL ) + 
  theme_minimal() + 
  theme(legend.position = "bottom") +
  stat_summary(fun = mean, geom = 'point', 
               col='brown4', shape=8)





#plotando o gráfico das habilidades de PC
h_pc <- read.csv("ANÁLISE - Questionários_ Atividades - habilidades_pc_individual.csv")
view(h_pc)

#title='Abstração'
h_pc %>% ggplot(aes(tipo_teste, abstracao, 
                     fill = situacao, color = situacao)) + 
  geom_errorbar(stat = "boxplot", width = 0.2, 
                position = position_dodge(width = 0.6)) +
  geom_boxplot(width = 0.6, alpha = 0.1, outlier.color = NA,
               outlier.shape = 1, outlier.size = 2) +
  geom_jitter(alpha = 0.6, height = 0, width = 0.29,
              color = "black") +
  labs(y = NULL, x = NULL, fill = NULL, 
       color = NULL ) + 
  theme_minimal() + 
  theme(legend.position = "bottom")



#title='Decomposição'
h_pc %>% ggplot(aes(tipo_teste, decomposicao, 
                    fill = situacao, color = situacao)) + 
  geom_errorbar(stat = "boxplot", width = 0.2, 
                position = position_dodge(width = 0.6)) +
  geom_boxplot(width = 0.6, alpha = 0.1, outlier.color = NA,
               outlier.shape = 1, outlier.size = 2) +
  geom_jitter(alpha = 0.6, height = 0, width = 0.29,
              color = "black") +
  labs(y = NULL, x = NULL, fill = NULL, 
       color = NULL ) + 
  theme_minimal() + 
  theme(legend.position = "bottom")



#title='Reconhecimento de Padrões'
h_pc %>% ggplot(aes(tipo_teste, reconhecimento_de_padroes, 
                    fill = situacao, color = situacao)) + 
  geom_errorbar(stat = "boxplot", width = 0.2, 
                position = position_dodge(width = 0.6)) +
  geom_boxplot(width = 0.6, alpha = 0.1, outlier.color = NA,
               outlier.shape = 1, outlier.size = 2) +
  geom_jitter(alpha = 0.6, height = 0, width = 0.29,
              color = "black") +
  labs(y = NULL, x = NULL, fill = NULL, 
       color = NULL ) + 
  theme_minimal() + 
  theme(legend.position = "bottom")



#title='Algoritmo'
h_pc %>% ggplot(aes(tipo_teste, algoritmo, 
                    fill = situacao, color = situacao)) + 
  geom_errorbar(stat = "boxplot", width = 0.2, 
                position = position_dodge(width = 0.6)) +
  geom_boxplot(width = 0.6, alpha = 0.1, outlier.color = NA,
               outlier.shape = 1, outlier.size = 2) +
  geom_jitter(alpha = 0.6, height = 0, width = 0.29,
              color = "black") +
  labs(y = NULL, x = NULL, fill = NULL, 
       color = NULL ) + 
  theme_minimal() + 
  theme(legend.position = "bottom")





 #plotando o gráfico do Perfil do Estudante com Teve Ganho e Não Teve
# Library

library(fmsb)
perfil <- read.csv("ANÁLISE - Questionários_ Atividades - pre&pos&teste_individual.csv")

perfil <- as.data.frame(matrix(sample( 2:20 , 10 , replace=T) , ncol=4))
colnames(perfil) <- c("Acomodador" , "Assimilador" , "Convergente" , "Divergente")

perfil <- rbind(rep(25,10) , rep(0,10) , perfil)

# Check your data, it has to look like this!
# head(data)

# Custom the radarChart !
radarchart( perfil  , axistype=1 , 
            
            #custom polygon
            pcol=rgb(0.2,0.5,0.5,0.9) , pfcol=rgb(0.2,0.5,0.5,0.5) , plwd=4 , 
            
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8,
            
            #custom labels
            vlcex=0.8 
)



#Nuvem de Palavras
library(wordcloud)
library(RColorBrewer)

nuvem = read.csv("5.wordcloud/ganho/plug_01mp3.txt", header=T, sep = ";")

wordcloud(words = nuvem$palavra, freq = nuvem$frequencia)



#construir os testes
wilcox.test(dados$geral~dados$tipo_teste)