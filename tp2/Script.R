#Exercice 1
library(readxl)
pokemon <- read_excel("GitHub/programmation_r/tp2/pokemon.xlsx", sheet = "pokemon",)
attach(pokemon)
dim(pokemon)
names(pokemon)
str(pokemon)

generation <- as.factor(generation)
is_legendary <- as.factor(is_legendary)
type <- as.factor(type)
levels(generation)
levels(is_legendary)
levels(type)
summary(pokemon)

#Exercice 2

mean(weight_kg, na.rm=TRUE)
median(weight_kg, na.rm=TRUE)
quantile(height_m, na.rm = TRUE)
quantile(height_m, seq(0,1,0.1), na.rm = TRUE)
var(weight_kg, na.rm = TRUE)
sd(weight_kg, na.rm = TRUE)

factor_columns = names(Filter(is.factor, pokemon))
aggregate(pokemon, by = generation, FUN=length) #ne marche pas

#Exercice 3

requete_a = pokemon[c('nom', 'is_legendary')]
dim(requete_a)

requete_b = pokemon[1:50,1:2]
dim(requete_b)

requete_c = pokemon[1:10,]
dim(requete_c)

requete_d = pokemon[,-1]
dim(requete_d)

requete_e = pokemon[order(nom),1:10]
dim(requete_e)


requete_f = pokemon[order(weight_kg, decreasing = TRUE),1:10]
dim(requete_f)

requete_g1 = order(speed, decreasing = FALSE)
requete_g = pokemon[order(attack, decreasing = TRUE,requete_g1),1:10]

#Exercice 4

requete_a = pokemon[ attack >= 150 , c("nom","attack")]
dim(requete_a)

requete_b = pokemon[ type %in% c("dragon","ghost","psychic","dark") , c("nom","type")]
dim(requete_b)

requete_c = pokemon[ type == "fire" & attack >= 100, c("nom","type","attack")]
dim(requete_c)

requete_d = pokemon[ speed <= 150 & speed >= 100, c("nom","speed")]
dim(requete_d)

requete_g = pokemon[ na.rm = TRUE, weight_kg >=250, c("nom","weight_kg")]
dim(requete_d)