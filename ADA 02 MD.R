library(dplyr)
library(plyr)
housesales<-read.csv("tx-house-sales.csv",header = T)
#Ejercicio 1####
#a)
subbasemes<-split(housesales,housesales$month)
#b)
promediomes<-ddply(housesales,c("month"),summarize,mean(sales,na.rm=T))
promediomes
#c)
promediomes1xciudad<-ddply(subbasemes$`1`,c('city'),summarize,mean(sales,na.rm = T))
#Ejercicio 2####
#a)
bd.2a <- housesales %>% 
  filter(sales!="NA")
#b)
bd.2b<-housesales %>%
  filter(sales!="NA") %>%
  group_by(city,year) %>%
  mutate(promedio=mean(volume))
#c)
bd.2c <- housesales %>% 
  filter(month<7) %>% 
  group_by(city, year) %>% 
  mutate(suma=sum(sales, na.rm=T)) %>%  
  arrange(city, desc(suma))

#Ejercicio 3####
angulode2vectores <- function(u=c(),v=c()){
  if(length(u)==3 & length(v)==3){
    productopunto=u%*%v
    normau=sqrt(sum(u^2))
    normav=sqrt(sum(v^2))
    angulo1=acos(productopunto/(normau*normav))
    angulo2=(acos(productopunto/(normau*normav)))*(180/pi)
    cat("El angulo es de", angulo1, "radianes y su equivalente en grados es de",angulo2)
  }else{
    cat("El tamaño del vector es inferior o superior a 3")
  }
}
angulode2vectores(c(3,-1,2),c(-4,0,2))
angulode2vectores(c(1,0,0,4),c(1,0,0,5))
