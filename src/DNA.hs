module DNA (nucleotideCounts, Nucleotide(..)) where
-- module DNA (toRNA) where
import Data.Map (Map)
import qualified Data.Map as Map

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = traverse countN
    where
        countN :: Char -> Either String (Map Nucleotide Int)
        countN c = Right (Map.adjust (1 +) (pure mapN c) cmap)
          where cmap = Map.fromList [(A, 0), (C, 0), (G, 0), (T, 0)]



mapN :: Char -> Either String Nucleotide
mapN c
  | c == 'A' = pure A
  | c == 'C' = pure C
  | c == 'G' = pure G
  | c == 'T' = pure T
  | otherwise = Left "error"
