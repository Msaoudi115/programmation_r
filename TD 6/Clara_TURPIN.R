# 1a
install.packages("read.csv")
library(read.csv)
df <- read.csv(file = "fastfood.csv", sep = "\t",dec = ",")
# 1b
nrow(df)
# 1c
ncol(df)
# 1d
str(df)
# 1e
for (colonne in colnames(df)) {
  if(is.character(df[ , colonne ]) == TRUE) {
    df[ , colonne ] <- as.factor(df[ , colonne ])
  }}
# 1f
sapply(df,class)

# 2a
length(unique(df$brands))
#Il y a quatre marques de fast-food différent

# 2b

# 2c
median(df$energy.kcal_value, na.rm = TRUE )
sd(df$energy.kcal_value, na.rm = TRUE )
#La valeur mediane du nombre de calories par produit est de 286 avce un écart-type de 223,3601, 
#il y a donc une très grande dispersion.

# 2d
boxplot(df$energy.kcal_value, main = "Boite à moustache des calories")
#Le graphique nous montre bien une grande disperssion

# 2e
df_total <- aggregate(PTS_MARQUES ~ SHOOTER, data = df, FUN = sum)
tri_kcal <- df[order(df$energy.kcal_value, decreasing = TRUE),]
tri_kcal[1:2  ,c("product_name_fr", "brands", "energy.kcal_value") ]
#Les valeurs extreme sont loin de la mediane, et ne semble pas cohérent

# 2f
if ((df$product_name_fr == "Salade - Caesar") == TRUE) {
  df$energy.kcal_value <- 268
}

# 2g
quantile(df$energy.kcal_value,seq(.1, .9, by = .1),na.rm = TRUE)
#Il y a au moins 20% des produits strictement inférieur à 200 kcal

# 3a
requete_a <- df[df$Sandwich == "Oui",]
boxplot(requete_a$energy.kcal_value ~ requete_a$brands, main = "Dispersion des calories par marques" )
# La dispersion est plus grande chez Burger King

# 3b
requete_b <- aggregate(energy.kcal_value ~ brands, data = df, FUN = mean)
requete_b_tri <- requete_b[order(requete_b$energy.kcal_value, decreasing = TRUE),]
requete_b_tri[1, ]
#C'est KFC qui a les produits les plus calorique en moyen

# 3c
requete_c <- requete_a[order(requete_a$energy.kcal_value, decreasing = FALSE),]
requete_c[1:5, c("product_name_fr", "brands", "energy.kcal_value") ]
# Les sandwichs les moins kcal sont ches Mcdo

# 3d
len_non_na <- nrow(df[!is.na(df$off.nutriscore_score),]) / nrow(df)
len_na <- nrow(df[is.na(df$off.nutriscore_score),]) / nrow(df)
#il y a 47% de NA

# 4a
cor(x = df$off.nutriscore_score, y = df$energy.kcal_value, use="complete.obs")
#La corrélation est proche de 0 le lien est faible

# 4b
cor(df[,c("energy.kcal_value", "fat_value", "saturated.fat_value", "sugars_value", "proteins_value", "salt_value")], use="complete.obs")

# 4c
plot(df$fat_value, df$saturated.fat_value, mean = "Plus grande correlation", col = "blue")

# 5a

SimulSandwhichs <- function(marque) {
  }
# 5b
# 5c
