module Prime (nth) where
import Data.Char (digitToInt)


nth :: Int -> Maybe Integer
nth n 
    | n < 1 = Nothing
    | n == 1 = Just 2
    | otherwise = Just (last $ take (n-1) $ primL [3,5..])
    where 
        primL [x] = [x]
        primL (x:xs) = x : filter (\y -> y < x*x || y `mod` x /= 0) (primL xs) 
-- primes' (x:xs) = x : filter (\y -> y `mod` x /= 0) (primes' xs) 


{-primes n = 
    let testPrime y z = z > floor  (sqrt $ fromIntegral y) || y `mod` z /= 0 
    in  reverse $ foldl (\ax b -> if all (testPrime b) ax then b:ax else ax ) [7,5,3] (take n [11,13..])
-}