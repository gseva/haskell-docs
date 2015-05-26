import System.IO
import System.Random
import Data.Char
import Data.List(transpose)
import Data.List.Split(chunksOf)
import Control.Applicative
import Control.Monad(when)


inicial :: Int -> [[Int]]
inicial x = replicate x $ replicate x 0

insertarRandom :: [Int] -> [Int]
insertarRandom [] = []
insertarRandom (x:xs)
  | x == 0 = 2:xs  -- Tremendo random
  | otherwise = x:insertarRandom xs

insertar mapa = chunksOf 4 $ insertarRandom $ concat mapa

juntar :: [Int] -> [Int]
juntar [] = []
juntar (x:xs)
  | x == 0 = juntar xs ++ [0]
  | otherwise = x : juntar xs

unir :: [Int] -> [Int]
unir [] = []
unir (0:xs) = 0 : xs
unir (x:[]) = [x]
unir (a:b:xs)
  | a == b = (2*a : unir xs) ++ [0]
  | otherwise = a : unir (b:xs)

movimientoComun = map unir . map juntar

moverArriba = transpose . movimientoComun . transpose
moverAbajo = transpose . moverDerecha . transpose
moverIzquierda = movimientoComun
moverDerecha = map reverse . movimientoComun . map reverse

mover 'w' = moverArriba
mover 's' = moverAbajo
mover 'a' = moverIzquierda
mover 'd' = moverDerecha
mover c = id

rellenar num = s ++ (replicate (5 - length s) ' ')
  where s = show num

completar = map rellenar

separador = replicate (4 * 5) '-'

imprimir mapa = do
  putStrLn ""
  putStrLn $ separador
  putStr $ unlines $ map unwords $ map completar mapa

condicionFin mapa = do
  if puedeMover then
    loop mapa
  else do
    imprimir mapa
    putStrLn "Perdiste!"
  where
    mapasIniciales = replicate 4 mapa
    movimientosPosibles = [moverArriba, moverAbajo, moverIzquierda, moverDerecha] <*> [mapa]
    puedeMover = not $ and $ zipWith (==) movimientosPosibles mapasIniciales

insercion mapa = condicionFin $ insertar mapa

loop mapa = do
  imprimir mapa
  c <- getChar
  when (c /= ' ') $ do
    let mapaNuevo = mover c mapa
    if (mapaNuevo /= mapa) then do
      insercion mapaNuevo
    else do
      loop mapaNuevo


main = do
  hSetBuffering stdin NoBuffering
  let mapa = insertar $ inicial 4
  loop mapa
