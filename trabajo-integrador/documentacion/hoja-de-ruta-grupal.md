# Hoja de ruta grupal — Trabajo Integrador 2026

Preparada el **02/10/2026**. Actualizada el **17/10/2026**. Estado: organización y avances locales; grupo 17, sus tres integrantes, enunciado 1, tutor y fechas de las pautas confirmados. Las tareas y fechas internas de este documento son propuestas de organización.

**Cambio de arquitectura del 17/10/2026:** por indicación del usuario, no usar `AplicacionAerolinea.cls`. `Aerolinea` conserva los datos; la interfaz y la lógica de negocio se ejecutan directamente desde `desarrollo/AplicacionAerolinea.st` en un Workspace, sin clase de menú. Las verificaciones anteriores de la clase de aplicación son históricas; esta nueva versión todavía debe probarse en Dolphin y revisarse por el equipo.

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

**Avance local del 11/10/2026:** por solicitud del usuario se preparó un menú inicial en `AplicacionAerolinea.cls`, con arranque `iniciarAplicacionAerolinea.st`. Cubre cargar aerolínea, consultar sus datos y salir. Se verificaron importación y diez casos automatizados en una copia aislada de Dolphin Professional 7.0; falta recorrido manual de diálogos y revisión de otro integrante. Ver [guía de ejecución y alcance](menuDolphinHelper.md). Las funciones de vuelos siguen pendientes de integración; la clase de aplicación y formato de entrega aún requieren acuerdo y confirmación docente.

El usuario decidió mantener provisionalmente la clase de aplicación y sus métodos, pero pidió reemplazar el inicializador automático por uno explícito y ajustarlo a la cursada. Se siguió el esquema de Libro (PDF, pp. 9-10): método de clase `crear` con `^(super new) init` e inicializador de instancia `init`; el arranque ahora es `AplicacionAerolinea crear iniciar.`. Se repitieron los diez casos en Dolphin con salida 0; se documentó retirar el `initialize` de la versión anterior al actualizar una imagen. La revisión de otras utilidades frente al material de la cátedra sigue pendiente; no implica un acuerdo grupal ni aprobación docente.

**Estado actual, 17/10/2026:** por autorización del usuario se integró el menú completo: altas, búsqueda, edición común y por subtipo con número fijo, bajas y todas las consultas. Entradas monetarias con hasta dos decimales y calendario real; se retiraron las utilidades sin respaldo localizado. Pasaron 46 casos/escenarios en Dolphin Professional 7.0 aislado y una prueba de actualización sobre clases anteriores conservó todas las referencias. Se completó también un recorrido automatizado con diálogos reales, salida 0, con [capturas y resultados revisados](validacionMenuDolphin.md). Hay [guía de importación y pruebas](menuDolphinHelper.md) y [diagrama de clases](diagramaClases.md). Revisión de otro integrante y confirmaciones docentes provisionales pendientes. Los avances fechados de abajo conservan la historia previa; la matriz refleja esta versión.

