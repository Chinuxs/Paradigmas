# ✏️ Funcional · Resolver listas paso a paso

[← Tema](inicio.md) · [📖 Repasar teoría](teoria.md) · [📝 Parciales](../../parciales/guiaParciales.md)

⚡ [Resumen de teoría y práctica](resumen.md)

> **Receta:** leer la salida → escribir el tipo → separar niveles → caso base → paso recursivo → trazar un ejemplo.

## 1. Mirá qué debe devolver

| La consigna pide… | Salida típica | Qué construís |
| --- | --- | --- |
| Una cantidad por sublista | `[Int]` | Un número por cada sublista procesada. |
| Las sublistas que cumplen algo | `[[Int]]` | Conservar o descartar cada sublista. |
| Cambiar elementos de las sublistas | `[[Int]]` | Una sublista transformada por cada original. |
| Una sola lista con los elementos | `[Int]` o `[Char]` | Unir los resultados interiores. |

**Truco:** dibujá una entrada de dos sublistas y su salida antes de escribir código. La forma de la salida suele revelar el recorrido que necesitás.

## 2. Armá las auxiliares pequeñas

Para contar elementos:

```haskell
longitud :: [a] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs
```

Para contar las apariciones de un número:

```haskell
veces :: [Int] -> Int -> Int
veces [] n = 0
veces (x:xs) n
    | x == n    = 1 + veces xs n
    | otherwise = veces xs n
```

Las dos recorren una lista, pero responden preguntas distintas. Una guarda decide si sumar `1`; el recorrido continúa en ambas ramas.

## 3. Resolvé primero un caso de dos niveles

**Objetivo:** devolver la longitud de cada sublista.

```haskell
longitudes :: [[Int]] -> [Int]
longitudes [] = []
longitudes (xs:xss) = longitud xs : longitudes xss
```

Traza:

```text
longitudes [[4,9], [2]]
= longitud [4,9] : longitudes [[2]]
= 2 : (1 : [])
= [2,1]
```

`longitud xs` responde sobre la primera sublista. `longitudes xss` continúa con las demás.

## 4. Agregá la condición pedida

Ejemplo didáctico: conservar las sublistas con más de `n` elementos.

```haskell
largas :: [[Int]] -> Int -> [[Int]]
largas [] n = []
largas (xs:xss) n
    | longitud xs > n = xs : largas xss n
    | otherwise       = largas xss n
```

`largas [[1,2], [7], [3,4,5]] 1` produce `[[1,2], [3,4,5]]`.

**Fijate en las ramas:** si se conserva la sublista aparece `xs : ...`; si se descarta, solo continúa la recursión.

## 5. Ejemplo base: reemplazo del parcial 2023

El [ejercicio 2](../../parciales/Parcial_2023.png) pide reemplazar un número por otro dentro de cada sublista.

1. Entrada: lista de listas y dos enteros; salida: lista de listas.
2. Auxiliar: reemplazar dentro de **una** lista.
3. Función exterior: aplicar la auxiliar a la primera sublista y continuar.
4. Conservar orden, cantidad de sublistas y cantidad de elementos.

<details>
<summary>👀 Ver una resolución guiada después de intentarlo</summary>

```haskell
reemplazar :: [Int] -> Int -> Int -> [Int]
reemplazar [] viejo nuevo = []
reemplazar (x:xs) viejo nuevo
    | x == viejo = nuevo : reemplazar xs viejo nuevo
    | otherwise  = x : reemplazar xs viejo nuevo

reemplazarListas :: [[Int]] -> Int -> Int -> [[Int]]
reemplazarListas [] viejo nuevo = []
reemplazarListas (xs:xss) viejo nuevo =
    reemplazar xs viejo nuevo : reemplazarListas xss viejo nuevo
```

Control pequeño: `reemplazarListas [[2,3], [], [2,2]] 2 7` produce `[[7,3], [], [7,7]]`.

La auxiliar construye una lista de enteros; la exterior agrega esa lista como un elemento de la lista de listas.

</details>

## 💡 Patrones para otras variantes

| Variante | Auxiliar | Decisión exterior |
| --- | --- | --- |
| Contar apariciones solo en sublistas impares | `longitud` y `veces` | Agregar un conteo solo si la longitud es impar. |
| Incrementar solo las sublistas pares | `longitud` e incrementar una lista | Transformar la par; conservar la impar. |
| Quitar vocales y aplanar | Quitar vocales de una lista y concatenar | Unir la sublista filtrada con el resto. |
| Promedio por sublista par | Longitud y suma | Agregar un promedio si cumple y no está vacía. |

Para paridad, en Haskell se escribe ``longitud xs `mod` 2 == 0``. Una longitud de cero es par; si después dividís por esa longitud, hay que resolver el caso vacío antes. Para promedios, revisar además la conversión de enteros a un tipo que admita división fraccionaria.

## 🚧 Errores frecuentes

| Error | Corrección |
| --- | --- |
| Olvidar una auxiliar | Escribir su firma y sus casos también. |
| Devolver `0` cuando se espera una lista | Revisar el tipo: puede corresponder `[]`. |
| Confundir `xs` con `xss` | La primera es una sublista; la segunda contiene las restantes. |
| Volver a llamar con la entrada completa | Continuar con la cola para acercarse al caso base. |
| Usar `length` o `map` sin revisar la consigna | Desarrollar las auxiliares requeridas. |

## ✅ Probá en papel

- [ ] Lista exterior vacía: `[]`.
- [ ] Una sublista vacía: `[[]]`.
- [ ] Ninguna coincidencia y varias coincidencias.
- [ ] Longitud justo igual al límite; longitudes pares e impares.
- [ ] Cada rama devuelve el mismo tipo de resultado.

**Tu turno:** usar `longitud` y `veces` para resolver Congreso 2025, que cuenta apariciones solo en sublistas impares. Después seguir con Feria, Hospital e Inmobiliaria en la [guía de parciales](../../parciales/guiaParciales.md). Los modelos 2022–2023 quedan como apoyo previo si hace falta.

## 📚 Fuentes

[Práctica 7](../../practica/enunciados/Clase%207%20-%20Practica.pptx), diap. 28–34; [continuación](../../teoria/material/Clase8-Continuacion-Progr%20Func.pptx), diap. 7–17 y 22; parcial 2023, ejercicio 2. Recetas y trazas propuestas para estudio; código sin ejecución en Haskell.
