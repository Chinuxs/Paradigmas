# Helper 5 — Colecciones, iteradores y diccionarios

Fuente: [5-POO-Colecciones.pdf](../material/5-POO-Colecciones.pdf), pp. 3–15. Aplicación: [práctica 4](../../practica/helpers/clase-04-colecciones-farmacia-helper.md).

## Elegir según las operaciones necesarias, pp. 5–11

| Colección | Característica útil | Cuidado |
| --- | --- | --- |
| `Array` | Tamaño fijo y posiciones desde 1 | `at:put:` reemplaza una posición; no usar `add:` para crecer |
| `OrderedCollection` | Tamaño variable y orden de inserción | Orden de inserción no significa orden por precio o nombre |
| `SortedCollection` | Inserta según un criterio de orden | Los objetos deben poder compararse con ese criterio |
| `Set` | Evita elementos repetidos según igualdad | No usarlo esperando posiciones estables |
| `Bag` | Permite repeticiones sin orden posicional | Sirve cuando importa la frecuencia |
| `Dictionary` | Asocia claves con valores | Una nueva asignación a la misma clave reemplaza su valor |
| `Interval` | Representa un rango numérico | Ejemplo del material: `Interval from: 1 to: 100` |

Las jerarquías dibujadas en pp. 3–4 sirven de orientación. Para nombres y organización exactos de la imagen instalada, consultar el Browser de Dolphin.

## Mensajes e iteradores, pp. 12–14

| Propósito | Mensaje | Resultado que interesa |
| --- | --- | --- |
| Recorrer y realizar una acción | `do:` | Efecto de la acción sobre cada elemento |
| Conservar los que cumplen | `select:` | Otra colección con esos elementos |
| Excluir los que cumplen | `reject:` | Otra colección con los restantes |
| Transformar cada elemento | `collect:` | Colección de resultados del bloque |
| Encontrar el primero | `detect:ifNone:` | Un elemento o la alternativa de ausencia |

`size`, `isEmpty` y `asSet` son unarios. `includes:` y `occurrencesOf:` llevan argumento. Una colección seleccionada es distinta de la original, pero sus elementos pueden ser **los mismos objetos**: modificar un alumno seleccionado modifica ese alumno dondequiera que se lo referencie.

```smalltalk
| numeros pares dobles encontrado suma |
numeros := #(1 3 6 8).
pares := numeros select: [:n | n even].
dobles := numeros collect: [:n | n * 2].
encontrado := numeros detect: [:n | n > 6] ifNone: [nil].
suma := 0.
numeros do: [:n | suma := suma + n].
```

Resultados esperados: pares 6 y 8; dobles 2, 6, 12 y 16; encontrado 8; suma 18. El tipo concreto de una colección resultante depende del receptor y la operación.

Para recorrer por índice: `1 to: numeros size do: [:i | suma := suma + (numeros at: i)]`. Reiniciar `suma` antes de repetir el cálculo. Los paréntesis hacen que se recupere el elemento antes de sumarlo.

## Ordenar sin confundir colecciones, pp. 8–10

```smalltalk
| ordenados |
ordenados := SortedCollection sortBlock: [:a :b | a >= b].
ordenados add: 5; add: 8; add: 2.
```

Orden esperado: 8, 5, 2. Para objetos propios, el bloque debe consultar datos comparables, por ejemplo `a verNombre <= b verNombre`. Si cambia el atributo usado para ordenar, revisar cómo restablecer el orden; no suponer que cualquier modificación del objeto reordena automáticamente la colección.

## Diccionario y actividad 5, pp. 11 y 15

```smalltalk
| d |
d := Dictionary new.
d at: 'gorrion' put: 'pajaro'.
d at: 'golondrina' put: 'pajaro'.
```

Hay dos claves distintas y un valor repetido: es válido. En la actividad original, consultar `'golondrina'` o `'gorrión'` devuelve `'pájaro'`. Consultar `'pavo'` con `at:` no encuentra una clave y provoca un error; para preverlo, usar `at:ifAbsent:`.

- `d at: 'fuego' ifAbsent: ['no lo se']` devuelve el texto alternativo y **no agrega** esa clave.
- `d removeKey: 'fuego' ifAbsent: [nil]` no elimina otro elemento si la clave no existe.
- El `^nil` que aparece en el bloque del PDF retorna del método que lo contiene; no equivale simplemente a producir `nil` dentro de un bloque de Workspace.

## Erratas para corregir antes de copiar

- Pp. 9–10: falta `:` en algunos envíos a `sortBlock:`; p. 9 alterna `s` y `sc`.
- P. 8: `/* ... */` no es comentario Smalltalk; usar comillas dobles.
- P. 12: `ocurrencesOf:` debe ser `occurrencesOf:`; declarar también `sc` si se usa en Workspace.
- P. 13: `suma + col at: i` necesita `suma + (col at: i)` por precedencia.
- P. 14: comprobar que el resultado de `detect:ifNone:` no sea `nil` antes de enviarle `modNota:`.
- `at:put:` en `OrderedCollection` no agrega posiciones nuevas fuera del tamaño existente.

## Repaso: cinco preguntas

1. ¿`collect:` filtra? **Transforma; `select:` filtra.**
2. ¿`detect:` devuelve una colección? **Devuelve un elemento.**
3. ¿`asSet` conserva duplicados? **No.**
4. ¿Puede repetirse un valor de diccionario? **Sí; las claves identifican las asociaciones.**
5. ¿Cómo borrar varios elementos de forma segura? **Seleccionarlos primero y luego eliminarlos recorriendo la selección.**

Controles: colección vacía, ninguna coincidencia, varias coincidencias y claves ausentes. Ejemplos no ejecutados en Dolphin.
