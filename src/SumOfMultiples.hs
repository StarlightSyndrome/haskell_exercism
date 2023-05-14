module SumOfMultiples (sumOfMultiples) where


import Data.Set (toList, fromList)
uniqM lst = toList $ fromList lst


sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples xs lim = sum $ uniqM [ x * n | x <- xs, n <- [1..lim-1], x * n < lim ]
          