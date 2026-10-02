# Helper práctico 2 — Resolver mensajes paso a paso

Fuente: [Clase 2 - Practica.pptx](../enunciados/Clase%202%20-%20Practica.pptx), diapositivas 4–18. Apoyo: [teoría 2](../../teoria/apuntes/02-smalltalk-mensajes-control-helper.md).

## Receta para todos los ejercicios

1. Revisá que la expresión esté bien escrita: comillas rectas, selectores completos y `:` donde corresponde.
2. Separá paréntesis, mensajes unarios, binarios y de palabra clave.
3. Evaluá en ese orden; los binarios tienen igual prioridad y se resuelven de izquierda a derecha.
4. Por cada envío completá: **receptor / selector / argumentos / resultado**.
5. En expresiones encadenadas, el resultado anterior puede convertirse en el siguiente receptor.
6. Predecí el resultado en papel y luego contrastalo en el Workspace.

Ejemplo completo:

| Expresión | Receptor | Selector | Argumentos | Tipo | Resultado |
| --- | --- | --- | --- | --- | --- |
| `3 between: 1 and: 6` | `3` | `between:and:` | `1`, `6` | Palabra clave | `true` |
| `true and: [false]` | `true` | `and:` | Bloque `[false]` | Palabra clave | `false` |

## Controles para los ejercicios de diapositivas 17–18

Intentá resolverlos antes de mirar la última columna. En los mensajes simples, el receptor es lo que aparece antes del selector; en el anidado, seguí cada resultado intermedio.

| Expresión | Selector / tipo | Resultado esperado |
| --- | --- | --- |
| `'pantalón' reverse` | `reverse`, unario | `'nólatnap'` |
| `2 * 4` | `*`, binario | `8` |
| `3 between: 1 and: 6` | `between:and:`, palabra clave | `true` |
| `true and: [false]` | `and:`, palabra clave | `false` |
| `5 negated` | `negated`, unario | `-5` |
| `'hello ', 'world'` | `,`, binario | `'hello world'` |
| `'sol' at: 1` | `at:`, palabra clave | `$s` |
| `true & true` | `&`, binario | `true` |
| `#('alumno' 'profesor' 'aula') size` | `size`, unario | `3` |
| `25 notNil` | `notNil`, unario | `true` |
| `(2/3) + (3/5) negated` | `/`, `/`, `negated`, `+` | `1/15` |
| `'objetos' includes: $e` | `includes:`, palabra clave | `true` |
| `'Hoy es un día nublado y frío' copyFrom: 1 to: 13` | `copyFrom:to:`, palabra clave | `'Hoy es un día'` |
| `#calor asString` | `asString`, unario | `'calor'` |

En la fracción: los paréntesis producen `2/3` y `3/5`; luego `negated` actúa sobre `3/5`; por último se suma `2/3 + (-3/5)`.

### El ejercicio largo tiene una errata

La diapositiva 18 escribe `between` sin `:`. La expresión así escrita no representa correctamente el mensaje pedido. Interpretación corregida para practicar:

```smalltalk
4 + 8 factorial between: 3 + 4 * 10 and: 'hola' size * 8
```

1. `8 factorial` → `40320`; `'hola' size` → `4`.
2. Receptor del mensaje final: `4 + 40320` → `40324`.
3. Primer argumento: `(3 + 4) * 10` → `70`.
4. Segundo argumento: `4 * 8` → `32`.
5. `40324 between: 70 and: 32` → `false`.

## Correcciones para estudiar con confianza

- Diapositivas 7–8: `and:` y `modPrecio:` aparecen entre ejemplos binarios, pero son de palabra clave.
- Diapositivas 5–6: escribir `factorial`, en minúscula, y `19.76`, con punto decimal, al ejecutar.
- Diapositiva 13: no se declara el tipo de una variable; sí se declaran temporales entre barras en los métodos.
- Diapositiva 14: falta `:` en un `ifFalse`. Usar `ifFalse: [...]`.

## Receta para ciclos

Inicializar acumulador → definir condición o rango → actualizar acumulador → avanzar contador → verificar salida. Para sumar 1 a 10, el control esperado es `55`. Si se repite indefinidamente, revisar primero si el contador cambia y si la condición usa ese contador.

En pareja: una persona hace la traza y otra identifica receptor y selector en cada paso; después intercambian. Los resultados de esta guía se revisaron por razonamiento, sin ejecutar Dolphin.
