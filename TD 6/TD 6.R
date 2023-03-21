#1.a

df<-read.csv(file = "fastfood.csv",
               header = TRUE, sep = "\t", dec = ",")
View(df)

#1.b

nrow(df)

#1.c
colnames(df)

#1.d
summary(df)

#1.e
for ( i  in colnames(df)) 
{ if ( is.numeric(df[,i])==F  )
 { df[,i]<- as.factor(df[,i])}
}

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

rang1 = order(df$energy.kcal_value, )