| ID / página fuente | Requisito concreto | Responsable | Revisor | Método / opción del menú | Datos de prueba | Resultado esperado | Estado |
| --- | --- | --- | --- | --- | --- | --- | --- |
| AER-01 / p. 2 | Buscar por número | Pendiente | Pendiente | `buscarPorNumero:` / `buscarVuelo` | Existente e inexistente | Mismo objeto o `nil` | Verificado local en dominio y menú |
| AER-02 / p. 2 | Modificar el vuelo encontrado | Pendiente | Pendiente | `modificarVuelo`, setters y `modificarFechaDeVuelo:a:` | Datos comunes y particulares; cambio de fecha y solo de hora | Mismo objeto y número; preservar cupo al editar fecha | Edición común/particular y cupo verificados localmente en el menú |
| AER-03 / p. 2 | Eliminar el vuelo encontrado | Pendiente | Pendiente | `eliminar:` / `eliminarVuelo` | Dos vuelos; eliminar uno | El otro permanece | Verificado local en dominio y menú |
| AER-04 / p. 2 | Listar programados | Pendiente | Pendiente | `listarProgramados` / Consultas > Programados | Ambos tipos y estados mezclados | Solo Programado | Verificado local en dominio y menú |
| AER-05 / p. 2 | Listar duración menor a dos horas | Pendiente | Pendiente | `listarDuracionMenorA2Horas` / Consultas > Duración menor a dos horas | 119, 120 y 121 minutos | 119 entra; 120 y 121 quedan fuera | Verificado local; minutos es convención recibida |
| AER-06 / p. 2 | Filtrar por ciudad de destino | Pendiente | Pendiente | `filtrarSegunDestino:` / Consultas > Destino | Ciudad con y sin coincidencias | Colección correspondiente o vacía | Verificado local en dominio y menú |
| AER-07 / p. 2 | Precio final promedio de disponibles | Pendiente | Pendiente | `calcularPrecioPromedio` / Consultas > Precio final promedio | Programado y Demorado; excluir Cancelado y Finalizado | Promedio de 110, 130 y 150 = 130 | Dominio y menú verificados con criterio provisional; confirmación docente pendiente |
| AER-08 / p. 2 | Vuelos con precio superior al promedio | Pendiente | Pendiente | `mostrarVuelosConPrecioSuperiorAlPromedio` / Consultas > Precios superiores al promedio | Precio inferior, igual y superior; otros estados con precios mayores | Solo disponibles con precio > promedio; confirmar población | Dominio y menú verificados con criterio provisional; confirmación docente pendiente |
| AER-09 / p. 2 | Conocer vuelo de mayor duración | Pendiente | Pendiente | `conocerVueloMayorDuracion` / Consultas > Mayor duración | Vacío, único, empate y cambio de duración | `nil` o mismo objeto máximo | Verificado local en dominio y menú |
| AER-10 / p. 2 | Facturación potencial de programados | Pendiente | Pendiente | `calcularFacturacionTotal` / Consultas > Facturación potencial | Nacional con equipaje, internacional y otros estados | 110 + 150 = 260; excluir otros estados | Verificado local en dominio y menú |
| AER-11 / p. 2 | Eliminar cancelados en conjunto | Pendiente | Pendiente | `eliminarTodosLosCancelados` / `eliminarCancelados` | Vacío, cancelados consecutivos y todos cancelados | Retirarlos conservando colección y demás vuelos | Verificado local en dominio y menú |
| AER-12 / p. 2 | Cantidad por estado y resultado en pantalla | Pendiente | Pendiente | `guardarEnDiccionarioVuelosPorEstado` / `mostrarCantidadPorEstado` | 2 Programados, 1 Demorado, 2 Cancelados, 1 Finalizado | Diccionario con contadores 2, 1, 2 y 1 | Conteo y presentación verificados localmente |
| AER-13 / p. 2 | Número de vuelo único | Pendiente | Pendiente | `cargar:` / `cargarVuelo`; número fijo en `modificarVuelo` | Número repetido en otra fecha y mismo objeto repetido | Rechazar sin alterar vuelos ni colección | Verificado local en carga y edición del menú |
| AER-14 / p. 2 | Respetar máximo diario | Pendiente | Pendiente | `cargar:` y `modificarFechaDeVuelo:a:` / carga y edición del menú | Máximo exacto, exceso, otros días/meses/años, cupo cero y cambio de hora con día completo | Cupo diario; excluir el propio vuelo al editar; rechazo conserva fecha original | Verificado local en dominio y menú |
| DEC-01 / usuario, 17/10/2026 | Entrada de precios con hasta dos decimales | Pendiente | Pendiente | `pedirPrecio:` / precio base y tasa; `asNumber` | 120; 120.5; 120.50; 120.555 | Admitir de cero a dos cifras decimales; rechazar más de dos | Implementado y verificado localmente; decisión del usuario |
| DEC-02 / usuario, 17/10/2026 | Editar datos comunes y particulares conservando número único | Pendiente | Pendiente | `modificarVuelo`, `camposPara:`, `aplicarDato:campo:vuelo:` | Origen, destino, fecha/hora, duración, precio, estado y datos del subtipo | Conservar número y referencias; recalcular precio final; validar cupo al cambiar fecha | Implementado y verificado localmente; revisión grupal pendiente |

