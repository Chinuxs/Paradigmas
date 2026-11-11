# 🔎 Lógica · Resumen de teoría y práctica

[← Tema](inicio.md) · [📖 Ampliar teoría](teoria.md) · [✏️ Resolución paso a paso](practica.md)

> **Idea central:** expresar relaciones mediante hechos y reglas, y hacer consultas sobre ellas.
>
> Síntesis del material de la cátedra. Las reglas de resolución propuestas se distinguen de los hechos y consignas originales.

## 📖 Teoría que conviene recordar

| Concepto | Explicación corta |
| --- | --- |
| Base de conocimiento | Conjunto de hechos y reglas. |
| Hecho | Relación afirmada en la base. |
| Regla | Relación que se cumple si se demuestra su cuerpo. |
| Consulta | Objetivo que se intenta demostrar. |
| Unificación | Vincular términos compatibles y ligar variables. |
| Backtracking | Retroceder para explorar otras alternativas. |

Las consultas pueden validar una afirmación o buscar valores. Que una consulta falle puede significar que no hay información suficiente para demostrarla.

📎 [Teoría lógica](../../teoria/material/clase%209-%20PLogica.pdf), pp. 3–15.

### Sintaxis mínima

| Escribo… | Significa… |
| --- | --- |
| `toyota`, `corolla` | Átomos: datos concretos. |
| `Modelo`, `Precio` | Variables. |
| `_` | Dato que no interesa; cada aparición es independiente. |
| `cabeza :- cuerpo.` | Regla: la cabeza se cumple si se demuestra el cuerpo. |
| `,` / `;` | Y / O entre objetivos. |
| `.` / `%` | Final de cláusula / comentario de línea. |

En `modelo(toyota, corolla, 2011)`, el orden es marca, modelo y año. Cambiar posiciones cambia la relación.

**Clave:** repetir la misma variable conecta el mismo dato entre predicados. Una variable ligada no se sobrescribe como una variable imperativa.

📎 [Teoría lógica](../../teoria/material/clase%209-%20PLogica.pdf), pp. 10–15 y 18; [práctica 8](../../practica/enunciados/Clase%208%20-%20Practica.pptx), diap. 18 y 22.

### Comparar y calcular

| Necesidad | Ejemplo |
| --- | --- |
| Unificar un dato | `X = toyota` |
| Comparar términos ligados | `Marca == toyota` |
| Filtrar por una cantidad | `Km > 10000` |
| Calcular con valores numéricos | `Total is Base + Tasa` |

`is` evalúa su expresión derecha: necesita sus valores numéricos ya ligados. Recuperar los datos **antes** de calcular. `X = 2 + 3` conserva la expresión; `X is 2 + 3` obtiene `5`.

📎 [Teoría lógica](../../teoria/material/clase%209-%20PLogica.pdf), pp. 19–21; [práctica 8](../../practica/enunciados/Clase%208%20-%20Practica.pptx), diap. 19–20. Se precisa el uso de `is`, que el material describe como asignación.

## ✏️ Práctica: receta para escribir una regla

1. **Identificar entradas y salidas.** ¿Qué datos recibe y cuáles debe devolver?
2. **Leer el significado de cada argumento** de los hechos disponibles.
3. **Elegir los hechos necesarios** para obtener las salidas.
4. **Conectarlos con variables compartidas.** No mezclar código, nombre y categoría.
5. **Agregar condiciones** y después los cálculos.
6. **Escribir una consulta** y seguir un caso que cumpla y otro que no.

### Ejemplo de autos

La práctica 8 pide modelo y precio de los Toyota cuyo kilometraje no exceda 100000. Se relacionan `modelo/3`, `precio/2` y `kilometraje/2` a través de `Modelo`.

Resolución propuesta sobre los hechos de la cátedra:

```prolog
toyotaHasta100000(Modelo, Precio) :-
    modelo(toyota, Modelo, _),
    precio(Modelo, Precio),
    kilometraje(Modelo, Km),
    Km =< 100000.
```

Consulta y resultados esperados:

```prolog
?- toyotaHasta100000(Modelo, Precio).
```

| Modelo | Kilometraje | Precio |
| --- | --- | --- |
| corolla | 100000 | 25000000 |
| etios | 15000 | 26750000 |

Hilux queda fuera: tiene 254250 km. **«No exceda» incluye la igualdad**; en Prolog se escribe `=<`.

📎 [Práctica 8](../../practica/enunciados/Clase%208%20-%20Practica.pptx), diap. 22–23. Estos importes corresponden a la presentación; las fotos recibidas tienen otros valores.

### Ejemplo de vuelos: conectar y calcular

Para obtener precio base y total, el camino es:

```text
Código → vuelo → Destino → categoría del destino → tasa
   └──→ precio base
```

Primero obtener esos datos; después calcular `Total is Base + Tasa`. Para `v002`, el material indica base 65000, destino nacional y tasa 8500: total esperado **73500**.

📎 [Práctica 8](../../practica/enunciados/Clase%208%20-%20Practica.pptx), diap. 25–27, inciso 2. El recorrido es una ayuda de resolución de esa consigna.

### Listas: parte adicional del material

Prolog separa cabeza y cola con `[X|Xs]`. En los ejercicios recursivos hay un caso vacío y otro que continúa con la cola. No confundirlo con `(x:xs)` de Haskell.

📎 [Teoría lógica](../../teoria/material/clase%209-%20PLogica.pdf), pp. 23–26. Para ampliar: [teoría del tema](teoria.md).

## ✅ Repaso antes de resolver

- [ ] Puedo explicar cada posición de los predicados que usé.
- [ ] Conecté el mismo dato con la misma variable.
- [ ] Respeté `>` frente a `>=` y `<` frente a `=<`.
- [ ] Las variables de una cuenta ya tienen valores numéricos.
- [ ] Puedo justificar por qué un resultado entra y otro queda fuera.

**Ejercicios de la cátedra para retomar:** autos, práctica 8, diap. 23; luego vuelos, diap. 27. Resultados revisados en papel, sin ejecución en Prolog.
