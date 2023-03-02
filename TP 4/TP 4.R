#Exercice 1

#1
set.seed(1789)
population <- rnorm(n = 10000000,mean = 171,sd = 9)

#2
mean(population)
sd(population)

#On obtient les valeurs attendues

#3

hist(population, main="Distribution d'une loi normale",
     probability = TRUE)

#on retrouve effectivement la forme connue d'une loi normale avec celle de la popualtion simulée

#4
sum(population >= 190)
(1-pnorm(190, mean = 171, sd = 9))*1e7

#5
sum(population <= 144)
(pnorm(144, mean = 171, sd = 9))*1e7

#Exercice 2

#1
sample(population, 100, replace = T)

sd(sample)

#ces valeurs sont proches de celles de la population originale

#2
largeur = 1.96*sd(sample)/sqrt(100)
mean(sample)-largeur
mean(sample)+largeur

#3
taille_ech = 100
nb_replicat = 1000
echantillons = replicate(nb_replicat, sample(population, 100, replace = T))
moyennes = apply(echantillons, 2, mean)
ecart_type = apply(echantillons, 2, sd)

#4
hist(moyennes, main="Distribution des moyennes",
     probability = TRUE)

#5

mean(moyennes)
sd(moyennes)

#6
sum(moyennes >= 172,8)


#Exercice 3

#1

