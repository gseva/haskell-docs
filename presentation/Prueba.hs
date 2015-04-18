module Prueba
( greetTwice
, greetThreeTimes
) where

greet :: String -> String
greet x = "Hi " ++ x ++ "!"

greetTwice :: String -> String
greetTwice x = greet $ greet x

greetThreeTimes :: String -> String
greetThreeTimes x = greetTwice $ greet x

