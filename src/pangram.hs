module Pangram (isPangram) where
import Data.Char
isPangram :: String -> Bool
isPangram text = all (\x -> toLower x `elem` ['a'..'z']) text
