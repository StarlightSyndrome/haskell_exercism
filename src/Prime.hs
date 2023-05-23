module Prime (nth) where
import Data.Char (digitToInt)

nth :: Int -> Maybe Integer
nth n 
    | n < 0 = Nothing
    | n == 0 = Nothing
    | n <= 5 = Just (base !! (n - 1))
    | otherwise = Just (last $ take (n-5) pretested)
    where
        base = [1::Integer,2,3,5,7]
        -- create stream of odds, not div by 3 and 5.
        pretested = filter (not . divBy3) $ filter (not . divBy5) [11,13..]
        divBy5  = (=='5') . last . show
        divBy3 = (/=0) . (`mod` 3). sum . map digitToInt . show
        primes = foldl (\acc i -> if isPrime i acc then acc ++ [i] else acc) [7] pretested 
        isPrime y = all (\x -> x * x < y && x `mod` x /= 0)