library(mice)
ds <- ampute(iris[, 1:4], 0.2)$amp

# 1
col_na <- function(y) {
  return(sum(is.na(y)))
}
na_count <- sapply(ds, FUN = col_na) # sapply: input each column
na_count

# 2
ds[!complete.cases(ds),]

# 3
sum(rowSums(is.na(ds)) > 0)

# 4
ds.new <- ds[complete.cases(ds),]