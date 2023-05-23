module BubbleSort (bubbleSort) where

import Data.List(foldl')

bubbleSort :: (Ord a) => [a] -> [a]
bubbleSort xs = foldl' (\x _ -> bSort x) xs xs
  where
    bSort [] = []
    bSort [k] = [k]
    bSort (y : ys) = foldr (\j (k : ks) -> if k <= j then k : j : ks else j : k : ks) [y] ys

{-
    bSort :: (Ord a) => [a] -> [a]
    bSort [] = []
    bSort [y] = [y]
    bSort (y : ys)
      | y > head ys = head ys : bSort (y : tail ys)
      | otherwise = y : bSort ys
-}
