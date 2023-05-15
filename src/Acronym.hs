module Acronym (abbreviate) where

import Data.Char (toUpper, isUpper, isAlphaNum)
import Data.List

abbreviate :: String -> String
abbreviate xs =
    concat 
    $ map (\(f:w) -> toUpper f:w)
    $ map (filter isAlphaNum)
    $ words xs


   

windowed :: Int -> [a] -> [[a]]
windowed _ [] = [[]]
windowed s lst@(_:xs) 
  | length lst == s = [lst]
  | otherwise = take s lst: windowed s xs 
    
