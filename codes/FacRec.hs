factorial n = fac' n 1
  where fac' n acc | n == 0    = acc
                   | otherwise = fac' (n - 1) (n * acc)

main = print (factorial 1000)
