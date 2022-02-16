edidiv <- read.csv("~/TODO/RESPALDAR/2020_HACER/Doctorado/UAEM/2020/NuevoTramite/Logistica/Clases/R-2022/Manipulacion-Datos/Tutorial-3/edidiv.csv")
#esta es la ruta donde se guardó la base de datos en mi compu
head(edidiv) #"Muestra las primeras filas"
tail (edidiv)# Muestra las ultimas filas
str(edidiv) # Muestra la estructura de las variables (entero, continuo, categórico, caracter)
head(edidiv$taxonGroup)
class(edidiv$taxonGroup)
edidiv$taxonGroup<-as.factor((edidiv$taxonGroup))
class(edidiv$taxonGroup) 
#¿qué clase tiene ahora? Factor
edidiv$year
class(edidiv$year)
edidiv$year
edidiv$year <- as.factor(edidiv$year)
class(edidiv$year)
Beetle<-filter(edidiv, taxonGroup == "Beetle")
Bird <- filter(edidiv, taxonGroup == "Bird") #Ahora realiza estos pasos para TODOS los taxones en los datos
Butterfly <- filter(edidiv, taxonGroup == "Butterfly")
Dragonfly <- filter(edidiv, taxonGroup == "Dragonfly")
Flowering.Plants <- filter(edidiv, taxonGroup == "Flowering.Plants")
Fungus <- filter(edidiv, taxonGroup == "Fungus")
Hymenopteran <- filter(edidiv, taxonGroup == "Hymenopteran")
Lichen <- filter(edidiv, taxonGroup == "Lichen")
Liverwort <- filter(edidiv, taxonGroup == "Liverwort")
Mammal <- filter(edidiv, taxonGroup == "Mammal")
Mollusc <- filter(edidiv, taxonGroup == "Mollusc")
levels(edidiv$taxonGroup)
#estos son los grupos de la base de datos: "Beetle"           "Bird"             "Butterfly"        "Dragonfly"        "Flowering.Plants" "Fungus"          
#"Hymenopteran"     "Lichen"           "Lichen"        "Mammal"           "Mollusc"
a <- length(unique(Beetle$taxonName))
b <- length(unique(Bird$taxonName))
#Si escribes a (o como hayas nombrado tus variables de conteo) en la consola, ¿qué devuelve? 37L para a y 86L para b
#¿Qué significa eso? el número de especies en a para aves y en b para escarabajos
c <- length(unique(Butterfly$taxonName))
d <- length(unique(Dragonfly$taxonName))
e <- length(unique(Flowering.Plants$taxonName))
f <- length(unique(Fungus$taxonName))
g <- length(unique(Hymenopteran$taxonName))
h <- length(unique(Lichen$taxonName))
i <- length(unique(Liverwort$taxonName))
j <- length(unique(Mammal$taxonName))
k <- length(unique(Mollusc$taxonName))
#Beetle= 37, Bird=86, Butterfly=25,Dragonfly=11,Flowering.Plants=521 , Fungus= 219,
#Hymenopteran=112 Lichen=94, 
#Liverwort=40, Mammal=33, Mollusc=97
biodiv <- c(a,b,c,d,e,f,g,h,i,j,k)
names(biodiv) <- c("Beetle", 
                   "Bird", 
                   "Butterfly", 
                   "Dragonfly", 
                   "Flowering.Plants", 
                   "Fungus", 
                   "Hymenopteran", 
                   "Lichen", 
                   "Liverwort", 
                   "Mammal", 
                   "Mollusc")
barplot(biodiv)
png("barplot.png", width=1600, height=600)
barplot(biodiv, xlab="Taxa", ylab="Number of species", ylim=c(0,600), cex.names= 1.5, cex.axis=1.5, cex.lab=1.5)
dev.off()
getwd()
taxa <- c("Beetle", 
          "Bird", 
          "Butterfly", 
          "Dragonfly", 
          "Flowering.Plants", 
          "Fungus", 
          "Hymenopteran",
          "Lichen", 
          "Liverwort", 
          "Mammal", 
          "Mollusc")
taxa_f <- as.factor(taxa)
richness <- c("37",
              "86",
              "25",
              "11",
              "521",
              "219",
              "112",
              "94",
              "40",
              "33",
              "97")
biodata <- data.frame(taxa_f, richness)
write.csv(biodata, file="biodata.csv")
biodata <- read.csv("C:/Users/Roberto.LAPTOP-JH51I47J/Documents/biodata.csv")
barplot(biodata$richness, names.arg=c("Beetle", 
                                      "Bird", 
                                      "Butterfly", 
                                      "Dragonfly", 
                                      "Flowering.Plants", 
                                      "Fungus", 
                                      "Hymenopteran", 
                                      "Lichen", 
                                      "Liverwort", 
                                      "Mammal", 
                                      "Mollusc"), 
        xlab="Taxa", ylab="Number of species", ylim=c(0,600))
#Ejercicio
Aves_Enver <- read.csv("~/TODO/RESPALDAR/2020_HACER/Doctorado/UAEM/2020/NuevoTramite/Logistica/Clases/R-2022/Manipulacion-Datos/Tutorial-3/Aves_Enver.csv")
tapply(Aves_Enver$wingspan,Aves_Enver$bird_sp , mean) #"Para obtener las medias por cada clase"
aggregate(Aves_Enver$wingspan , list(Aves_Enver$bird_sp), mean) #para obtener la media
#por cada clase, pero en forma de lista 
barplot(tapply(Aves_Enver$wingspan,Aves_Enver$bird_sp , mean))
#En este caso, llamé a la base de datos Aves_Enver y nombré a las variables con los nombres 
#que aparecen en el las instrucciones
