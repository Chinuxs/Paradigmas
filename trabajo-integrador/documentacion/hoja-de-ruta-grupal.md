# Hoja de ruta grupal — Trabajo Integrador 2026

Preparada el **02/10/2026**. Estado: organización inicial; integrantes, alcance asignado y fecha aplicable pendientes de confirmar. Las tareas y fechas internas de este documento son propuestas de organización.

## 1. Fuentes y requisitos de la cátedra

- [Pautas 2026, p. 2](../enunciado/Trabajo%20Integrador%20-%20Pautas%202026.pdf).
- [Enunciados 2026, pp. 2–9](../enunciado/Trabajo%20Integrador%20-%20Enunciados%202026.pdf).
- [Clase 0 de práctica, diapositiva 8](../../practica/enunciados/Clase%200%20-%20Practica.pptx), para la referencia a Dolphin y la fecha alternativa.

| Exigencia encontrada | Evidencia que debe preparar el grupo |
| --- | --- |
| Grupo de **3 a 4 integrantes** | Nómina acordada |
| Diagrama de clases acompañando la entrega | Diagrama actualizado con el código final |
| Uso de un menú | Acceso y recorrido de todas las funciones solicitadas |
| Uso de iteradores de colección | Métodos que los apliquen y explicación durante la defensa |
| Todos los incisos deben funcionar; uno que falle implica desaprobar | Matriz completa de requisitos y pruebas |
| Defensa en coloquio | Todos presentes y todos exponen |
| El trabajo es condición para aprobar la cursada | Reservar tiempo de corrección y preparación oral |

La presentación inicial indica **Dolphin (Smalltalk)**. Confirmar con la cátedra la imagen/versión y la forma de exportar la entrega.

### Alcance que hay que aclarar antes de repartir código

El PDF de enunciados reúne **ocho sistemas llamados “Inciso 1” a “Inciso 8”**. Los archivos no explican si al grupo se le asigna uno, se elige o deben implementarse todos. La exigencia de que funcionen todos los incisos tampoco resuelve esa asignación. Registrar la respuesta docente y cubrir **todo el alcance confirmado**; no dar por hecha la elección de un solo sistema.

Ver [mapa de los ocho enunciados](mapa-de-enunciados.md) para preparar esa conversación y estimar el trabajo.

## 2. Fechas encontradas

| Fuente | Texto / fecha | Estado |
| --- | --- | --- |
| Pautas 2026, p. 2 | **21/10/2026 - 23/10/2026** | Referencia específica 2026; no aclara si son dos comisiones o un intervalo |
| Clase 0, diapositiva 8 | **Semana 12/10** | Referencia diferente; no especifica año en esa diapositiva |
| Pautas 2026, p. 2 | Coloquio cuando el trabajo esté en condiciones | Sin día ni horario publicados en este material |

**Acción inmediata:** consultar cuál fecha aplica al grupo, horario límite, canal/formato de entrega y fecha del coloquio. No se encontró una hora límite. Tampoco hay hitos parciales fechados en los PDFs.

Por prudencia, el plan propone una primera versión completa para el **11/10**, antes de la semana mencionada en la presentación. El tramo posterior solo se usa si la cátedra confirma que corresponde entregar el 21 o 23 de octubre. La factibilidad de esa primera versión depende de resolver enseguida el alcance de los ocho incisos.

## 3. Acuerdos del equipo

Completar en la primera reunión:

| Dato | Valor |
| --- | --- |
| Integrantes (3 o 4) | Pendiente |
| Comisión | Pendiente |
| Ayudante asignado | Pendiente |
| Inciso(s) / sistemas que corresponden | Pendiente de confirmación docente |
| Fecha, hora y canal confirmados | Pendiente |
| Entorno de Dolphin compartido | Pendiente |
| Horario de reuniones y canal del grupo | Pendiente |

### Reparto sugerido

Cada tarea tiene una persona responsable y otra revisora. Los roles rotan; todos deben conocer el sistema completo para el coloquio.

| Frente | Con 3 personas | Con 4 personas | Resultado |
| --- | --- | --- | --- |
| Modelo, herencia y cálculos por tipo | A; revisa B | A; revisa B | Clases y comportamiento polimórfico |
| Colecciones, búsquedas y restricciones | B; revisa C | B; revisa C | Altas, cambios, bajas, consultas y estadísticas |
| Menú e integración | C; revisa A | C; revisa D | Flujo completo ejecutable |
| Casos de prueba y documentación | Se distribuyen por función; C coordina | D coordina; cada autor aporta pruebas | Matriz, diagrama y guía de ejecución |
| Defensa | Todos | Todos | Cada integrante explica una parte y puede responder sobre las demás |

Si corresponden varios sistemas, repetir este reparto por sistema y definir un orden de integración. Evitar que una persona quede únicamente con documentación y desconozca el código.

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
| **02–03/10** | Confirmar alcance/fechas; formar grupo; leer consignas; acordar entorno | Respuesta docente para fijar alcance | Nómina, alcance y dudas registradas; todos abren Dolphin |
| **03–04/10** | Descomponer requisitos y diseñar clases | Alcance confirmado | Diagrama inicial y fila por requisito en la matriz |
| **04–06/10** | Implementar clases, inicialización y comportamiento por subtipo | Modelo y selectores acordados | Instancias de ambos subtipos con cálculos/decisiones comprobados |
| **06–08/10** | Implementar altas, búsqueda, modificación, baja y restricciones | Clases operativas | Casos válidos e inválidos cubiertos; invariantes preservadas |
| **08–10/10** | Completar listados, promedios, extremos, bajas masivas y diccionarios; integrar menú | Colecciones disponibles | Cada requisito accesible y verificable desde el flujo previsto |
| **11/10** | Preparar primera versión completa, diagrama y ensayo grupal | Todas las funciones integradas | Importación en otro equipo y recorrido total de la matriz |
| **12–18/10**, si se confirma entrega posterior | Corregir, cubrir bordes y practicar defensa | Fecha docente confirmada | Todos ejecutan y explican; fallas detectadas corregidas |
| **19–20/10**, si aplica | Cerrar paquete, verificar instrucciones y copia final | Revisión completa | Entregable reproducible, sin funciones pendientes |
| **21/10 o 23/10**, según confirmación | Entregar y guardar constancia | Canal y fecha definidos | Constancia de recepción; coloquio coordinado |

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

1. ¿Qué inciso(s) corresponde(n) al grupo y cómo se asignan?
2. ¿Aplica el 21/10, el 23/10 o la semana del 12/10? ¿Cuál es el horario y canal?
3. ¿Qué archivos deben entregarse y en qué versión de Dolphin?
4. ¿Cuándo será el coloquio y cómo se coordina?
5. Según el sistema asignado: ¿qué significan “disponibles”, “activos” o “programados” donde no se definen? ¿Sobre qué conjunto se filtra después de calcular un promedio?

Las pautas indican consultar en **Taller, luego de práctica**. Para una consulta puntual durante la semana, permiten escribir al **ayudante asignado con copia al profesor**. El grupo debe confirmar quién es su ayudante; no se enviaron mensajes desde este proyecto.
