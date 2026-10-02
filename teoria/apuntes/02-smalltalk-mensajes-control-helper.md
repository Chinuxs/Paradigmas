# Helper 2 — Mensajes y estructuras de control

Fuente: [2-POO-Mensajes-EstControl.pdf](../material/2-POO-Mensajes-EstControl.pdf), pp. 3–22.

## Mapa rápido

| Tipo | Cómo reconocerlo | Receptor | Selector | Argumentos |
| --- | --- | --- | --- | --- |
| Unario | No recibe argumentos | `5` | `factorial` | Ninguno |
| Binario | Selector de símbolos; un argumento | `3` | `<` | `5` |
| Palabra clave | Una o más partes terminadas en `:` | `5` | `between:and:` | `1`, `6` |

Tener un argumento no alcanza para ser binario: `at:` y `and:` son de palabra clave.

## Receta para evaluar una expresión

1. Resolvé los paréntesis desde adentro.
2. Resolvé los mensajes unarios.
3. Resolvé los binarios de izquierda a derecha: `*` no tiene prioridad sobre `+`.
4. Resolvé los mensajes de palabra clave con sus argumentos ya evaluados.
5. En cada paso anotá receptor, selector, argumentos y resultado.

Ejemplo: `5 between: 1 + 2 and: 3 * 2 squared`.

- `2 squared` devuelve `4`.
- `1 + 2` devuelve `3`; `3 * 4` devuelve `12`.
- Queda `5 between: 3 and: 12`, que devuelve `true`.

Controles de la actividad de p. 16: `6 squared negated` → `-36`; `2 * 4 + 6 - 3` → `11`; la expresión anterior → `true`.

## Sintaxis que conviene memorizar

```smalltalk
| suma i |
suma := 0.
i := 1.
[i <= 10] whileTrue: [
    suma := suma + i.
    i := i + 1
].
Transcript show: suma displayString; cr.
```

- `:=` asigna una referencia; `=` compara.
- `| suma i |` declara temporales, sin declarar sus tipos.
- `'hola'` es un string; `$h` es un carácter; `#hola` es un símbolo.
- `[...]` es un bloque. Sus argumentos se escriben como `[:i | ...]`.
- `.` separa sentencias; el último puede omitirse antes de cerrar un bloque.
- `;` envía otro mensaje al mismo receptor de la cascada. En el ejemplo, `cr` se envía a `Transcript`.
- Usá comillas simples rectas en código y punto decimal: `19.76`.

## Elegir el control adecuado

| Necesidad | Patrón | Control manual |
| --- | --- | --- |
| Elegir entre dos resultados | `condicion ifTrue: [...] ifFalse: [...]` | Probar ambas ramas |
| Repetir mientras se cumpla algo | `[condicion] whileTrue: [...]` | La condición debe poder cambiar |
| Repetir hasta que se cumpla algo | `[condicion] whileFalse: [...]` | Revisar cuándo termina |
| Recorrer un intervalo entero | `1 to: 10 do: [:i | ...]` | Incluye ambos extremos |

En Smalltalk estos controles se expresan mediante mensajes y bloques. La suma de 1 a 10 debe dar `55` tanto con `whileTrue:` como con `to:do:`.

## Variables y objetos

- **De instancia:** estado propio de cada objeto.
- **De clase:** dato compartido en el ámbito de la clase.
- **Temporales:** trabajo local de un método o fragmento.
- **Argumentos:** objetos recibidos por un método o bloque.

La expresión «no tipado» de p. 11 debe entenderse aquí como **tipado dinámico**. Las variables locales de métodos se declaran; un Workspace puede ofrecer facilidades adicionales. Usar temporales explícitas facilita entender y reutilizar los ejemplos.

## Mensajes útiles del material

| Objetivo | Ejemplo |
| --- | --- |
| Tamaño de cadena | `'hola' size` → `4` |
| Acceder a un carácter | `'hola' at: 1` → `$h` |
| Subcadena | `'hola' copyFrom: 1 to: 2` → `'ho'` |
| Concatenar cadenas | `'ho', 'la'` → `'hola'` |
| Operaciones numéricas | `squared`, `sqrt`, `abs`, `negated` |
| Examinar un objeto | `class`, `inspect`, `isNil`, `notNil` |
| Mostrar un número | `Transcript show: 55 displayString` |
| Pedir texto | `Prompter prompt: 'Nombre'` |

Para entradas numéricas, convertir el texto después de validar la entrada. Revisá en el Browser los selectores disponibles en tu imagen de Dolphin. No copies las mayúsculas o erratas de las tablas como si fueran nombres exactos: por ejemplo, `superclass` y `isKindOf:`.

## Autoevaluación

1. ¿Cuánto da `4 + 2 * 5`? **30.**
2. ¿Por qué `[i < 3]` lleva corchetes al repetir? **La condición debe reevaluarse.**
3. ¿Qué diferencia hay entre `true & false` y `true and: [false]`? **El primero es binario; el segundo es de palabra clave y recibe un bloque.**
4. ¿Por qué no conviene copiar `$h, $o, $l, $a` para construir una cadena? **El ejemplo de p. 19 expresa sus caracteres; para escribir la cadena usá `'hola'`.**

Los fragmentos son material de estudio; no fueron ejecutados en Dolphin durante la preparación de esta guía.
