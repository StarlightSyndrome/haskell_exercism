module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune


ageOn :: Planet -> Float -> Float
ageOn p x = case p of
    Mercury -> years / 0.2408467
    _ -> error "not a planet"
    where years = x / 3600 / 24 / 365
-- ageOn Venus x = x * 0.61519726
-- ageOn Earth x = x / 3600 / 24 / 365
-- ageOn Mars x = x * 1.8808158
-- ageOn Jupiter x = x * 11.862615
-- ageOn Saturn x = x * 29.447498
-- ageOn Uranus x = x * 84.016846
-- ageOn Neptune x = x * 164.79132
