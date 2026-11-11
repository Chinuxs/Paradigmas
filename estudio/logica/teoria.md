# 📖 Lógica · Entender hechos, reglas y consultas

[← Tema](inicio.md) · [Siguiente: resolver ejercicios →](practica.md)

⚡ [Resumen de teoría y práctica](resumen.md)

## 1. La base de conocimiento

Una base contiene **hechos** y **reglas**. A partir de ellos se intentan demostrar **consultas**.

```prolog
persona(ana).
cargo(ana, docente).
sueldo(docente, 80000).
```

Estos hechos dicen que Ana es una persona, tiene cargo docente y el sueldo del cargo docente es 80000. Cada línea termina con punto.

| Elemento | Ejemplo | Qué representa |
| --- | --- | --- |
| Átomo | `ana`, `docente` | Un dato concreto. |
| Número | `80000` | Un valor numérico. |
| Variable | `Persona`, `Cargo`, `Sueldo` | Un dato por determinar. |
| Predicado | `cargo/2` | Una relación de dos argumentos. |

`cargo(ana, docente)` y `cargo(docente, ana)` no significan lo mismo. **El orden de los argumentos forma parte de la relación.**

## 2. Una consulta pregunta por los hechos

```prolog
?- cargo(ana, docente).
?- cargo(ana, Cargo).
```

La primera valida y tiene éxito. La segunda busca y obtiene `Cargo = docente`.

`?-` representa el indicador de la consola: no se escribe delante de los hechos o reglas guardados en el archivo.

**Variable anónima:** `_` indica que ese dato no interesa. Cada aparición de `_` es independiente; repetir `_` no conecta dos relaciones.

## 3. Unificación: compartir una variable

```prolog
?- cargo(Persona, Cargo), sueldo(Cargo, Sueldo).
```

La misma variable `Cargo` conecta ambos hechos:

```text
persona       cargo       sueldo
  ana ──────> docente ────> 80000
```

El resultado es `Persona = ana`, `Cargo = docente`, `Sueldo = 80000`.

La variable no es una celda que se va sobrescribiendo. Se liga a términos compatibles durante una alternativa de la búsqueda; el retroceso puede deshacer esas ligaduras para explorar otra.

## 4. Una regla le pone nombre a una relación

```prolog
sueldoPersona(Persona, Sueldo) :-
    cargo(Persona, Cargo),
    sueldo(Cargo, Sueldo).
```

Se lee: «Una persona tiene ese sueldo **si** tiene un cargo cuyo sueldo es ese».

| Símbolo | Significado |
| --- | --- |
| `:-` | La cabeza se cumple si se demuestra el cuerpo. |
| `,` | Y: deben cumplirse ambos objetivos. |
| `;` | O: alternativas; usar paréntesis al combinarlo con otras condiciones. |
| `.` | Termina el hecho, regla o consulta. |

La cabeza expone lo que la regla permite consultar. El cuerpo conecta los datos y verifica las condiciones.

## 5. Comparar y calcular

```prolog
totalConExtra(Persona, Total) :-
    sueldoPersona(Persona, Base),
    horasExtra(Persona, Extra),
    Total is Base + Extra.
```

Este ejemplo supone hechos `horasExtra/2` con importes numéricos.

| Operación | Ejemplo | Uso |
| --- | --- | --- |
| Unificar | `X = ana` | Vincular términos compatibles. |
| Comparar términos ya ligados | `Cargo == docente` | Comprobar identidad de términos. |
| Evaluar una cuenta | `Total is Base + Extra` | Calcular con datos numéricos ya ligados. |
| Comparar cantidades | `Edad > 50` | Filtrar cuando `Edad` ya es numérica. |

**Truco:** `X = 2 + 3` liga `X` a la expresión; `X is 2 + 3` obtiene `5`. Primero recuperar los valores; después compararlos o calcular.

## 6. Cómo aparecen varias respuestas

El motor intenta objetivos de izquierda a derecha y busca alternativas entre hechos y reglas. Si un camino falla, vuelve a un punto de elección anterior: **backtracking**.

En la consola, `;` suele pedir otra respuesta. Una consulta puede devolver varias personas si varias cumplen las condiciones.

Si no se puede demostrar algo con la base disponible, la consulta falla. Eso no prueba necesariamente que sea falso en el mundo real.

## 7. Listas: una segunda etapa

En Prolog se separan con `[X|Xs]`, no con `(x:xs)` de Haskell.

```prolog
longitud([], 0).
longitud([_|Xs], N) :-
    longitud(Xs, Resto),
    N is Resto + 1.
```

La consulta `longitud([a,b], N)` obtiene `N = 2`. Hay un caso vacío y otro que reduce la lista; el número se calcula después de resolver la cola.

## ✅ Antes de avanzar

- [ ] Distingo un hecho de una regla y de una consulta.
- [ ] Puedo decir qué significa cada argumento de un predicado.
- [ ] Uso una misma variable para enlazar el mismo dato.
- [ ] Recupero valores antes de usar comparaciones o `is`.
- [ ] Puedo explicar por qué una consulta devuelve más de una respuesta.

## 📚 Fuentes

[Teoría lógica](../../teoria/material/clase%209-%20PLogica.pdf), pp. 3–15, 18–24; [práctica 8](../../practica/enunciados/Clase%208%20-%20Practica.pptx), diap. 6–20. Ejemplos propios adaptados para explicar los conceptos; resultados revisados en papel, sin ejecución en Prolog.
