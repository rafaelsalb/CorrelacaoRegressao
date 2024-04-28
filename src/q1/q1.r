library("ggplot2")
source("utils\\scatter.r")

src <- data.frame(
    Volume_Trafego = c(3, 3, 5, 5, 10, 10, 15, 15, 20, 20, 25, 25, 30, 30),
    Velocidade_Media = c(95.6, 93.8, 74.4, 74.4, 50.5, 51.5, 44.6, 42.6, 35.8, 38.7, 32.0, 32.0, 30.1, 29.1)
)

# a, b
png("..\\out\\1.png")
scatter(src)
dev.off()

# c
corr <- cor(src["Volume_Trafego"], src["Velocidade_Media"])
print("Coeficiente de correlação")
print(corr)

# d