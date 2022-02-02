#Ejercicio 1####
Lista<-list(asignatura=c("probabilidad","procesos","actuarial","demografía"),
            calificación=c(70,75,90,60),
            resultado=c("aprobado","aprobado","aprobado","reprobado"))
#Ejercicio 2####
#a)
Ingreso<-c(2015,2015,2016,2017)
Creditos<-c(80,100,90,100)
Semestre<-c("Tercero", "Cuarto", "Tercero", "Cuarto")

datos<-data.frame(Ingreso,Creditos,Semestre)
#b)
str(datos)
#c)
datos2 <- subset(datos, select = "Semestre")
#d)
mean(datos$Creditos)
#Ejercicio 3####
#a)
Temperatura<-factor(c("frio","frio","frio","caliente","caliente","caliente",NA,NA,NA))
Poblacion<-factor(c("Ciudad","Rural",NA,"Ciudad","Rural",NA,"Ciudad","Rural",NA))

datos3<-data.frame(Temperatura,Poblacion)
#b)
datosb<-na.omit(datos3)
#c)
na.omit(datos3["Temperatura"])
#d)
na.omit(datos3["Poblacion"])
#Ejercicio 4####
housesales<-read.csv("tx-house-sales.csv",header = T)
#a)
housesalesmin<-min(housesales$avgprice,na.rm=T)
#b)
library(dplyr)
housesales2<-housesales %>%
  arrange(avgprice)
head(housesales2,1)
#c)
housesales3<-housesales %>%
  arrange(avgprice) %>%
  filter(year>=2000 & year<=2002)
head(housesales3$avgprice,5)
#d)
housesales4<-housesales %>%
  mutate(cociente = avgprice/volume )
