# 🎯 Patrón de los parciales prácticos

[← Guía de parciales](guiaParciales.md) · [🧩 POO](../estudio/poo/resumen.md) · [🔁 Funcional](../estudio/funcional/resumen.md) · [🔎 Lógica](../estudio/logica/resumen.md)

> **Línea de trabajo:** aprender operaciones que se repiten y después adaptarlas a cada consigna.
>
> Comparación de siete hojas disponibles: 2022, 2023, cuatro modelos de 2024–2025 y febrero de 2026. Priorizamos los cuatro de 2024–2025. Es evidencia de estos modelos, no una garantía del próximo examen ni de su puntaje.

## 🧭 Estructura que se repite

Las siete hojas tienen tres ejercicios: **POO/Smalltalk, funcional y lógica**. POO y lógica contienen cinco incisos; funcional plantea una función sobre una lista de listas.

| Paradigma | Lo que permanece | Lo que cambia |
| --- | --- | --- |
| POO | Un objeto que administra una colección; operaciones y diccionario. | Dominio, método pedido, condiciones y datos que se modifican. |
| Funcional | Entrada anidada: listas de listas. | Auxiliares, condición y forma de la salida. |
| Lógica | Base de hechos dada; relaciones, filtros y cálculos. | Predicados, orden de argumentos y datos que conectan las relaciones. |

## 🧩 POO: cinco operaciones para preparar

En los **cuatro modelos prioritarios**, la secuencia es:

| Inciso | Habilidad | Qué debemos poder resolver |
| --- | --- | --- |
| I | Método de clase compuesta | Recuperar, verificar existencia o consultar si está vacía. |
| II | Creación y carga | Crear el administrador y agregar objetos con sus datos. |
| III | Selección y baja | Mostrar los que cumplen una condición y eliminarlos. |
| IV | Modificación condicionada | Aumentar o descontar un importe; mostrar o calcular lo pedido. |
| V | Agrupación y conteo | Diccionario cuya clave es una categoría y cuyo valor es una cantidad. |

### Cómo aparece en cada hoja

| Modelo | Método pedido | Baja | Modificación | Diccionario |
| --- | --- | --- | --- | --- |
| Inmobiliaria 2024 | Recuperar operación. | Operaciones de alquiler. | Aumentar alquileres por porcentaje. | Cantidad de operaciones por el tipo indicado en la consigna. |
| Congreso 2025 | Verificar existencia de participante. | Participantes sin horas asistidas. | Aumentar cuota si es menor a 10000 y no es estudiante. | Cantidad de participantes por rol. |
| Feria 2025 | Consultar si está vacía. | Stands Java con más de 4 horas al público. | Descuento si no son empresas y el importe es menor a 25000. | Cantidad de stands por categoría. |
| Hospital 2025 | Recuperar paciente. | Condición sobre tipo de internación y días internado. | Aumentar costo diario si no es terapia intensiva y calcular lo pedido. | Cantidad de pacientes por tipo de internación. |

**Para estudiar:** protocolo de la clase compuesta → recorrido y condiciones → modificación → baja por índice o selección separada → `collect:`/`asSet`/`occurrencesOf:` para el diccionario.

No alcanza con reconocer el patrón: hay que respetar si se pide mostrar antes o después del cambio, y sobre qué colección se hace el conteo.

**Variantes de otros años:** 2022 pide mostrar los productos sin stock, sin exigir su baja; 2023 y febrero de 2026 sí incluyen eliminación. La baja es central en los modelos recientes, pero no aparece como obligación en todas las hojas.

**No confundir con herencia:** estos cuatro problemas se centran en una clase que administra objetos. No exigen introducir subclases por cada rol o categoría. Herencia y polimorfismo siguen siendo parte del material de estudio.

## 🔁 Funcional: dos niveles y tres formas de salida

El esquema es **procesar la primera sublista y continuar con las restantes**. Una auxiliar suele resolver la tarea dentro de la sublista.

| Modelo | Operación | Forma de la salida |
| --- | --- | --- |
| Inmobiliaria 2024 | Quitar vocales y unir los resultados. | Una sola lista de caracteres. |
| Congreso 2025 | Contar apariciones de un número solo en sublistas impares. | Lista de conteos; se omiten las sublistas pares. |
| Feria 2025 | Incrementar los elementos de las sublistas pares. | Lista de listas; las impares se conservan. |
| Hospital 2025 | Conservar sublistas cuya longitud sea mayor que un número. | Lista de listas seleccionadas. |

### Herramientas que debemos construir

| Necesidad | Auxiliar para practicar |
| --- | --- |
| Decidir según la longitud | Contar elementos recursivamente. |
| Contar coincidencias | Recorrer, comparar y sumar 1 solo si cumple. |
| Cambiar valores | Construir otra lista con cada elemento transformado. |
| Conservar o descartar | Usar guardas y agregar con `:` solo cuando corresponde. |
| Aplanar | Concatenar la lista resultante con el resultado de las restantes. |

**Receta:** tipo → caso vacío → auxiliar interior → recorrido exterior → condición → comprobar la salida.

La longitud no es la respuesta en todos los ejercicios: a veces solo sirve para decidir si una sublista participa. Primero hay que distinguir si el resultado esperado es `[Int]`, `[[Int]]` o `[Char]`.

