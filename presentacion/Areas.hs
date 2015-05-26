module Areas
( areaCirculo
, areaCuadrado
, areaRectangulo
) where

areaCirculo :: Float -> Float
areaCirculo radio = pi * (radio ^ 2)

areaCuadrado :: Float -> Float
areaCuadrado lado = lado ^ 2

areaRectangulo :: Float -> Float -> Float
areaRectangulo a b = a * b