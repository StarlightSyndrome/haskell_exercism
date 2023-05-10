module Lib
  (bubbleSort
  )
where

bubbleSort :: (Ord a) => [a] -> [a]
bubbleSort [] = []
bubbleSort [x] = [x]
bubbleSort xs = sorted
  where (_, sorted) = bSort xs []


bSort :: (Ord a) => [a] -> [a] -> ([a], [a])
bSort [] [] = ([], [])
bSort [] _ = ([], [])
-- bSort [x] [] = ([], [x])
bSort [x] ys = ([], x:ys)
bSort [x,y] ys
  | x <= y = ([], x:y:ys)
  | otherwise = ([], y:x:ys)
bSort (x:y:zs) ys =
  if x <= y then
    let (lower, upper) = bSort (y:zs) ys
    in (x:lower, upper)
  else
    let (lower, upper) = bSort (x:zs) ys
  in (y:lower, upper)