module Prime (nth) where
import Data.Set (Set)
import qualified Data.Set as Set

nth :: Int -> Maybe Integer
nth n 
    | n < 1 = Nothing
    | n == 1 = Just 2
    | otherwise = Just $ last $ take n $ Set.toAscList $ primesTo m
    where
        m = log $fromInteger n


primesTo m = 
    foldl (\as b -> if b `Set.member` as then Set.difference as (Set.fromDistinctAscList [b*2,b*3..m]) else as) (Set.fromDistinctAscList [3,5..m]) [3,5..m] 