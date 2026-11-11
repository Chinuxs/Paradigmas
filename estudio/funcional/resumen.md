# 🔁 Funcional · Resumen de teoría y práctica

[← Tema](inicio.md) · [📖 Ampliar teoría](teoria.md) · [✏️ Resolución paso a paso](practica.md)

> **Idea central:** definir funciones que calculan resultados a partir de sus argumentos.
>
> Síntesis del material de la cátedra; ejemplos normalizados a notación consistente de Haskell. Las recetas son ayudas de estudio.

## 📖 Teoría que conviene recordar

| Concepto | Explicación corta |
| --- | --- |
| Función | Relaciona argumentos con un resultado. |
| Tipo | Indica qué datos recibe y qué devuelve. |
| Transparencia referencial | Una expresión pura puede reemplazarse por su valor sin cambiar el resultado. |
| Guarda | Condición que permite elegir una ecuación. |
| Recursión | Resolver una entrada a partir de otra más pequeña. |
| Caso base | Caso que se resuelve sin otra llamada recursiva. |

Las variables representan valores ligados a argumentos; no se actualizan como un contador de un ciclo imperativo.

```haskell
signo :: Int -> Int
signo x
    | x > 0     = 1
    | x == 0    = 0
    | otherwise = -1
```

`=` define una ecuación; `==` compara. Las guardas se prueban en orden. Una auxiliar puede declararse localmente con `where`.

**Evaluación:** en `cuad (5 + 4)`, el orden aplicativo resuelve primero `5 + 4`; el normal sustituye primero `cuad` por su definición. En ese ejemplo ambos obtienen `81`.

📎 [Teoría clase 7](../../teoria/material/Clase%207%20-%20Paradigma%20Funcional%20-%202026.pdf), pp. 3–10 y 16; [introducción](../../teoria/material/Clase8-Programaci%C3%B3n%20Funcional.pdf), pp. 3–11.

### Tipos y listas

| Escribo… | Significa… |
| --- | --- |
| `Int`, `Bool`, `Char` | Entero, booleano, carácter. |
| `[Int]` | Lista de enteros. |
| `[[Int]]` | Lista de listas de enteros. |
| `[a] -> Int` | Recibe una lista de cualquier tipo y devuelve un entero. |
| `[Int] -> Int -> Int` | Recibe una lista y un entero, y devuelve un entero. |

```text
[3,7,2]           → x = 3;     xs  = [7,2]
[[3,7],[2],[]]    → xs = [3,7]; xss = [[2],[]]
```

- `[]`: lista vacía. `[[]]`: una lista con una sublista vacía.
- `(x:xs)`: primer elemento y resto de una lista no vacía.
- `(xs:xss)`: primera sublista y resto de una lista de listas.
- `:` construye una lista agregando un elemento adelante; `++` concatena dos listas.

📎 [Práctica 7](../../practica/enunciados/Clase%207%20-%20Practica.pptx), diap. 24–25; [continuación](../../teoria/material/Clase8-Continuacion-Progr%20Func.pptx), diap. 3–4. Se corrige la mezcla tipográfica entre `:` y concatenación de las diapositivas.

## ✏️ Práctica: receta para listas

1. **Escribir entrada y salida.** ¿Devuelvo un número, una lista o una lista de listas?
2. **Declarar el tipo.** Permite detectar resultados con la forma equivocada.
3. **Resolver el vacío.** Sumar y contar empiezan en `0`; construir una lista, en `[]`.
4. **Separar cabeza y cola.** Trabajar con el primer elemento y llamar con el resto.
5. **Construir el resultado.** Usar `+` para acumular cantidades y `:` para construir listas.
6. **Trazar un ejemplo pequeño.** Verificar cómo llega al caso base.

### Una lista: sumar y contar

```haskell
sumar :: [Int] -> Int
sumar [] = 0
sumar (x:xs) = x + sumar xs

contar :: [a] -> Int
contar [] = 0
contar (x:xs) = 1 + contar xs
```

`sumar [3,7]` devuelve `10`; `contar [3,7]` devuelve `2`. Cambia lo que se acumula; el recorrido se conserva.

📎 [Práctica 7](../../practica/enunciados/Clase%207%20-%20Practica.pptx), diap. 28–29.

### Lista de listas: separar dos tareas

La cátedra pide devolver la longitud de cada sublista:

```haskell
longLis :: [[Int]] -> [Int]
longLis [] = []
longLis (xs:xss) = contar xs : longLis xss
```

Usa `contar` de arriba como auxiliar. Para `[[3,7],[2],[]]`, el resultado es `[2,1,0]`.

**Para recordarlo:** la función exterior visita sublistas; la auxiliar trabaja dentro de una sublista.

📎 [Práctica 7](../../practica/enunciados/Clase%207%20-%20Practica.pptx), diap. 33–34. Se separa la auxiliar local de la diapositiva en una definición propia.

### Cómo cambia según la consigna

| Me piden… | Qué hace la función exterior |
| --- | --- |
| Un resultado por sublista | Agrega `auxiliar xs` con `:`. |
| Conservar sublistas que cumplen | Agrega `xs` si cumple; si no, sigue sin agregarla. |
| Transformar todas las sublistas | Agrega la sublista transformada. |

**Ejercicio de la cátedra:** conservar las sublistas cuyos elementos suman `k`. Con `[[6,14],[7,10,3],[15,20,3,50]]` y `k = 20`, se conservan las dos primeras.

📎 [Continuación](../../teoria/material/Clase8-Continuacion-Progr%20Func.pptx), diap. 17 y 22. La solución de la diap. 22 omite el caso de la lista exterior vacía: al completarla debe retornar `[]`.

## ✅ Repaso antes de resolver

- [ ] Escribí todas las auxiliares necesarias y sus tipos.
- [ ] Cada llamada procesa la cola y acerca al caso base.
- [ ] Todas las ramas devuelven el mismo tipo.
- [ ] Probé `[]`, `[[]]` y una lista con varias sublistas.

**También aparecen en la teoría:** `map` transforma elementos; `filter` conserva los que cumplen; `take` toma una cantidad inicial; `takeWhile` toma el prefijo que cumple una condición. Fuente: práctica 7, diap. 26, y continuación, diap. 5–6.

**Condición del material:** la clase 7, p. 8 y práctica diap. 8, excluye `map`, `filter`, `take` y `takeWhile` del parcial. Para estas guías se prioriza la recursión explícita; revisar la consigna actual para conocer su alcance.

Ejemplos y resultados revisados en papel, sin ejecución en Haskell.
