# Helper práctico 5 — Integración de colecciones y herencia

Fuente: [Clase 5  - Practica.pptx](../enunciados/Clase%205%20%20-%20Practica.pptx), diapositivas 4–25. Apoyos: [práctica 4](clase-04-colecciones-farmacia-helper.md), [herencia](../../teoria/apuntes/06-herencia-helper.md) y [UML](../../teoria/apuntes/04-uml-helper.md).

## Parte 1: completar Farmacia, diapositivas 4–12

La clase retoma carga, aumento por stock, eliminación de Bagó y cambio de precio de Lotrial; agrega explícitamente el diccionario por laboratorio.

1. Mantener una sola variable para la farmacia: el material alterna `f` y `far`.
2. Declarar temporales de Workspace y convertir entradas numéricas.
3. Resolver incremento con recorrido; stock igual al umbral queda fuera.
4. Resolver bajas con el `whileTrue:` de la diapositiva 7 o con selección previa.
5. Modificar Lotrial; el recorrido de la diapositiva 8 alcanza **todos** los objetos con ese nombre.
6. Construir el diccionario a partir de la colección que queda después de los cambios.

### Por qué el índice no siempre aumenta

```smalltalk
| i rem |
i := 1.
[i <= f tamanio] whileTrue: [
    rem := f recuperar: i.
    (rem verLab = 'Bagó')
        ifTrue: [f eliminar: rem]
        ifFalse: [i := i + 1]].
```

Después de borrar, el siguiente elemento ocupa la posición `i`. Si también se incrementa el índice, se lo salta. Si no se borra, hay que avanzar para que el ciclo termine.

**Control:** para laboratorios Bagó, Bagó, Bayer, el resultado debe contener solo Bayer. Una farmacia vacía no entra al ciclo. Cambiar precios dentro de un recorrido no produce este problema, porque no cambia las posiciones.

El diccionario de la diapositiva 12 sigue `collect:` → `asSet` → `occurrencesOf:` → `at:put:`. El orden de presentación de las claves no está garantizado. Contar remedios no equivale a sumar su stock.

## Parte 2: self y super, diapositivas 14–20

La superclase reúne datos y comportamiento comunes; la subclase especializa. `self` mantiene el receptor original y busca desde su clase real. `super` mantiene el mismo receptor, pero comienza la búsqueda en la superclase de la clase que contiene el método actual.

Para `unObjeto := C new`, los controles de esta práctica son:

| Expresión | Traza resumida | Resultado |
| --- | --- | --- |
| `unObjeto m7` | `super m6` termina enviando `self m2` al objeto C | **9** |
| `unObjeto m1` | C envía `self m4`; en B, `self m2 + super m3` produce 9 + (9 + 9) | **27** |

En el segundo caso `super m3` se busca desde A, porque está escrito dentro de `B>>m4`. No toma el `m3` de B. Los valores difieren de la teoría 6 (8 y 24): son ejercicios con constantes distintas, no resultados contradictorios.

Para resolver sin memorizar, anotar en cada paso: objeto receptor, clase donde está definido el método, inicio de la próxima búsqueda y valor retornado.

## Parte 3: modelar Facultad, diapositivas 22–25

La consigna pide usar estas clases: Alumno, Docente, Ayudante, Persona, Titular de cátedra, Docente adjunto, Facultad y Cátedra. Sugiere combinar composición y herencia.

Propuesta inicial para discutir, sin reemplazar la resolución del estudiante:

- `Persona`: nombre, edad y nacionalidad.
- `Alumno`, subclase de Persona: legajo.
- `Docente`, subclase de Persona: materia y obra social.
- `TitularCatedra`, `DocenteAdjunto` y `Ayudante`: especializaciones de Docente, si esa interpretación de los roles es la que se adopta.
- `TitularCatedra`: año de designación; para docentes que no están a cargo, modelar el vínculo con el docente responsable o recuperarlo a través de Cátedra.
- `Ayudante`: categoría 1/2 y condición de remuneración.
- `Catedra`: código, nombre, carga horaria, carrera, docente a cargo, tipo Curricular/Electiva y nivel 1–5.
- `Facultad`: nombre de universidad y localidad; relacionarla con sus cátedras y participantes.

### Decisiones que el diagrama debe explicar

1. La relación Facultad–Cátedra es candidata para la composición sugerida; justificar el ciclo de vida y elegir multiplicidades. No inferir que una Persona deja de existir al salir de una facultad.
2. Si Cátedra ya conoce su docente a cargo, evitar referencias contradictorias al mismo responsable en otros objetos.
3. Si materia se representa mediante un objeto Cátedra, explicar cómo se obtiene su nombre; no almacenar dos datos independientes sin necesidad.
4. El enunciado no define cómo representar a alguien que es alumno y docente simultáneamente. Registrar esa limitación del modelo simple; no intentar resolverla con herencia múltiple en Smalltalk.

## Control y repaso

- [ ] Los ocho conceptos solicitados están representados.
- [ ] Cada dato de las diapositivas 23–25 tiene ubicación justificada.
- [ ] Las flechas de herencia apuntan a la superclase.
- [ ] Se pueden explicar roles y multiplicidades sin confundir «es un» con «forma parte de».
- [ ] Las trazas de métodos muestran dónde comienza cada búsqueda.

Cinco preguntas: ¿cuándo avanza el índice de baja?, ¿qué cuenta el diccionario?, ¿cambia el receptor con `super`?, ¿por qué la segunda traza da 27?, ¿qué diferencia hay entre la herencia de Docente y la relación Facultad–Cátedra?

Resultados verificados por seguimiento manual de las diapositivas; no ejecutados en Dolphin. El modelo de Facultad es una propuesta de estudio, no un acuerdo del equipo ni una confirmación docente.
