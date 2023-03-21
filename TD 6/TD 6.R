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
{ if ( class(df[,i]) !="numeric" )
 { df[,i]<- as.factor(df[,i])}
}

#1.f

str(df)

#2.a
length(unique(df$brands))
