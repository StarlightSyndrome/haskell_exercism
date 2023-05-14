module Acronym (abbreviate) where

import Data.Text ()
import qualified Data.Text as T
import Data.Char (isAlphaNum, isLower, toUpper)

abbreviate :: String -> String
abbreviate = 
      T.unpack 
    . T.concat
    . map (T.singleton . Data.Char.toUpper . T.head . T.filter isAlphaNum)  
    . T.words 
    . T.pack 

