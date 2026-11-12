-- Primeros ejercicios para cargar en GHCi desde VS Code.
-- Basados en Clase 7 - Practica.pptx, diapositivas 13-14 y 28-34.
-- La cabecera de modulo organiza el archivo para las herramientas del editor.
module PracticaInicial where

cuad :: Int -> Int
cuad x = x * x

sumar :: [Int] -> Int
sumar [] = 0
sumar (x:xs) = x + sumar xs

contar :: [a] -> Int
contar [] = 0
contar (_:xs) = 1 + contar xs

veces :: [Int] -> Int -> Int
veces [] n = 0
veces (x:xs) n
    | x == n    = 1 + veces xs n
    | otherwise = veces xs n

longLis :: [[Int]] -> [Int]
longLis [] = []
longLis (xs:xss) = contar xs : longLis xss
