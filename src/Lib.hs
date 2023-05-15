module Lib
  (bubbleSort
  )
where
import System.Environment (withArgs)

bubbleSort :: (Ord a) => [a] -> [a]
bubbleSort xs = foldl (\x -> bSort x) xs xs
  where
  bSort :: (Ord a) => [a] -> [a]
  bSort []  = []
  bSort [y] = [y]
  bSort (y:ys)
    | y > head ys = head ys:bSort (y:tail ys)
    | otherwise = y:bSort ys



