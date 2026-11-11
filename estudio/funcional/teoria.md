# 📖 Funcional · Entender antes de programar

[← Tema](inicio.md) · [Siguiente: resolver ejercicios →](practica.md)

⚡ [Resumen de teoría y práctica](resumen.md)

## 1. Una función recibe datos y produce un resultado

```haskell
doble :: Int -> Int
doble x = 2 * x
```

| Parte | Significado |
| --- | --- |
| `doble` | Nombre de la función. |
| `Int -> Int` | Recibe un entero y devuelve un entero. |
| `x` | Argumento; no se modifica durante esa llamada. |
| `2 * x` | Resultado que se calcula. |

`doble 4` vale `8`. Para estas funciones puras, la misma entrada produce el mismo resultado. **Transparencia referencial:** se puede reemplazar una expresión por su valor sin cambiar el resultado del programa.

## 2. Leer los tipos

| Tipo | Representa |
| --- | --- |
| `Int` | Un entero. |
| `Bool` | `True` o `False`. |
| `Char` | Un carácter, como `'a'`. |
| `[Int]` | Una lista de enteros. |
| `[[Int]]` | Una lista cuyas posiciones contienen listas de enteros. |
| `a` | Un tipo cualquiera; sus apariciones en la firma deben ser compatibles. |

```haskell
sumaDos :: Int -> Int -> Int
sumaDos x y = x + y
```

Se usa como `sumaDos 3 4`. Esta firma permite recibir los dos argumentos sucesivamente. La variante que recibe un par usa `(Int, Int) -> Int` y se llama con `(3, 4)`; conviene mantener una sola notación por función.

## 3. Guardas: decidir entre casos

```haskell
signo :: Int -> Int
signo x
    | x > 0     = 1
    | x == 0    = 0
    | otherwise = -1
```

Se elige la primera guarda verdadera. `otherwise` cubre lo que queda. `=` define; `==` compara.

Una definición local con `where` permite darle nombre a un cálculo auxiliar:

```haskell
cuarta :: Int -> Int
cuarta x = cuadrado x * cuadrado x
    where cuadrado n = n * n
```

**Evaluación:** para `doble (3 + 4)`, el orden aplicativo simplifica primero el argumento: `doble 7`. El orden normal sustituye primero la función: `2 * (3 + 4)`. En este ejemplo ambos llegan a `14`.

## 4. Una lista se separa en cabeza y cola

```text
[3, 7, 2] = 3 : [7, 2]
            x     xs
```

| Patrón | Qué reconoce |
| --- | --- |
| `[]` | Lista vacía. |
| `(x:xs)` | Lista no vacía: primer elemento y lista restante. |
| `(xs:xss)` | Mismo mecanismo; si es una lista de listas, `xs` es la primera sublista. |

Los nombres `x`, `xs` y `xss` son una convención. Lo que fija su significado es el tipo y la posición en el patrón.

**Truco:** si la entrada es `[[1,2], [8], []]`, entonces `xs = [1,2]` y `xss = [[8], []]`.

## 5. Recursión: resolver una parte y seguir con el resto

```haskell
sumar :: [Int] -> Int
sumar [] = 0
sumar (x:xs) = x + sumar xs
```

- **Caso base:** lo que vale la función sin elementos por procesar.
- **Paso recursivo:** usar el primer elemento y resolver una entrada más pequeña.

```text
sumar [3,7]
= 3 + sumar [7]
= 3 + (7 + sumar [])
= 3 + (7 + 0)
= 10
```

La cola se achica en cada llamada hasta llegar a `[]`. Llamar otra vez con la lista completa no hace avanzar la resolución.

## 6. Construir una lista con `:`

```haskell
duplicar :: [Int] -> [Int]
duplicar [] = []
duplicar (x:xs) = (2 * x) : duplicar xs
```

`:` pone **un elemento** al principio de una lista. `duplicar [3,7]` produce `[6,14]`.

| Expresión | Resultado |
| --- | --- |
| `3 : [7,2]` | `[3,7,2]` |
| `[3] : [[7,2]]` | `[[3],[7,2]]` |
| `[3] ++ [7,2]` | `[3,7,2]` |

`++` concatena dos listas. Si una consigna exige implementar las auxiliares, desarrollar también la concatenación que necesites.

## 7. Dos niveles de trabajo

Para obtener la longitud de cada sublista:

```text
[[3,7], [2], []] → [2,1,0]
      exterior: visita cada sublista
      auxiliar: cuenta dentro de esa sublista
```

La función exterior procesa `(xs:xss)`; la auxiliar procesa `(x:xs)`. Esta separación permite cambiar la tarea interior sin rehacer todo el recorrido.

## 💡 Tres correcciones útiles del material

- Una lista es una secuencia: importa el orden y puede repetir elementos.
- La práctica 7, diap. 25, mezcla `:` y concatenación: en Haskell se distingue `elemento : lista` de `lista ++ lista`.
- La frase «no existen estructuras de control» se usa para destacar la recursión. En estos ejercicios usamos ecuaciones, patrones y guardas, en lugar de ciclos imperativos.

## ✅ Antes de avanzar

- [ ] Puedo leer una firma y decir qué entra y qué sale.
- [ ] Distingo `[]` de `[[]]`: cero sublistas frente a una sublista vacía.
- [ ] Puedo separar cabeza y cola en ambos niveles.
- [ ] Sé elegir un caso base: por ejemplo, `0` para una suma y `[]` para construir una lista.

## 📚 Fuentes

[Clase 7 de teoría](../../teoria/material/Clase%207%20-%20Paradigma%20Funcional%20-%202026.pdf), pp. 3–10; [introducción](../../teoria/material/Clase8-Programaci%C3%B3n%20Funcional.pdf), pp. 3–11; [práctica 7](../../practica/enunciados/Clase%207%20-%20Practica.pptx), diap. 24–34; [continuación](../../teoria/material/Clase8-Continuacion-Progr%20Func.pptx), diap. 3–16.

Ejemplos didácticos adaptados con notación consistente de Haskell; resultados seguidos en papel, sin ejecución en un intérprete.
