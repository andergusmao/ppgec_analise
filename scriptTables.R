#material de referencia https://epirhandbook.com/en/simple-statistical-tests.html
library(tidyverse) #pacote para manipular dados
library(gtsummary) #pacote para gerar tabelas
#

#importando a base de dados
dados <- read.csv("ANÁLISE - Questionários_ Atividades - pre&pos&teste_individual.csv")
view(dados)


#tabela simples exemplo
dados %>% 
  select( #aqui ta selecionando todas as variáveis na tabela
    sexo,
    serie,
    estilo_aprendizagem,
    Já.ouviu.sobre.Pensamento.Computacional.antes.dessa.Oficina.,
    Havia.feito.algum.curso.de.programação.ou.robótica.,
    resultado_geral) %>% 
  tbl_summary(
    by = resultado_geral) %>% #o by informa a varilavel ganho e nao ganho
  add_p() #adiciona os p-valores dos testes de qui-quadrado
