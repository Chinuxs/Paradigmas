# Hoja de ruta grupal — Trabajo Integrador 2026

Preparada el **02/10/2026**. Actualizada el **03/10/2026**. Estado: organización inicial; grupo 17, sus tres integrantes, enunciado 1, tutor y fechas de las pautas confirmados. Las tareas y fechas internas de este documento son propuestas de organización.

## 1. Fuentes y requisitos de la cátedra

- [Pautas 2026, p. 2](../enunciado/Trabajo%20Integrador%20-%20Pautas%202026.pdf).
- [Enunciados 2026, pp. 2–9](../enunciado/Trabajo%20Integrador%20-%20Enunciados%202026.pdf).
- [Clase 0 de práctica, diapositiva 8](../../practica/enunciados/Clase%200%20-%20Practica.pptx), para la referencia a Dolphin y la fecha alternativa.

| Exigencia encontrada | Evidencia que debe preparar el grupo |
| --- | --- |
| Grupo de **3 integrantes** | Nómina acordada |
| Diagrama de clases acompañando la entrega | Diagrama actualizado con el código final |
| Uso de un menú | Acceso y recorrido de todas las funciones solicitadas |
| Uso de iteradores de colección | Métodos que los apliquen y explicación durante la defensa |
| Todos los incisos deben funcionar; uno que falle implica desaprobar | Matriz completa de requisitos y pruebas |
| Defensa en coloquio | Todos presentes y todos exponen |
| El trabajo es condición para aprobar la cursada | Reservar tiempo de corrección y preparación oral |

La presentación inicial indica **Dolphin (Smalltalk)**. Confirmar con la cátedra la imagen/versión y la forma de exportar la entrega.

**Herramienta para UML:** al revisar el material disponible el 03/10/2026, el PDF de UML enseña diagramas de clases y secuencias sin recomendar una aplicación particular; las pautas, p. 2, exigen el diagrama de clases sin especificar herramienta ni formato. Ver [helper de UML](../../teoria/apuntes/04-uml-helper.md). La herramienta del equipo sigue pendiente de acuerdo; esta revisión no confirma indicaciones orales.

### Alcance confirmado

El **grupo N.º 17** tiene asignado el **enunciado 1: aerolínea** (PDF de enunciados, p. 2). El tutor es **Gonzalo Baez**, contacto: **gbaez@frlp.utn.edu.ar**.

Fuente de la confirmación: mensaje del tutor compartido por el usuario el 03/10/2026: «Perfecto, tienen asignado el grupo N°17. Tienen el enunciado 1 y como tutor a mí». Nombre y correo también aportados por el usuario.

