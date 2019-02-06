lgm <- function(a, b) {
  if (a %% b == 0) {
    return (abs(b))
  }
  else {
    lgm(b, a %% b)
  }
}

result <- lgm(10, 8)
result
result <- lgm(10, 20)
result

maxmin <- function(v1) {
  return (list(max = max(v1), min = min(v1)))
}

v1 <- c(7, 1, 2, 8, 9)
result <- maxmin(v1)
result$max; result$min
result <- maxmin(iris[, 1])
result$max; result$min