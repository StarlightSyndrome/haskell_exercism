module Luhn (isValid) where
import Data.Char(isSpace, digitToInt)

isValid :: String -> Bool
isValid n = case filter (not . isSpace) n of
    [] -> False
    [_] -> False
    x -> checksum x `mod` 10 == 0
    where
        checksum = luhn . map digitToInt . reverse
        luhn [] = 0
        luhn [x1] = x1
        luhn (x1:x2:xs) = x1 + 2 * x2 - (if x2 > 5 then 9 else 0) + luhn xs  