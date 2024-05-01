source("utils\\scatter.r")
source("utils\\measures.r")

src <- data.frame(
    SandP = c(1.2, -2.5, -3, 2, 5, 1.2, 3, -1, 0.5, 2.5),
    IBM = c(-0.7, -2, -5.5, 4.7, 1.8, 4.1, 2.6, 2, -1.3, 5.5)
)

# a
png("..\\out\\3.png")
scatter(src)
dev.off()

# b
modelo <- lm(IBM ~ SandP, data=src)
print(modelo)

# c
modelo <- lm(IBM ~ SandP, data=src)
sumario <- summary(modelo)$r.squared
print("Coeficiente de determinação")
print(sumario)

# d
corr <- cor(src["SandP"], src["IBM"])
print("Coeficiente de correlação")
print(corr)

# e
med <- measures(src, mean, "Média")
medi <- measures(src, median, "Mediana")
mode <- function(v) {
   uniqv <- unique(v)
   uniqv[which.max(tabulate(match(v, uniqv)))]
}
mod <- measures(src, mode, "Moda")
vari <- measures(src, var, "Variância")
sta <- measures(src, sd, "Desvio Padrão")
cv <- measures(src, function(x) sd(x) / mean(x) * 100, "Coeficiente de variação")

# f
png("..\\out\\3_box_SandP.png")
boxplot(
    src[[1]],
    main = "Boxplot S&P"
)
dev.off()
png("..\\out\\3_box_IBM.png")
boxplot(
    src[[2]],
    main = "Boxplot IBM"
)
dev.off()
