module Main (main) where
import Prime
import System.Environment (getArgs)
import Data.Maybe


main :: IO ()
main = do
    args <- getArgs
    let arg1 = head args
    let (Just res) = nth (read arg1 :: Int)
    print res 