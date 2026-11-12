# 🎯 Patrón de los parciales prácticos

[← Guía de parciales](guiaParciales.md) · [🧩 POO](../estudio/poo/resumen.md) · [🔁 Funcional](../estudio/funcional/resumen.md) · [🔎 Lógica](../estudio/logica/resumen.md)

> **Línea de trabajo:** aprender operaciones que se repiten y después adaptarlas a cada consigna.
>
> Comparación inicial de siete modelos, ampliada el 12/11/2026 con las fotos de [Más parciales](indiceMasParciales.md). Ahora tenemos **doce modelos distintos de 2024–2025** para priorizar, además de modelos antiguos y vistas repetidas. Es evidencia de estas hojas, no una garantía del próximo examen ni de su puntaje.

## 🧭 Estructura que se repite

Las siete hojas iniciales tienen tres ejercicios: **POO/Smalltalk, funcional y lógica**. Las nuevas fotos mantienen esa división en los modelos completos legibles, pero amplían las variantes: hay trazas de herencia, distintos incisos de gestión y funciones con dos entradas anidadas o salida escalar. No corresponde fijar una cantidad universal de incisos de POO ni descartar herencia.

| Paradigma | Lo que permanece | Lo que cambia |
| --- | --- | --- |
| POO | Gestión de colecciones; operaciones y diccionario en los modelos recientes. | Dominio, método, condiciones y presencia de trazas de `self`/`super`. |
| Funcional | Recorridos recursivos sobre datos anidados. | Una o dos entradas, auxiliares, condición y salida escalar o lista. |
| Lógica | Base de hechos dada; relaciones, filtros y cálculos. | Predicados, orden de argumentos y datos que conectan las relaciones. |

## 🧩 POO: cinco operaciones para preparar

En los **cuatro primeros modelos de 2024–2025 revisados**, la secuencia es la siguiente. Es una familia de ejercicios; las fotos nuevas muestran otras combinaciones y órdenes.

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
| Hospital 2025 | Recuperar paciente. | Cirugía con 0 días internado. | Aumentar costo diario de terapia intensiva y calcular lo pedido. | Cantidad de pacientes por tipo de internación. |

**Para estudiar:** protocolo de la clase compuesta → recorrido y condiciones → modificación → baja por índice o selección separada → `collect:`/`asSet`/`occurrencesOf:` para el diccionario.

No alcanza con reconocer el patrón: hay que respetar si se pide mostrar antes o después del cambio, y sobre qué colección se hace el conteo.

**Variantes de otros años:** 2022 pide mostrar los productos sin stock, sin exigir su baja; 2023 y febrero de 2026 sí incluyen eliminación. La baja es central en los modelos recientes, pero no aparece como obligación en todas las hojas.

**No confundir con herencia:** estos cuatro problemas se centran en una clase que administra objetos. No exigen introducir subclases por cada rol o categoría. Herencia y polimorfismo siguen siendo parte del material de estudio.

### Otra familia confirmada: gestión más traza de herencia

Las fotos de Clínica 05/11/2024, Clínica 06/11/2024, Empresa 05/11/2024 y Laboratorio 07/11/2025 agregan un envío como `unObjeto := C new. unObjeto m3` sobre clases relacionadas. **Herencia también se toma en los prácticos de 2024 y 2025.**

La receta es anotar receptor real, clase que define el método, inicio de búsqueda con `self` o `super` y retorno. Apoyo: [herencia de la cátedra](../teoria/material/6-POO-Herencia.pdf), pp. 10–13, y [guía de trazas](../teoria/apuntes/06-herencia-helper.md). Fuentes de las hojas: [inventario nuevo](indiceMasParciales.md).

Otras variantes nuevas: cambiar un dato textual, comparar conteos y contar solo los objetos que cumplen una condición dentro de cada grupo. Supermercado 28/11/2025 invierte el orden de aumento y baja respecto de algunos modelos anteriores.

## 🔁 Funcional: reconocer entradas y salida antes de recurrir

