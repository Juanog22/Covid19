#COVID DATA ANALYSIS
library(tidyverse)
library(readr)
library(rmarkdown)
library(purrr)

df <- read_csv("https://raw.githubusercontent.com/datadista/datasets/master/COVID%2019/ccaa_covid19_datos_sanidad_nueva_serie.csv")

spec(df)
glimpse(df)

#change date types
df = df %>% 
  mutate(Casos = as.integer(Casos)) %>% 
  mutate(Fallecidos = as.integer(Fallecidos)) %>% 
  mutate(Hospitalizados = as.integer(Hospitalizados)) %>% 
  mutate(UCI = as.integer(UCI))

# split date by year, month and day 
df = df %>% 
  mutate(Fecha_completa = Fecha) %>% 
  separate(Fecha, c("Year", "Month", "Day"), sep="-") %>% 
  filter(CCAA != "No consta")

#Cod_ine hace referencia a cada comunidad autónoma
 
# VISUALIZACIÓN
comunidad <- "Andalucía"
  
ggplot(df %>% filter(CCAA == comunidad)) +
  geom_line(mapping = aes(Fecha_completa, UCI))
  #geom_smooth(mapping = aes(Fecha_completa, Casos))
ggplot(df %>% filter(CCAA == comunidad)) +
  geom_line(mapping = aes(Fecha_completa, Casos))


df <- read_csv("https://raw.githubusercontent.com/datadista/datasets/master/COVID%2019/ccaa_covid19_datos_sanidad_nueva_serie.csv")
df = df %>% 
  mutate(Casos = as.integer(Casos)) %>% 
  mutate(Fallecidos = as.integer(Fallecidos)) %>% 
  mutate(Hospitalizados = as.integer(Hospitalizados)) %>% 
  mutate(UCI = as.integer(UCI))%>% 
  mutate(Fecha_completa = Fecha) %>% 
  separate(Fecha, c("Year", "Month", "Day"), sep="-") %>% 
  filter(CCAA != "No consta")

df %>%
  filter(
    CCAA == 'Andalucía',
    Fecha_completa > as.POSIXct("2021-01-01")  & Fecha_completa < as.POSIXct("2022-01-01")
    )

df %>% 
  select(Casos, Fecha_completa, CCAA)

rev(names(df))[1]

df

output = "Casos"
df$output

df["Casos"] %>% pull(-1)





  
