
module Pangram (isPangram) where
import Data.Char(toLower)

isPangram :: String -> Bool
isPangram text =  ['a'..'z'] == sortUniq (map toLower text)


sortUniq :: [Char] -> [Char]
sortUniq [] = []
sortUniq (x:xs)
    | x `elem` ['a'..'z'] =
        let smaller = sortUniq [a | a <- xs, a < x]
            bigger = sortUniq [a | a <- xs, a > x]
        in smaller ++ [x] ++ bigger
    | otherwise = sortUniq xs