El esquema es **procesar la primera sublista y continuar con las restantes**. Una auxiliar suele resolver la tarea dentro de la sublista.

Eso cubre una entrada anidada. Si la consigna recibe dos listas de listas, hay que definir cómo se relacionan sus recorridos. La salida no siempre es una lista.

| Modelo | Operación | Forma de la salida |
| --- | --- | --- |
| Inmobiliaria 2024 | Quitar vocales y unir los resultados. | Una sola lista de caracteres. |
| Congreso 2025 | Contar apariciones de un número solo en sublistas impares. | Lista de conteos; se omiten las sublistas pares. |
| Feria 2025 | Incrementar los elementos de las sublistas pares. | Lista de listas; las impares se conservan. |
| Hospital 2025 | Conservar sublistas cuya longitud sea mayor que un número. | Lista de listas seleccionadas. |

La revisión de `Mas Parciales` agrega estas variantes:

| Modelo | Operación | Forma de salida y cuidado |
| --- | --- | --- |
| Clínica 06/11/2024 | Contar apariciones de un número en cada sublista. | Una lista de conteos. Base directa para Congreso 2025. |
| Club 05/11/2025 | Contar pares e impares por sublista. | Una lista plana con dos cantidades por sublista; no asumir que se piden tuplas. |
| Laboratorio 07/11/2025 y Supermercado 28/11/2025 | Promedio solo de sublistas de longitud par. | Lista de promedios; revisar vacío y tipos numéricos. |
| Vehículos 11/12/2024 | Obtener los promedios mayores que un umbral. | Lista de resultados filtrados después del cálculo. |
| Empresa 2024 y Supermercado 2024 | Combinar sumas/restas según paridad. | Leer el texto y comprobar el ejemplo: no confundir paridad del elemento con paridad de la longitud. |
| Departamento 29/11/2023 | Contar elementos de dos listas de listas. | Cantidad total, un escalar. La entrada son dos estructuras anidadas. |
| Clínica 17/11/2023 noche | Reemplazar una aparición por dos números. | Lista de listas cuya longitud interior puede crecer. |

### Herramientas que debemos construir

| Necesidad | Auxiliar para practicar |
| --- | --- |
| Decidir según la longitud | Contar elementos recursivamente. |
| Contar coincidencias | Recorrer, comparar y sumar 1 solo si cumple. |
| Cambiar valores | Construir otra lista con cada elemento transformado. |
| Conservar o descartar | Usar guardas y agregar con `:` solo cuando corresponde. |
| Aplanar | Concatenar la lista resultante con el resultado de las restantes. |
| Promediar | Suma y cantidad; tratar el vacío antes de dividir. |
| Dos resultados por sublista | Construir ambos resultados en el formato pedido. |

**Receta:** tipo → caso vacío → auxiliar interior → recorrido exterior → condición → comprobar la salida.

La longitud no es la respuesta en todos los ejercicios: a veces solo sirve para decidir si una sublista participa. Primero distinguir si el resultado es un escalar, una lista de números, una lista de caracteres o una lista de listas.

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

Las siete consignas lógicas iniciales y los nuevos modelos recientes revisados se centran en hechos, filtros y cálculos. **El parcial antiguo del 15/02/2013 sí pide operaciones con listas en Prolog.** El PDF también las incluye; mantenemos primero relaciones y cuentas por el foco en 2024–2025, sin afirmar que las listas nunca se evalúan.

## 🛠️ Línea de trabajo propuesta

| Paso | Qué haremos | Cómo sabremos que podemos avanzar |
| --- | --- | --- |
| 1 | Practicar herramientas básicas, incluyendo trazas de herencia y promedios funcionales. | Podemos explicar un recorrido, una auxiliar, una búsqueda de métodos y una relación entre hechos. |
| 2 | Resolver Congreso 07/11/2025 con guía, inciso por inciso. | Cada decisión se puede justificar y comprobar en papel. |
| 3 | Resolver Feria 28/11/2025 con menos ayuda. | Podemos adaptar condiciones y reconocer una base lógica diferente. |
| 4 | Agregar Laboratorio 2025 y Club 2025; luego Inmobiliaria 2024 y Hospital 2025. | Podemos trazar herencia, calcular promedios, generar dos conteos y aplanar o filtrar. |
| 5 | Resolver un modelo completo sin consultar la receta. | Cubrimos todos los incisos y después corregimos los errores. |

