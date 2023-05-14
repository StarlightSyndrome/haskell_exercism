module Lib
  (bubbleSort
  )
where

import Debug.Trace

bubbleSort :: (Ord a, Show a) => [a] -> [a]
bubbleSort [] = []
bubbleSort [x] = [x]
bubbleSort xs = 
  -- let (_, sorted) = foldl (\y _ -> bSort y) (xs, []) xs
  let (_, sorted) = last $ take (length xs + 1) (iterate bSort (xs, []))
  in sorted


bSort :: (Ord a, Show a) => ([a],[a]) -> ([a], [a])
bSort ([], _) = ([], [])
bSort ([x], ys) = ([], x:ys)
bSort (x:xs, ys) =
  if x <= head xs then
    let (unstd, sorted) = bSort (xs, ys)
    in (x:unstd, sorted)
  else
    let (unstd, sorted) = bSort (x:tail xs, ys)
    in (head xs:unstd, sorted)

{-  
  if x <= y then
    -- let (lower, upper) = bSort (y:zs) ys
    let (lower, upper) = trace ("lt:" ++ show y ++ ":" ++ show zs ++ " " ++ show ys) $ bSort (y:zs) ys
    in (x:lower, upper)
  else
    --let (lower, upper) = bSort (x:zs) ys
    let (lower, upper) = trace ("gt:" ++ show x ++ ":" ++ show zs ++ " " ++ show ys) $ bSort (x:zs) ys
    in (y:lower, upper)
-}

