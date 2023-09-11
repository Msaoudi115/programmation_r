#1.a

df<-read.csv(file = "fastfood.csv",
               header = TRUE, sep = "\t", dec = ",")
View(df)

#1.b

nrow(df)

#1.c
colnames(df)
ncol(df)
#1.d
summary(df)

#1.e
for ( i  in colnames(df)) 
{ if ( is.numeric(df[,i])==F  )
 { df[,i]<- as.factor(df[,i])}
}
for (colonne in colnames(df)) {
  if(is.character(df[ , colonne ]) == TRUE) {
    df[ , colonne ] <- as.factor(df[ , colonne ])
  }}
#1.f
str(df)


#2.a
length(unique(df$brands))


#2.b

tri_marque = table(df$brands)

barplot(tri_marque, 
        main = "répartition du nombre de resto par marque",
        col = colors()[c(45,99)], horiz = FALSE) 

#2.c

median(df$energy.kcal_value, na.rm = T)
sd(df$energy.kcal_value, na.rm = T)

#2.d
boxplot(df$energy.kcal_value, na.rm = T,main = "boite à moustache")

#2.e

head(df[order(df$energy.kcal_value, decreasing = T), c(2,6,9)], 2)

df[93,9] = 268

#2.f
quantile(df$energy.kcal_value,seq(0.1, 0.9, by = 0.1),na.rm = TRUE)
quantile(df$energy.kcal_value,seq(0.1, 0.9, by = 0.01),na.rm = TRUE) #22%

#Exercice 3

#3.a

requete_a <- df[df$Sandwich == "Oui",]
boxplot(requete_a$energy.kcal_value ~ requete_a$brands, main = "Dispersion des calories par marques" )

#3.b

requete_b <- aggregate(energy.kcal_value ~ brands, data = df, FUN = mean)
requete_b_tri <- requete_b[order(requete_b$energy.kcal_value, decreasing = TRUE),] 
print(requete_b_tri) #Burger king

#3.c

requete_c <- requete_a[order(requete_a$energy.kcal_value, decreasing = FALSE), c(2,6,9)]
requete_c[1:5, ]

#3.d
len_na <- mean(is.na(df$off.nutriscore_score))
# OU
len_na <- nrow(df[is.na(df$off.nutriscore_score),]) / nrow(df)

print(len_na)
print(1-len_na)

# 4a
cor(y = df$off.nutriscore_score, x = df$energy.kcal_value, use="complete.obs")
#La corrélation est proche de 0 le lien est faible

# 4b
cor(df[,c("energy.kcal_value", "fat_value", "saturated.fat_value", "sugars_value", "proteins_value", "salt_value")], use="complete.obs")

# 4c
  
graph = plot(df$energy.kcal_value,main = "Plus grande correlation", df$fat_value, col = df$brands)
                                                                                                                              
                                                                                                                             