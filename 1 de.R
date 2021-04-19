library(agricolae)
lectura <- read.table("caso_1.txt", header=TRUE, skip=7)
head(lectura,10)
#-------------
dias <- c(44, 51, 58, 65, 72, 79, 86, 93)
enfermedad<-audpc(lectura[,4:11],dias, type = "absolute")
head(enfermedad,10)
# Datos para el análisis
A<-tapply.stat(enfermedad, lectura[,1:2],mean)
rm(enfermedad) # eliminación de la variable
str(A)
A[,1]<- factor(A[,1])
head(A)
#-------------
model <- lm(enfermedad ~ Block + Var, data=A)
anova(model)
cv.model(model)
#-------------
qqnorm(model$residuals,col="brown",pch=19)
qqline(model$residuals,col="blue")
shapiro.test(model$residuals)
library(car)
ncvTest(model)
#-------------
comparacion <- LSD.test(model,"Var")
names(comparacion)
comparacion$stcomparacion <- LSD.test(model,"Var",group = FALSE)atistics
comparacion$parameters
comparacion$means
#-------------
comparacion <- LSD.test(model,"Var",group = TRUE)
comparacion$groups
plot(comparacion)
#-------------
comparacion <- LSD.test(model,"Var",group = FALSE)