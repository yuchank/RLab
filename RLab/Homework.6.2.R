sum <- 0
count <- 0
for (i in 1:100) {
  if (i %% 3 == 0) {
    sum <- sum + i
    count <- count + 1
  }
}
sum
count

three_n_four <- c()
for (i in 101:200) {
  if (i %% 3 == 0 & i %% 4 == 0) {
    three_n_four <- c(three_n_four, i)
  }
}
three_n_four

ans <- c()
for (i in 1:24) {
  if (24 %% i == 0) {
    ans <- c(ans, i)
  }
}
ans

fact <- 1
for (i in 1:10) {
  fact <- fact * i
}
fact

fibo <- c(0, 1)
for (i in 1:38) {
  fibo <- c(fibo, fibo[i] + fibo[i+1])
}
fibo