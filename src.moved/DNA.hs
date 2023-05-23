module DNA (nucleotideCounts, Nucleotide(..)) where
import Data.Map (Map, fromListWith)
import Data.Either (lefts, rights)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show, Read)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs
  | null $ lefts counts = Right $ fromListWith (+) $ rights counts
  | otherwise = Left [ head $ lefts counts ]
  where counts = countN xs

countN :: String -> [Either Char (Nucleotide, Int)]
countN [] = []
countN (x:xs)
  | x `elem` "ACGT" = Right (read [x], 1) : countN xs
  | otherwise = [Left x]
