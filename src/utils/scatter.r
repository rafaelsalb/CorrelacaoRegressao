library("ggplot2")
scatter <- function(src) {
    ggplot(src, aes(x = src[, 1], y = src[, 2])) +
    geom_point() +
    geom_smooth(method = "lm", se = FALSE) +
    labs(title = paste("Gráfico de dispersão (", colnames(src)[1], " x ", colnames(src)[2], ")", sep=""),
        x = colnames(src)[1],
        y = colnames(src)[2])
}
