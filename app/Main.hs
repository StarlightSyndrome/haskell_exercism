module Main (main) where

import System.Environment (getArgs)


main :: IO ()
main = do
    args <- getArgs
    let arg1 = head args
    print  arg1