No usamos una respuesta acertada como prueba definitiva de dominio; comprobamos que se pueda explicar y adaptar a otra consigna.

**Para empezar por funcional:** conteo de apariciones (Clínica 06/11/2024) → pares/impares (Club 2025) → promedios (Laboratorio 2025) → conteo condicionado (Congreso 2025) → transformaciones (Feria 2025) → filtrado y aplanado. Las hojas están enlazadas en [el inventario nuevo](indiceMasParciales.md) y [la guía general](guiaParciales.md).

## ⚠️ Detalles de las hojas que hay que revisar

- **Inmobiliaria 2024:** el inciso III elimina alquileres y el IV aumenta alquileres. Si se ejecutan estrictamente en secuencia sobre la misma colección, el aumento no tendría candidatos. Además, V menciona «tipo de empleado», aunque el tipo explícito en los datos es alquiler/venta de la operación. Registrar la ambigüedad antes de fijar una interpretación.
- **Congreso 2025:** el encabezado de `antigüedad` indica legajo, pero los hechos usan nombres. Leer los hechos y explicitar la interpretación.
- **Límites:** «más de», «menor a» y «al menos» no son intercambiables. Probar un caso exactamente en el umbral.
- **Hospital 03/12/2025:** la [nueva vista](masParciales/WhatsApp%20Image%202026-11-11%20at%2015.35.50.jpeg) permite leer terapia intensiva en el incremento y 0 días en la baja; se corrigió la lectura anterior.
- **Nuevas fotos:** hay ejemplos funcionales que no coinciden claramente con el texto, un ciclo de herencia impreso en Departamento 2023 y datos de lógica sin coincidencias para algunas consultas. Las observaciones están en el [inventario](indiceMasParciales.md); no corregirlos inventando datos.
- **Promedios:** algunos ejemplos muestran valores abreviados como `4.7`, sin especificar una política de redondeo. Separar el cálculo del formato de presentación y no inventar un límite de decimales como requisito.

## 📎 Fuentes de la comparación

Fechas leídas en los encabezados de las fotos, no en el nombre del archivo:

- [29/11/2024 · Inmobiliaria, S23](imagenesRecibidas/WhatsApp%20Image%202026-11-05%20at%2019.16.40.jpeg).
- [07/11/2025 · Congreso, S23](imagenesRecibidas/WhatsApp%20Image%202026-11-05%20at%2019.18.25.jpeg).
- [28/11/2025 · Feria, S23](imagenesRecibidas/WhatsApp%20Image%202026-11-05%20at%2019.16.41.jpeg).
- [03/12/2025 · Hospital, S24](imagenesRecibidas/WhatsApp%20Image%202026-11-05%20at%2019.16.41%20%281%29.jpeg).
- Contraste: [2022](Parcial_2022.png), [2023](Parcial_2023.png) y [13/02/2026](imagenesRecibidas/WhatsApp%20Image%202026-11-05%20at%2019.16.41%20%282%29.jpeg).
- Ampliación: [26 fotos de Más parciales](indiceMasParciales.md), fechadas en 2013, 2023, 2024 y 2025, más un cuestionario sin fecha visible.

Apoyo para resolver: [práctica 5](../practica/enunciados/Clase%205%20%20-%20Practica.pptx), diap. 4–12; [práctica 7](../practica/enunciados/Clase%207%20-%20Practica.pptx), diap. 28–34; [continuación funcional](../teoria/material/Clase8-Continuacion-Progr%20Func.pptx), diap. 7–17 y 22; [práctica 8](../practica/enunciados/Clase%208%20-%20Practica.pptx), diap. 18–27.
