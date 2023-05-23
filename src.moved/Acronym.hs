module Acronym (abbreviate) where

import Data.Char (isPunctuation, isAlpha, isLower, isUpper, toUpper)

{-abbreviate :: String -> String
abbreviate xs =
  concatMap (processWord . filter isAlphaNum) $ words $ map (\x -> if x `elem` "-_:.," then ' ' else x) xs

processWord :: String -> String
processWord [] = []
processWord [x] = [toUpper x]
processWord [x, _] = [toUpper x]
processWord (w : wrd) = toUpper w : concatMap tail (filter (\(x : xs) -> isLower x && isUpper (head xs)) $ windowed' 2 wrd)

windowed :: Int -> [a] -> [[a]]
windowed s lst@(_ : xs)
  | length lst == s = [lst]
  | otherwise = take s lst : windowed s xs
windowed _ _ = []

windowed' :: Int -> [Char] -> [[Char]]
windowed' 2 s = tail $ zipWith (\a b -> [a, b]) (head s : s) s
windowed' n' s = let n = n' - 1 in tail $ zipWith (:) (head s : s) $ windowed' n s
-}


abbreviate :: String -> String
abbreviate xs = let
        zupped lst = zip (' ':lst) lst
        valid (a,b) = (isPunctuation a || ' ' == a) && isAlpha b || (isLower a && isUpper b)
    in concatMap (\(_,b) -> [toUpper b]) $ filter valid $ zupped xs
