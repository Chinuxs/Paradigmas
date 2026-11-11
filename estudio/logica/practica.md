# ✏️ Lógica · Cómo construir una regla

[← Tema](inicio.md) · [📖 Repasar teoría](teoria.md) · [📝 Parciales](../../parciales/guiaParciales.md)

⚡ [Resumen de teoría y práctica](resumen.md)

> **Receta:** salidas → hechos necesarios → variables compartidas → condiciones → cálculos → consulta de control.

## 1. Traducí la consigna a una ficha

Ejemplo de la [práctica 8, diap. 23](../../practica/enunciados/Clase%208%20-%20Practica.pptx): obtener modelo y precio de los Toyota cuyo kilometraje no exceda 100000.

| Pregunta | Respuesta |
| --- | --- |
| ¿Qué devolver? | Modelo y precio. |
| ¿De dónde sale la marca? | `modelo(Marca, Modelo, Anio)`. |
| ¿De dónde salen precio y km? | `precio(Modelo, Precio)` y `kilometraje(Modelo, Km)`. |
| ¿Qué dato conecta todo? | `Modelo`. |
| ¿Qué condiciones hay? | Marca Toyota y `Km =< 100000`. |

En Prolog, «menor o igual» se escribe `=<`.

## 2. Escribí las relaciones antes de los filtros

```prolog
toyotaHasta100000(Modelo, Precio) :-
    modelo(toyota, Modelo, _),
    precio(Modelo, Precio),
    kilometraje(Modelo, Km),
    Km =< 100000.
```

Consulta:

```prolog
?- toyotaHasta100000(Modelo, Precio).
```

Con los hechos de esa presentación se obtienen Corolla y Etios, con sus respectivos precios. Hilux queda fuera por su kilometraje. Las fotos del ejercicio de autos tienen otros importes: usar los valores de la fuente elegida.

## 3. Pasá a una base con personas

En el [parcial 2023](../../parciales/Parcial_2023.png), el cargo conecta el nombre con el sueldo; la antigüedad se consulta por nombre.

```text
Nombre ── cargo ──> Cargo ── sueldo ──> Sueldo
   └──── antigüedad ────> Años
```

Para «cargo y nombre de quienes tengan más de 11 años de antigüedad», necesitás `cargo/2` y `antigüedad/2`. **Respetá el orden de la foto:** allí `cargo(Cargo, Nombre)` tiene el orden inverso al ejemplo didáctico de la teoría.

<details>
<summary>👀 Ver una regla posible y su consulta</summary>

```prolog
personalAntiguo(Cargo, Nombre) :-
    cargo(Cargo, Nombre),
    antigüedad(Nombre, Anios),
    Anios > 11.
```

```prolog
?- personalAntiguo(Cargo, Nombre).
```

Con los hechos de la hoja, cumplen Victoria, Macarena y Sofía. La regla usa el nombre de predicado `antigüedad` que aparece en la fuente; debe coincidir con la base que cargues.

</details>

## 4. Si hay códigos, dibujá el camino

Los parciales recientes pueden separar nombre, legajo y código de categoría. No alcanza con usar el mismo nombre de variable en posiciones que representan cosas distintas.

Ejemplo del [07/11/2025](../../parciales/imagenesRecibidas/WhatsApp%20Image%202026-11-05%20at%2019.18.25.jpeg):

```text
personalLegajo(Nombre, Legajo)
cargo(CodCategoria, Tipo, Nombre)
categoria(CodCategoria, Categoria)
sueldo(Categoria, Tipo, Sueldo)
```

Para obtener nombre, categoría y sueldo:

```prolog
datosSueldo(Nombre, Categoria, Sueldo) :-
    cargo(CodCategoria, Tipo, Nombre),
    categoria(CodCategoria, Categoria),
    sueldo(Categoria, Tipo, Sueldo).
```

**Truco:** para una misma categoría puede cambiar el sueldo según el tipo de cargo. Compartir tanto `Categoria` como `Tipo` evita cruzar salarios de tipos distintos.

## 5. Agregá cálculos solo cuando tengas los datos

Para calcular sueldo más horas extra en el modelo del 07/11/2025:

```prolog
totalConExtras(Nombre, Total) :-
    personalLegajo(Nombre, Legajo),
    datosSueldo(Nombre, _, Base),
    importeHExtras(Legajo, Extra),
    Total is Base + Extra.
```

Esto alcanza a quienes tienen un hecho de horas extra, como pide ese inciso. No supone que quienes carecen de ese hecho cobren cero extras: ese sería otro requisito.

## 💡 Cómo revisar una base fotografiada

| Mirá… | Por qué importa |
| --- | --- |
| Los hechos, además de los encabezados | En la hoja del 07/11/2025, `antigüedad` usa nombres aunque el encabezado dice legajo. |
| Cada posición de un predicado | En otras hojas, `cargo` cambia de estructura y orden. |
| Las condiciones exactas | «Más de 10» es `> 10`; «al menos 10» es `>= 10`. |
| Qué significa «mostrar» | Si piden regla o consulta, exponer sus resultados; usar `write` cuando soliciten impresión explícita. |
| Los nombres de los predicados | `importeHExtras` y `horasExtra` no son el mismo predicado. |

Si una errata deja un dato ambiguo, registrar la corrección que se propone antes de resolver. No unir nombre y legajo como si fueran intercambiables.

## ✅ Controlá una respuesta a mano

1. Elegí una persona que debería cumplir.
2. Buscá cada hecho que necesita la regla.
3. Anotá cómo se ligan las variables.
4. Comprobá las condiciones y el total.
5. Elegí otra persona que debería quedar fuera y explicá dónde falla.

**Tu turno:** resolver el ejercicio 3 de 2023, primero los incisos sin cuentas y después los de sueldo total. Como segunda etapa, usar una base con códigos en la [guía de parciales](../../parciales/guiaParciales.md).

## 📚 Fuentes

[Práctica 8](../../practica/enunciados/Clase%208%20-%20Practica.pptx), diap. 18–23; [teoría lógica](../../teoria/material/clase%209-%20PLogica.pdf), pp. 7–22; parciales 2023 y 07/11/2025, ejercicio 3. Reglas propuestas y respuestas seguidas en papel; sin ejecución en Prolog.
