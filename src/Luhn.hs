module Luhn (isValid) where
import Data.Char(isNumber, isSpace, digitToInt)
import Data.List(unfoldr)

isValid :: String -> Bool
isValid xs = processed `mod` 10 == 0
    where
    trimmed = checkAndStrip xs
    padded = if odd (length trimmed) then tail trimmed else trimmed
    pairs = takeWhile (not . null) $ unfoldr (Just . splitAt 2) padded
    doubleLuhn i = if i2 > 9 then i2 - 9 else i2
        where i2 = i * 2
    processed = foldl (\x [a,b] -> x + doubleLuhn (digitToInt a) + digitToInt b) 0 pairs 
    


checkAndStrip :: String -> String
checkAndStrip xs
    | length xs < 2 = errmsg
    | all isNumber cleaned = cleaned
    | otherwise = errmsg
    where 
        cleaned = filter (not . isSpace) xs
        errmsg = error "Not a valid input"
