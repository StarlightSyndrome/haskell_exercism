module Main (main) where

import System.Environment (getArgs)
import Data.List
import Lib
import DNA


main :: IO ()
main = do
    args <- getArgs
    let arg1 = head args
    print $ nucleotideCounts arg1