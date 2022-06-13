#### TRABAJOS_STPS MENSUALMENTE

rm(list = ls())

library(ggplot2)
library(lubridate)
library(tidyverse)
library (readxl)

theme_set(theme_bw())
setwd("/Users/edsonsanchezgonzalez/Documents/Empleabilidad")
df_month <- read_excel("BasedeDatos_Empleo_Columnas1.xlsx")
df_month <- df_month[, c("Date","Aguascalientes","Baja California","BCS","Campeche","Coahuila de Zaragoza","Colima","Chiapas","Chihuahua","CDMX","Durango","Guanajuato","Guerrero","Hidalgo","Jalisco","Mexico","Michoacan","Morelos","Nayarit","Nuevo León","Oaxaca", "Puebla", "Queretaro", "Quintana Roo", "SLP", "Sinaloa", "Sonora", "Tabasco", "Tamaulipas", "Tlaxcala", "Veracruz", "Yucatan", "Zacatecas", "Nacional")]
df_month$Date <- as.Date(df_month$Date)
df_month_2 <- df_month[1:14,]


# labels and breaks for X axis text
##El error es de la "D" mayuscula.

lbls_mont <- paste0(month.abb[month(df_month_2$Date)], " ", lubridate::year(df_month_2$Date))
brks_mont <- df_month_2$Date



# plot
ggplot(df_month_2, aes(x=Date)) +
  geom_line(aes(y=Guanajuato, col="Guanajuato")) + geom_line(aes(y=Nacional, col="Nacional")) +
  labs(title = "Comparación de número de empleos en Guanajuato y a nivel Nacional", x= "Meses",
       subtitle = "Junio 2019 a Julio 2020",
       caption = "STPS. Número de trabajadores asegurados en el IMSS. 
      Disponible en http://www.stps.gob.mx/gobmx/estadisticas/asegurados.htm", y= "Total de Empleos registrados en IMSS") +
  scale_x_date(labels = lbls_mont, breaks = brks_mont) +
  scale_color_manual(name="", values = c("Nacional"="#00ba38", "Guanajuato"="#FF9999","Queretaro"="#F0E442","CDMX"="#9999CC")) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5), panel.grid.minor = element_blank()) +
  scale_y_continuous(breaks = seq(500000,2000000,1000000))
