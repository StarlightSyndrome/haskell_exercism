module Clock (addDelta, fromHourMin, toString) where


data Clock = Clock Int Int deriving (Eq, Show)

fromHourMin :: Int -> Int -> Clock
fromHourMin h m = Clock hProc mProc
    where
    hProc = (h + m `div` 60) `mod` 24
    mProc = m `mod` 60


toString :: Clock -> String
toString (Clock h m) = hr ++ ":" ++ mn
    where   
    hr = if h < 10 then '0': show h else show h
    mn = if m < 10 then '0': show m else show m 

addDelta :: Int -> Int -> Clock -> Clock
addDelta hAdd mAdd (Clock h m) = fromHourMin (h + hAdd) (m + mAdd)
