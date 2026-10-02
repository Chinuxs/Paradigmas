# Helper 3 — Diseño e implementación de clases

Fuente: [3- POO-ClaseLibro.pdf](../material/3-%20POO-ClaseLibro.pdf), pp. 3–15.

## La idea que une la clase

Primero definís qué mensajes entiende un objeto (**protocolo**). Después implementás esos mensajes. La aplicación usa el protocolo para crear, consultar y modificar objetos.

| Parte | Receptor | Responsabilidad |
| --- | --- | --- |
| Método de clase | `Libro` | Crear una instancia inicializada |
| Inicializador de instancia | El libro recién creado | Cargar sus atributos |
| Consulta | Un libro | Retornar un atributo con `^` |
| Modificación | Un libro | Cambiar su estado |

Estado del ejemplo: `isbn titulo autor editorial estado dni`. Inicialmente, `estado := false` y `dni := 0`: el libro no está prestado.

## Receta para implementar Libro

1. Crear la clase y sus variables de instancia.
2. Acordar nombres exactos de selectores. En esta guía usamos `iniLibroIsbn:tit:aut:edit:` y `modiTitulo:`.
3. Implementar el inicializador, incluyendo estado y DNI iniciales.
4. Implementar la creación del lado de clase y las consultas/modificaciones del lado de instancia.
5. Crear un libro con datos conocidos; consultar todos sus atributos.
6. Crear un segundo libro y verificar que modificar uno no altere al otro.
7. Recién entonces escribir la aplicación de comparación.

Ejemplos de métodos separados, para ubicar del lado indicado:

```smalltalk
"Lado de clase"
crearLibroIsbn: unIsbn tit: unTit aut: unAut edit: unaEdit
    ^self new iniLibroIsbn: unIsbn tit: unTit aut: unAut edit: unaEdit
```

```smalltalk
"Lado de instancia"
iniLibroIsbn: unIsbn tit: unTit aut: unAut edit: unaEdit
    isbn := unIsbn.
    titulo := unTit.
    autor := unAut.
    editorial := unaEdit.
    estado := false.
    dni := 0.
    ^self
```

```smalltalk
verTitulo
    ^titulo
```

```smalltalk
modiTitulo: unTit
    titulo := unTit
```

`^self` hace explícito que el inicializador devuelve el libro. Los bloques de código representan métodos distintos; no se pegan juntos como una aplicación de Workspace.

## Aplicación de los dos libros, pp. 7–8

1. Crear y cargar dos instancias usando el método de clase.
2. Comparar sus autores con consultas.
3. Si coinciden, comparar los ISBN y mostrar el título correspondiente al menor.
4. Si no coinciden, informar esa situación.
5. Probar ISBN iguales y definir qué mostrar: el ejemplo elige el segundo mediante `ifFalse:`.

El material captura ISBN como texto. Acordá si el ejercicio espera comparación textual o numérica; no mezcles ambos tipos. Para un ISBN real, conservarlo como identificador textual evita perder ceros o guiones.

## Actividad PuntoDelPlano: receta

La p. 14 también lo llama «Clase Punto». Elegí un nombre coherente; `PuntoDelPlano` permite distinguir tu clase de las clases del entorno.

1. Estado: `x y`.
2. Método de clase: `crearConX:conY:`.
3. Consultas: `posx`, `posy`. Modificaciones: `modx:`, `mody:`.
4. Crear dos puntos y calcular las diferencias de coordenadas mediante consultas.
5. Aplicar Pitágoras con paréntesis explícitos:

```smalltalk
dx := p2 posx - p1 posx.
dy := p2 posy - p1 posy.
distancia := ((dx squared) + (dy squared)) sqrt.
```

Controlá `(0,0)` y `(3,4)` → `5`; puntos iguales → `0`; al invertirlos debe mantenerse la distancia. Probá también coordenadas negativas.

## Erratas para no trasladar al código

- P. 4 usa `iniLibro:...`; pp. 9–10 usan `iniLibroIsbn:...`. El envío y el método implementado deben coincidir.
- Pp. 6 y 12 alternan `modiTítulo:` y `modiTit:`; además aparece `tit := unTit` aunque el atributo es `titulo`. Unificá nombres.
- El texto alterna `título` y `titulo`: usá el identificador declarado.
- `modiEstado` invierte un booleano. Coordinarlo con `modiDni:` es necesario para evitar «no prestado con DNI asignado». Como mejora de diseño, pueden existir operaciones de préstamo y devolución que mantengan ambos datos consistentes.

## Preguntas para defender lo aprendido

- ¿Por qué `crearLibroIsbn:...` pertenece a la clase? **Se necesita crear el objeto antes de poder enviarle mensajes de instancia.**
- ¿Qué ocurre si una consulta no retorna el atributo? **El llamador no recibe el dato esperado; usá `^atributo`.**
- ¿Por qué la aplicación pide `verAutor`? **Porque trabaja con la interfaz del objeto.**
- ¿Qué diferencia hay entre construir e inicializar? **Construir obtiene una instancia; inicializar establece su estado inicial.**

Ejemplos revisados para estudio, sin ejecución en Dolphin en esta preparación.
