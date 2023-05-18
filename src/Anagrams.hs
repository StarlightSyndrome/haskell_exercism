module Anagram (anagramsFor) where

import Data.List(sort)
import Data.Char(toLower)

anagramsFor :: String -> [String] -> [String]
anagramsFor xs = filter (sameChars xs)
    where 
        sameChars a b = (alower /= blower) && sort alower == sort blower
            where alower = map toLower a
                  blower = map toLower b