Cubrir todos los requisitos del enunciado 1. Ver su resumen en el [mapa de enunciados](mapa-de-enunciados.md#1-aerolínea--p-2) y leer la página completa del PDF antes de descomponerlos e implementarlos.

## 2. Fechas de entrega confirmadas

| Fuente | Texto / fecha | Estado |
| --- | --- | --- |
| Pautas 2026, p. 2 | **21/10/2026 - 23/10/2026** | Confirmadas por el usuario el 03/10/2026; distribución para el grupo pendiente de precisar |
| Clase 0, diapositiva 8 | **Semana 12/10** | Referencia reemplazada por las fechas confirmadas de las pautas |
| Pautas 2026, p. 2 | Coloquio cuando el trabajo esté en condiciones | Sin día ni horario publicados en este material |

**Confirmación del usuario (03/10/2026):** rigen las fechas del PDF de pautas, **21/10/2026 y 23/10/2026**. Queda por precisar cómo corresponden al grupo 17, el horario límite, canal/formato de entrega y fecha del coloquio. No se encontró una hora límite. Tampoco hay hitos parciales fechados en los PDFs.

El plan conserva una primera versión completa para el **11/10** como meta interna propuesta, con tiempo posterior para correcciones y preparación de la defensa. Se propone cerrar el paquete el **20/10**, antes de la primera fecha confirmada. Estas metas internas deben revisarse con los requisitos de aerolínea y la disponibilidad del equipo.

## 3. Acuerdos del equipo

Datos confirmados y pendientes para completar con el equipo:

| Dato | Valor |
| --- | --- |
| Número de grupo | **17** |
| Integrantes | **3: Gabriel Matias Piccin, César Augusto Romero y Jorge Murga** |
| Comisión | Pendiente |
| Tutor asignado | **Gonzalo Baez** — gbaez@frlp.utn.edu.ar |
| Enunciado / sistema asignado | **1 — Aerolínea** |
| Fechas de entrega confirmadas | **21/10/2026 y 23/10/2026**, según pautas; distribución para el grupo pendiente de precisar |
| Hora y canal de entrega | Pendiente |
| Entorno de Dolphin compartido | Pendiente |
| Horario de reuniones y canal del grupo | Pendiente |

### Integrantes confirmados

Datos aportados por el usuario el 03/10/2026:

| Nombre y apellido | Correo | Legajo |
| --- | --- | --- |
| Gabriel Matias Piccin | gabrielpiccin797@gmail.com | No informado |
| César Augusto Romero | cromero@alu.frlp.utn.edu.ar | 18370 |
| Jorge Murga | jmurga@alu.frlp.utn.edu.ar | No informado |

### Reparto sugerido para tres integrantes

Cada tarea tiene una persona responsable y otra revisora. Los roles rotan; todos deben conocer el sistema completo para el coloquio. A, B y C son lugares a asignar por acuerdo del equipo; no corresponden todavía a nombres concretos.

| Frente | Responsable y revisión propuestos | Resultado |
| --- | --- | --- |
| Modelo, herencia y cálculos por tipo | A; revisa B | Clases y comportamiento polimórfico |
| Colecciones, búsquedas y restricciones | B; revisa C | Altas, cambios, bajas, consultas y estadísticas |
| Menú e integración | C; revisa A | Flujo completo ejecutable |
| Casos de prueba y documentación | Se distribuyen por función; C coordina | Matriz, diagrama y guía de ejecución |
| Defensa | Todos | Cada integrante explica una parte y puede responder sobre las demás |

Aplicar este reparto al sistema de aerolínea. Evitar que una persona quede únicamente con documentación y desconozca el código.

### Cómo compartir cambios en Dolphin

1. Acordar versión del entorno, nombres de clases y selectores antes de trabajar en paralelo.
2. Guardar en `desarrollo/` el código exportado en el formato que acuerden y acepte la cátedra. Documentar cómo importarlo.
3. Evitar editar simultáneamente la misma clase sin coordinar; una imagen binaria no permite combinar cambios como archivos de texto.
4. Cada cambio debe indicar requisito cubierto, forma de probarlo y responsable de revisión.
5. Integrar diariamente y probar la importación en el equipo de otro integrante.
6. Mantener `documentacion/` junto al código y preparar una copia identificada en `entregables/` para cada entrega.

## 4. Plan de trabajo propuesto

| Fechas internas 2026 | Trabajo | Depende de | Criterio para cerrar |
| --- | --- | --- | --- |
| **02–03/10** | Leer enunciado 1; acordar entorno y detalles de entrega | Alcance y tres integrantes confirmados | Nómina, alcance y dudas registradas; todos abren Dolphin |
| **03–04/10** | Descomponer requisitos y diseñar clases | Alcance confirmado | Diagrama inicial y fila por requisito en la matriz |
| **04–06/10** | Implementar clases, inicialización y comportamiento por subtipo | Modelo y selectores acordados | Instancias de ambos subtipos con cálculos/decisiones comprobados |
| **06–08/10** | Implementar altas, búsqueda, modificación, baja y restricciones | Clases operativas | Casos válidos e inválidos cubiertos; invariantes preservadas |
| **08–10/10** | Completar listados, promedios, extremos, bajas masivas y diccionarios; integrar menú | Colecciones disponibles | Cada requisito accesible y verificable desde el flujo previsto |
| **11/10** | Preparar primera versión completa, diagrama y ensayo grupal | Todas las funciones integradas | Importación en otro equipo y recorrido total de la matriz |
| **12–18/10** | Corregir, cubrir bordes y practicar defensa | Primera versión completa | Todos ejecutan y explican; fallas detectadas corregidas |
| **19–20/10** | Cerrar paquete, verificar instrucciones y copia final | Revisión completa | Entregable reproducible, sin funciones pendientes |
| **21/10 y 23/10**, según corresponda al grupo | Entregar y guardar constancia | Canal y distribución de fechas definidos | Constancia de recepción; coloquio coordinado |

Si el alcance confirmado vuelve inviable este plan, repartir nuevamente los requisitos y consultar prioridades con el ayudante. No recortar por cuenta propia funciones obligatorias.

## 5. Receta técnica por cada sistema requerido

1. **Requisitos:** listar todos los datos y operaciones; marcar condiciones estrictas (`<`, `>`) e inclusivas (`<=`, `>=`).
2. **Modelo:** proponer una clase gestora, una clase base para los elementos y los dos subtipos indicados por el enunciado. Ajustarlo al dominio.
3. **Polimorfismo:** poner el cálculo o decisión variable en cada subtipo; la gestora envía el mismo mensaje a todos.
4. **Colección:** elegir una colección adecuada e inicializarla. Mantener búsquedas y restricciones centralizadas.
5. **Altas y modificaciones:** validar identificadores, capacidades, fechas y presupuestos pertinentes antes de cambiar estado. Una edición también puede violar un límite.
6. **Consultas:** definir exactamente qué población participa en cada listado, promedio, extremo, total o porcentaje.
7. **Iteradores:** elegir según propósito: recorrido, selección, transformación, búsqueda o acumulación. Ejemplos a explorar en el Browser: `do:`, `select:`, `collect:`, `detect:ifNone:` e `inject:into:`.
8. **Bajas masivas:** seleccionar primero los elementos a retirar y luego eliminarlos, evitando modificar la colección que se está recorriendo.
9. **Diccionario:** clave = categoría solicitada; valor = contador. Definir si se muestran categorías sin elementos.
10. **Menú:** vincular cada opción con una operación; manejar opciones inválidas y salida.
11. **Integración:** ejecutar casos normales, vacíos, límites y modificaciones; mantener el diagrama alineado.

Esta receta es una propuesta de implementación. Los detalles particulares de cada sistema están en [el mapa](mapa-de-enunciados.md) y siempre deben contrastarse con el PDF.

## 6. Matriz de seguimiento y prueba

Copiar una fila por cada requisito del alcance confirmado; no agrupar varios resultados diferentes en una sola fila. “Revisado” exige que otra persona lo ejecute.

| ID / página fuente | Requisito concreto | Responsable | Revisor | Método / opción del menú | Datos de prueba | Resultado esperado | Estado |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Por completar | Por completar | Pendiente | Pendiente | Pendiente | Pendiente | Pendiente | Pendiente |

Estados sugeridos: pendiente, en desarrollo, en revisión, verificado. Los ejemplos siguientes son casos propuestos, no resultados de pruebas ya realizadas:

- Colección vacía: listados vacíos; promedio/extremo informa falta de datos; no divide por cero.
- Identificador inexistente: búsqueda, edición o baja informa el caso sin cambiar otro elemento.
- Identificador duplicado: controlar cuando el enunciado exige unicidad; acordar política en los demás casos.
- Capacidad o presupuesto: aceptar exactamente el límite y rechazar superarlo.
- Restricción diaria: comprobar dos fechas distintas; no confundir límite diario con tamaño total de la colección.
- Edición: cambiar fecha, tamaño, precio o caché puede exigir recalcular la restricción y excluir el valor anterior del cálculo.
- Umbrales: probar justo debajo, igual y encima de cada frontera.
- Polimorfismo: incluir ambos subtipos en una misma consulta o acumulación.
- Bajas masivas: probar cero, uno y varios candidatos consecutivos.
- Diccionario: dos elementos de la misma categoría y uno de otra; verificar contadores.
- Menú: opción inválida y salida; entradas inválidas no deben dejar datos a medio cargar.

## 7. Preparación de entrega y coloquio

- [ ] Todos los requisitos del alcance confirmado están verificados por otra persona.
- [ ] Menú e iteradores funcionan y el grupo puede explicar dónde se usan.
- [ ] Diagrama final coincide con clases, herencia y relaciones implementadas.
- [ ] Se prepararon datos para demostrar los dos subtipos y los casos límite.
- [ ] Otra persona importó y ejecutó el proyecto siguiendo las instrucciones.
- [ ] El paquete cumple el formato que indique la cátedra; todavía no está especificado en los archivos recibidos.
- [ ] Todos saben explicar encapsulamiento, herencia, polimorfismo y el uso de colecciones en su código.
- [ ] Se acordó qué expone cada integrante y se ensayaron preguntas cruzadas.
- [ ] Se confirmó asistencia de todos al coloquio.
- [ ] Se guardó constancia de entrega en el canal correspondiente.

## 8. Consultas pendientes para el taller

1. Para aerolínea: ¿qué significa “disponibles” al calcular el promedio y qué vuelos participan del listado superior al promedio?
2. ¿Cómo corresponden al grupo 17 las fechas confirmadas del 21/10 y 23/10? ¿Cuál es el horario y canal?
3. ¿Qué archivos deben entregarse y en qué versión de Dolphin?
4. ¿Cuándo será el coloquio y cómo se coordina?

Las pautas indican consultar en **Taller, luego de práctica**. Para una consulta puntual durante la semana, permiten escribir al **ayudante asignado con copia al profesor**. El tutor confirmado es **Gonzalo Baez**, **gbaez@frlp.utn.edu.ar**; queda pendiente identificar el correo del profesor para la copia. No se enviaron mensajes desde este proyecto.
