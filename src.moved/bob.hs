module Bob (responseFor) where
import Data.Char

responseFor :: String -> String
responseFor xs
    | null xs = "Fine. Be that way!"
    | all_upper && last xs == '?' = "Calm down, I know what I'm doing!"
    | last xs == '?' = "Sure."
    | all_upper = "Whoa, chill out!"
    | otherwise = "Whatever."
    where stripped = filter (not . isSpace) xs
          alphas = filter (`elem` ['a'..'z'] ++ ['A'..'Z']) stripped
          all_upper = not (null alphas) && all isUpper alphas
