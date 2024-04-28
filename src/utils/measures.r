measures <- function(src, fn, measure_name){
    mes <- data.frame(
        a = fn(src[[1]]),
        b = fn(src[[2]])
    )
    colnames(mes) <- colnames(src)
    print(measure_name)
    print(mes)
}