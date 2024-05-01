library("ggplot2")
source("utils\\scatter.r")

src <- data.frame(
    Temperatura = c(100, 110, 120, 130, 140, 150, 160, 170, 180, 190),
    Rendimento = c(45, 51, 53, 61, 66, 70, 74, 78, 85, 89)
)

# a
print("A")
png("..\\out\\2.png")
scatter(src)
dev.off()

# b
print("B")
modelo <- lm(Rendimento ~ Temperatura, data=src)
print(modelo)

# c
print("C")
modelo <- lm(Rendimento ~ Temperatura, data=src)
sumario <- summary(modelo)$r.squared
print("Coeficiente de determinação")
print(sumario)

# d
print("D")
est <- predict(modelo, data.frame(Temperatura = 155))
print(est)
