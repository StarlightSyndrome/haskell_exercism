module Anagram (anagramsFor) where

import Data.Char(toLower)
import qualified Data.Text as T
import qualified Data.Map as M


anagramsFor :: T.Text -> [  T.Text] -> [T.Text]
anagramsFor xs = filter sameChars
    where
    lowerC = map toLower . T.unpack
    lowerCa = lowerC xs
    makeMap = M.fromListWith (+) . map (,1)
    sameChars b = (lowerCa /= lowerC b) && makeMap lowerCa == makeMap (lowerC b)

{-    where
        alower = map toLower xs
        ref = Map.fromListWith (+) $ [(x,1)|x<-alower]
        sameChars _ b = (alower /= blower) && ref == mappedIn
            where
                  blower = map toLower b
                  mappedIn = Map.fromListWith (+) $ [(x,1)|x<-blower]
-}  