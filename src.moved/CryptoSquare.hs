module CryptoSquare (encode) where
import Data.List (unfoldr, transpose, unfoldr, splitAt)
import Data.Char(toLower, isAlphaNum)

encode :: String -> String
encode xs = 
    let normalized = map toLower $ filter isAlphaNum xs
        squareSize = ceiling $ sqrt $ fromIntegral $ length normalized
        chunks = chunksOfPadded squareSize normalized
    in unwords $ transpose chunks 
    

chunksOfPadded :: Int -> String -> [String]
--chunksOf n xs = takeWhile (not . null) $ unfoldr (Just . splitAt n) xs
chunksOfPadded n = map pad . takeWhile (not . null) . unfoldr (Just . splitAt n)
    where
    pad = take n . (++ repeat ' ') 
