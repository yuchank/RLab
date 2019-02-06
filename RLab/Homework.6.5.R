max3 = function(x, y, z) {
  return (max(max(x, y), z))
}

max3(1, 2, 3)
max3(1.23, -8.45, 13)
max3('a', 'b', 'c')

while (TRUE) {
  num1 <- readline(prompt = "Guess number A: ") # character type
  num1 <- as.integer(num1)
  num2 <- readline(prompt = "Guess number B: ") # character type
  num2 <- as.integer(num2)

  if (num1 == 0 & num2 == 0) { 
    print('bye')
    break
  }

  print(num1 + num2)
  print(num1 * num2)
}