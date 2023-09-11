#Exercice 1

#a.
dataset = read.csv(file = "NBA.csv",
                    header = TRUE, sep = ",", dec = ".")
View(dataset)

#b.
dim(dataset)

#c
summary(dataset)

#d

dataset$PERIOD = as.factor(dataset$PERIOD)
dataset$PTS_TYPE = as.factor(dataset$PTS_TYPE)
summary(dataset)

#Exercice 2

#a
quantile(dataset$CLOSE_DEF_DIST, seq(0,1,0.1), na.rm = TRUE)

#b
x = unique(dataset$GAME_ID)
length(x)

#c
y = unique(dataset$SHOOTER)
length(y)

#d
SHOT_DIST_METRE = SHOT_DIST*0.3
dataset$SHOT_DIST_METRE = SHOT_DIST_METRE

#Exercice 3

#a
tri_periode = table(dataset$PERIOD)

barplot(height = tri_periode, 
        main = "répartition des tirs par période",
        col = colors()[c(45,99)], horiz = TRUE)

#b
tri_tirs_r = 100*prop.table(table(dataset$SHOT_RESULT))
pie(x = tri_tirs_r, main = "Pourcentage du nombre de tirs réussis",
    col = colors()[c(45,99)], labels = paste(rownames(tri_tirs_r),tri_tirs_r))

#c

tri_dist_tirs = 

hist(x = dataset$SHOT_DIST_METRE, main = "Distribution de la distance de tirs",
      col = colors()[c(45,99)] , breaks = 6, probability = TRUE)

#d
tri_croise <- prop.table(table(dataset$PTS_TYPE.Rating, dataset$PERIOD))