**Contraste con otros años:** 2022 cuenta elementos mayores que 4 por sublista; 2023 reemplaza un número por otro; febrero de 2026 incrementa por un valor u otro según la paridad. Todos permiten reutilizar el recorrido, cambiando la operación interior o la condición.

En Feria 2025 se exige desarrollar las funciones utilizadas y no usar primitivas de Haskell. Practicaremos auxiliares propias, apoyados en la clase 7 y su continuación.

## 🔎 Lógica: conectar, filtrar y calcular

En las siete hojas se parte de hechos dados y se piden **cinco reglas o consultas**. Las operaciones recurrentes son:

1. Identificar qué valores deben obtenerse.
2. Encontrar los hechos que contienen esos datos.
3. Conectarlos mediante variables compartidas.
4. Aplicar condiciones de categoría, estado, edad, antigüedad u otras cantidades.
5. Calcular un resultado cuando corresponde, después de recuperar sus valores.

| Modelo | Conexiones principales | Ejemplos de cálculo |
| --- | --- | --- |
| Inmobiliaria 2024 | Nombre, legajo, código de cargo y categoría. | Sueldo más importe de horas extra. |
| Congreso 2025 | Nombre, legajo, código de categoría y tipo de cargo. | Sueldo más importe de horas extra. |
| Feria 2025 | Código del animal y especie; estado, origen, recinto y ficha. | Edad más crías; suma de edades de dos animales. |
| Hospital 2025 | Nombre, ID del mecánico, código de especialidad y tipo de contratación. | Tarifa más horas extra. |

**Para estudiar:** leer predicados → dibujar las conexiones → escribir la regla → agregar filtros → usar `is` para calcular → comprobar una respuesta.

Lo reutilizable es el camino entre los datos. **No memorizar el orden de argumentos:** cambia entre bases. Tampoco hay que multiplicar hechos al azar usando variables distintas para un mismo código.

Las siete consignas lógicas analizadas no piden trabajar con listas recursivas. El PDF de la cátedra sí las incluye: primero vamos a dominar relaciones, filtros y cuentas para estos modelos.

## 🛠️ Línea de trabajo propuesta

| Paso | Qué haremos | Cómo sabremos que podemos avanzar |
| --- | --- | --- |
| 1 | Practicar las herramientas básicas de cada paradigma. | Podemos explicar un recorrido, una auxiliar y una relación entre hechos. |
| 2 | Resolver Congreso 07/11/2025 con guía, inciso por inciso. | Cada decisión se puede justificar y comprobar en papel. |
| 3 | Resolver Feria 28/11/2025 con menos ayuda. | Podemos adaptar condiciones y reconocer una base lógica diferente. |
| 4 | Trabajar Inmobiliaria 2024 y Hospital 2025. | Podemos aplanar o filtrar sublistas y detectar detalles ambiguos. |
| 5 | Resolver un modelo completo sin consultar la receta. | Cubrimos todos los incisos y después corregimos los errores. |

No usamos una respuesta acertada como prueba definitiva de dominio; comprobamos que se pueda explicar y adaptar a otra consigna.

## ⚠️ Detalles de las hojas que hay que revisar

- **Inmobiliaria 2024:** el inciso III elimina alquileres y el IV aumenta alquileres. Si se ejecutan estrictamente en secuencia sobre la misma colección, el aumento no tendría candidatos. Además, V menciona «tipo de empleado», aunque el tipo explícito en los datos es alquiler/venta de la operación. Registrar la ambigüedad antes de fijar una interpretación.
- **Congreso 2025:** el encabezado de `antigüedad` indica legajo, pero los hechos usan nombres. Leer los hechos y explicitar la interpretación.
- **Límites:** «más de», «menor a» y «al menos» no son intercambiables. Probar un caso exactamente en el umbral.

## 📎 Fuentes de la comparación

Fechas leídas en los encabezados de las fotos, no en el nombre del archivo:

- [29/11/2024 · Inmobiliaria, S23](imagenesRecibidas/WhatsApp%20Image%202026-11-05%20at%2019.16.40.jpeg).
- [07/11/2025 · Congreso, S23](imagenesRecibidas/WhatsApp%20Image%202026-11-05%20at%2019.18.25.jpeg).
- [28/11/2025 · Feria, S23](imagenesRecibidas/WhatsApp%20Image%202026-11-05%20at%2019.16.41.jpeg).
- [03/12/2025 · Hospital, S24](imagenesRecibidas/WhatsApp%20Image%202026-11-05%20at%2019.16.41%20%281%29.jpeg).
- Contraste: [2022](Parcial_2022.png), [2023](Parcial_2023.png) y [13/02/2026](imagenesRecibidas/WhatsApp%20Image%202026-11-05%20at%2019.16.41%20%282%29.jpeg).

Apoyo para resolver: [práctica 5](../practica/enunciados/Clase%205%20%20-%20Practica.pptx), diap. 4–12; [práctica 7](../practica/enunciados/Clase%207%20-%20Practica.pptx), diap. 28–34; [continuación funcional](../teoria/material/Clase8-Continuacion-Progr%20Func.pptx), diap. 7–17 y 22; [práctica 8](../practica/enunciados/Clase%208%20-%20Practica.pptx), diap. 18–27.
