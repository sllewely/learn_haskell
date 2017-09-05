doubleSmallNumbers x = if x < 100
  then x * 2
  else x

longList :: Integer -> [Integer] -> [Integer]
longList x l =
  if x == 0
  then l
  else longList (x-1) x:l