**Avance local del 16/10/2026:** se integraron los once métodos aportados por un compañero a través del usuario, conservando selectores y métodos existentes. Se ajustaron facturación a Programados y diccionario a cantidades según el PDF. El usuario eligió provisionalmente **Programado y Demorado** como disponibles: el filtro, promedio y superiores ya usan ese criterio; quedan pendientes confirmación docente y acuerdo grupal. Ocho escenarios de `AerolineaPrueba`, diez casos existentes del menú y nueve de precios pasaron en Dolphin Professional 7.0 aislado, salida 0; la reimportación conservó datos y referencias. Las pruebas actualizadas incluyen los cuatro estados, cambios de estado, precios ajenos al promedio y ausencia de disponibles. Ver [alcance, resultados y actualización](consultasAerolineaHelper.md). “Verificado local” no implica revisión por otro integrante ni integración al menú.

Por pedido del usuario se revisaron los recursos usados en esos once métodos contra las fuentes de teoría y práctica: se reemplazaron `asFloat`, `removeAll:` e `includesKey:` por división directa, selección y recorrido con eliminación, y la receta de conteo de Farmacia. `first` se conservó con respaldo en Colecciones, p. 7. Las fuentes exactas están en la guía de consultas. Se repitieron las pruebas anteriores, incluyendo un promedio no entero, con salida 0; la revisión pendiente del menú conserva su alcance anterior.

**Avance local del 17/10/2026:** el usuario eligió conservar vuelos de varias fechas en la colección. Se incorporó `cargar:` en la clase actual: comprueba número único global y cuenta por fecha completa de salida sin la hora, usando el texto `dd/mm/aaaa hh:mm` del proyecto. Reutiliza `agregar:` después de validar y devuelve un booleano. Se conserva el conteo de vuelos almacenados sin agregar un filtro de estados. Diez escenarios de Aerolinea, diez casos del menú actual y nueve de precios pasaron en Dolphin Professional 7.0 aislado, salida 0; referencias conservadas al reimportar. La decisión corresponde al usuario y requiere acuerdo grupal. Las altas del futuro menú deben llamar a `cargar:`; `agregar:` conserva su protocolo básico sin validar y las modificaciones de número/fecha siguen pendientes.

**Edición de fecha, 17/10/2026:** el usuario confirmó validar también el cupo diario al modificar. Se agregó `modificarFechaDeVuelo:a:`: cuenta los otros vuelos del día solicitado antes de mutar, devuelve booleano y conserva la fecha si rechaza. Cambiar solo la hora no cuenta dos veces al propio vuelo. Pasaron 14 escenarios de Aerolinea, 10 del menú actual y 9 de precios en Dolphin Professional 7.0 aislado, salida 0, con referencias conservadas al reimportar. El menú aún no ofrece edición; debe delegar los cambios de fecha a ese mensaje y mantener fijo el número.

**Revisión y recuperación, 17/10/2026:** el usuario eligió `isKindOf:` (Mensajes, p. 21; ejemplo de Biblioteca) y se retiró `verTipo`. Se recuperó la aplicación completa desde la copia guardada de pruebas, conservando respaldo del archivo encontrado con el menú inicial. Pasaron nuevamente 46 casos/escenarios, actualización con referencias conservadas y recorrido completo con diálogos reales. Capturas y registro actualizados en [la validación](validacionMenuDolphin.md).

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
