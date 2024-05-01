source("utils\\scatter.r")
source("utils\\measures.r")

src <- data.frame(
    Peso_Corporal = c(59.8, 58.5, 60, 74, 59.8, 80.4, 108, 74.8, 82, 78.6, 74.7, 108.1, 71.9, 51.2, 55, 74, 67.2, 60, 64.8, 89.3),
    Melhor_Supino = c(55, 67.5, 72.5, 82.5, 70, 77.5, 100, 95, 85, 105, 95, 70, 90, 47.5, 65, 100, 72.5, 55, 57.5, 57.5)
)

# a
png("..\\out\\5.png")
scatter(src)
dev.off()

# b
modelo <- lm(Melhor_Supino ~ Peso_Corporal, data=src)
print(modelo)

# c
modelo <- lm(Melhor_Supino ~ Peso_Corporal, data=src)
sumario <- summary(modelo)$r.squared
print("Coeficiente de determinação")
print(sumario)

# d
corr <- cor(src[1], src[2])
print("Coeficiente de correlação")
print(corr)

# e
med <- measures(src, mean, "Média")
medi <- measures(src, median, "Mediana")

mode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
moda <- measures(src, mode, "Moda")
vari <- measures(src, var, "Variância")
desv <- measures(src, sd, "Desvio Padrão")
cv <- measures(src, function(x) sd(x) / mean(x) * 100, "Coeficiente de variação")

# f
png("..\\out\\5_box_Peso.png")
boxplot(
    src[[1]],
    main = "Boxplot Peso"
)
dev.off()
png("..\\out\\5_box_Supino.png")
boxplot(
    src[[2]],
    main = "Boxplot Supino"
)
dev.off()