module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA xs
    | not(null inval) = Left (head inval)
    | otherwise = Right mapped
    where mapped = map dnaMap xs
          inval = filter (`notElem` "GCTA") xs

dnaMap :: Char -> Char
dnaMap x
  | x == 'G' = 'C'
  | x == 'C' = 'G'
  | x == 'T' = 'A'
  | x == 'A' = 'U'
  | otherwise = 'x'