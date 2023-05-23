module Grains (square, total) where
import Data.Maybe

square :: Integer -> Maybe Integer
square 0 = Nothing
square i
    | i <= 64 = Just $ 2^(i-1)
    | otherwise = Nothing

total :: Integer
-- total = 2^64 - 1
total = sum [fromJust $ square i | i <- [1..64]]