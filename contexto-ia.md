# Contexto y punto de continuacion

Actualizado: **26/10/2026**. Estado compartido del equipo; las decisiones del usuario de esta copia no implican acuerdos grupales ni confirmacion docente. El pedido actual prevalece sobre este resumen.

## Repositorio y trabajo

- Material de Paradigmas de Programacion de UTN: teoria, practica y trabajo integrador en POO con Smalltalk/Dolphin. Hay 16 fuentes originales y 14 helpers, enlazados en `README.md`; faltan los enunciados independientes del TP N. 1 y TP3.
- Seguir `AGENTS.md`: nombres nuevos camelCase; clases Smalltalk y archivos `.cls` con inicial mayuscula. Conservar originales recibidos. Codigo en `trabajo-integrador/desarrollo/`; decisiones, guias y diagramas en `documentacion/`.
- El seguimiento personal vive en `.ia-local/contexto-personal.md`, ignorado por Git. No atribuirlo al equipo. La guia de uso de asistentes esta en `docs/uso-de-ia.md`; las entradas para Codex, Claude, Gemini y Copilot comparten instrucciones.
- Preservar cambios locales. Hay cambios de esta integracion sin commit; no realizar commits, pushes ni publicaciones salvo pedido expreso. Las verificaciones usan imagenes temporales y no guardan ni modifican la imagen abierta del usuario.

## Integrador y equipo

- **Grupo 17, enunciado 1 — Aerolinea**, tutor **Gonzalo Baez**, **gbaez@frlp.utn.edu.ar**. Asignacion confirmada por mensaje del tutor compartido por el usuario el 03/10/2026.
- Integrantes: **Gabriel Matias Piccin, César Augusto Romero y Jorge Murga**. Datos de contacto y legajo informado de César (18370), en `hoja-de-ruta-grupal.md`. No se acordaron responsables nominales de las tareas.
- El usuario confirmo que rigen las fechas del PDF de pautas: **21/10/2026 y 23/10/2026**. Siguen pendientes su distribucion para el grupo, horario, formato/canal de entrega y fecha del coloquio; tambien comision, correo del profesor y version de Dolphin compartida.
- Leer los PDFs originales antes de implementar requisitos. Aerolinea ocupa la **pagina 2** de `Trabajo Integrador - Enunciados 2026.pdf`. Las pautas, p. 2, exigen menu, iteradores, diagrama y todos los incisos funcionando; cada integrante participa del coloquio.
- La referencia local compartida por el usuario es `E:\UTN\Paradigmas\TPIntegrador_Ejemplo\`: Biblioteca, Libro, Manual y dos scripts. `actualizado6.st`, desde la linea 82, contiene menu con ChoicePrompter; no viaja con Git. Su aceptacion docente no esta confirmada.

## Implementacion actual

**Recuperacion durante la revision del usuario (17/10):** tras un reinicio informado por el usuario, `AplicacionAerolinea.cls` contenia el menu inicial de 12 metodos, con diferencias de espacios respecto de la copia anterior. Se encontro la ampliacion de 39 metodos guardada en la carpeta temporal de las pruebas, se verifico su hash y se recupero. El archivo encontrado y los demas archivos que se iban a ajustar quedaron respaldados en `.ia-local/recuperacionAplicacion20261017/`. La causa del reemplazo no se determino; no atribuirla al reinicio como hecho comprobado. Luego se aplico la eleccion confirmada de `isKindOf:` y el menu completo volvio a pasar 46 casos/escenarios en Dolphin aislado.

El **17/10/2026** el usuario autorizo completar los pendientes sin mas consultas. Mas tarde, el usuario cambio explicitamente la arquitectura: la clase `AplicacionAerolinea` ya no se usa y la interfaz y la logica deben vivir directamente en el Workspace.

- **Estado actual de la copia:** `Aerolinea.cls` contiene el modelo de datos; los vuelos usan Date/Time y conservan `precioFinal` polimorfico. `desarrollo/legado/AplicacionAerolinea.cls` queda legado, no importar ni usar. La carpeta duplicada `conDateTIME` fue eliminada por pedido del usuario.
- `desarrollo/AplicacionAerolinea.st` es ahora un script de Workspace, sin declarar clase de menu o aplicacion. Contiene bloques para la interfaz, validaciones, altas, edicion, consultas y bajas. El 17/10 se corrigieron delimitadores desbalanceados detectados por Dolphin y se completo el recorrido real del Workspace en una copia temporal de Dolphin 7.0.5.
- `VueloNacional` y `VueloInternacional` tienen constructores completos de nueve y diez argumentos. `precioFinal` es polimorfico: base mas 10% con equipaje o base mas tasa. `Vuelo>>precioFinal` usa `subclassResponsibility`; crear la clase base sigue permitido.
- El usuario cuestiono el auxiliar `verTipo` y eligio expresamente **`isKindOf:`** para identificar los subtipos, siguiendo Mensajes y control, p. 21, y Biblioteca (`actualizado6.st`, lineas 193, 210 y 377). Se retiro `verTipo` de las tres clases, categorias, listados y diagrama. La tabla del PDF escribe `isKindOff:` con una errata; el ejemplo usa una sola `f` final.
- Revision puntual posterior del 17/10: se encontro `verTipo` todavia en `Vuelo.cls` y se retiraron su definicion y categoria, preservando los demas cambios locales. Se revisaron las referencias del codigo sin abrir Dolphin. No se repitieron las pruebas por este ajuste; el usuario pidio acumular cambios pequenos antes de una ronda conjunta.
- La logica trasladada al Workspace mantuvo en la ejecucion numero unico, cupo diario, edicion de fecha, filtros, promedio, facturacion potencial, baja masiva y conteo por estado.

## Decisiones confirmadas por el usuario

- La misma coleccion guarda **varias fechas y todos los estados**. Cancelados permanecen hasta baja explicita. Cada operacion filtra o recorre lo que requiere. El cupo cuenta todos los vuelos almacenados del dia, sin excepcion por estado.

## Respuesta de la catedra recibida el 22/10/2026

- Para el ejercicio alcanza con manejar **una sola aerolinea**.
- Para las fechas se pueden usar `Date` y `Time` por separado; recomiendan esa alternativa antes que `DateTime`. La implementacion actual usa texto y debe evaluarse su migracion.
- El maximo diario debe validarse nuevamente al modificar la fecha de un vuelo.
- Es correcta la interpretacion de vuelos disponibles como Programados y Demorados.
- Para el promedio y el listado de precios superiores deben utilizarse **todos los vuelos**, incluyendo todos los estados y subclases. Esto contradice el filtro provisional actual de Programados + Demorados y requiere corregir codigo y pruebas.
- Al modificar pueden cambiarse todos los atributos excepto los identificadores: numero y tipo Nacional/Internacional. El tipo se considera identificador y debe permanecer fijo.
- La precarga de vuelos es obligatoria para la muestra; el grupo propuso precargar diez vuelos en dias distintos.
- La baja individual usa `eliminar:`. Cancelar un vuelo solo cambia su estado; la baja conjunta de cancelados debe usar el metodo de clase compuesta solicitado por el enunciado.
- El usuario decidio el 22/10/2026 volver a interpretar la tasa internacional como importe fijo: `precioBase + tasaInter`. Se actualizo `VueloInternacional.cls` y las expectativas de las pruebas.
- El usuario decidio aplicar la respuesta docente al promedio y al listado superior: ambos recorren todos los vuelos, sin filtrar estados; `vuelosDisponibles` queda como consulta independiente para Programados y Demorados.
- Maximo **diario**, no total. Al editar fecha se excluye el propio vuelo del conteo; cambiar solo la hora conserva su plaza. La fecha anterior se conserva si el destino esta completo.
- Edicion de todos los datos comunes y particulares, excepto el **numero unico**. Se conserva el tipo Nacional/Internacional; `precioFinal` sigue calculado.
- Precio base y tasa admiten entrada no negativa con **hasta dos decimales**, usando punto. Ya implementado con validacion de caracteres y `asNumber`; se aceptan enteros, una o dos cifras decimales y cero.
- Fecha en texto `dd/mm/aaaa hh:mm`, convencion existente del proyecto. Ya se validan formato, dias por mes, bisiestos, anio 0001-9999 y horario. Sin restriccion por fecha pasada/futura. Dominio y constructores presuponen datos con el formato correcto; calendario se controla en el menu.
- Recursos limitados al material de catedra. Se retiraron de la aplicacion `trimBlanks`, `allSatisfy:`, `String streamContents:`, `printString` y el `isDigit` del aporte. Se usan iteradores, `includes:`, subcadenas, concatenacion, `displayString`, comparaciones y repeticion. En Aerolinea ya se habian adaptado `asFloat`, `removeAll:` e `includesKey:`.
- Respaldo de decimales: Mensajes y control, p. 22, expresa entero o real para `asNumber`; Practica 5, diap. 5 y 8, lo usa al cargar y modificar precios. El limite de dos cifras lo eligio el usuario. Referencias completas en `menuDolphinHelper.md`.

## Criterios provisionales y verificacion

- **Programado + Demorado** son disponibles para promedio y superiores, por eleccion provisional del usuario del 16/10. Falta confirmacion docente del significado de disponibles y poblacion del listado superior; no bloquea la version autorizada.
- El uso de `ChoicePrompter` en el Workspace requiere confirmacion docente. Las fuentes originales respaldan el resto de los recursos nuevos; ver la tabla de la guia.
- La arquitectura anterior paso **46 casos/escenarios** en **Dolphin Professional 7.0 aislado**, salida 0: `AerolineaPrueba ejecutar` = 14; `AplicacionAerolineaPrueba ejecutar` = 10; `PrecioFinalPrueba ejecutar` = 9; `AplicacionAerolineaIntegracionPrueba ejecutar` = 13. Esos resultados no deben atribuirse al Workspace actual.
- Integracion cubre ambos subtipos, cancelaciones por campo y selector, formatos de importe, calendario y siglos bisiestos, duplicados, cupo cero/diario, todos los campos editables, numero fijo, referencias, reapertura, bajas y las nueve consultas con datos y en vacio.
- La actualizacion desde clases anteriores conservo todas las referencias. Tras elegir `isKindOf:`, otra prueba partio de la version con `verTipo`, reimporto las clases nuevas y retiro esos tres metodos en la imagen aislada: busqueda y edicion siguieron funcionando sobre los objetos existentes. Se repitieron los 46 casos/escenarios, salida 0.
- El 17/10 se completo un recorrido automatizado de 184 acciones/comprobaciones sobre los dialogos reales de la arquitectura anterior. Los resultados, capturas y registro en `validacionMenuDolphin.md` son historicos y no verifican `AplicacionAerolinea.st`.
- En la arquitectura anterior, despues de recuperar la aplicacion y elegir `isKindOf:`, se repitieron los 46 casos/escenarios y el recorrido real completo, salida 0. Esas pruebas no cubren la nueva version de Workspace.
- El 17/10 se probo el Workspace actual con dialogos reales en una copia temporal de Dolphin Smalltalk Professional 7.0.5. Se importaron solo las cuatro clases indicadas, se ejercitaron cancelaciones, invalidos, ambos subtipos, duplicado, cupo por dia y todos los estados, busqueda, edicion, booleanos `false`, las nueve consultas con datos y en vacio y ambas bajas. Tras corregir cierres de bloques, el recorrido termino sin errores. La imagen confirmo `AplicacionAerolinea=false MenuAerolinea=false`. Detalle en `validacionMenuDolphin.md`.
- Revision estatica posterior del alcance de catedra y cobertura: las ocho opciones principales y las nueve consultas del enunciado estan conectadas; todos los bloques auxiliares declarados se usan. Restos prescindibles detectados, aun sin modificar: temporal local `resultado` de la opcion Consultas y aviso final de opcion invalida, inalcanzable mediante `ChoicePrompter`. Los setters de `Aerolinea`, `Vuelo>>modNumero:` y el constructor base no son usados por el menu, pero pertenecen al modelo previo y no son restos de interfaz. Recursos sin respaldo directo localizado en los PDFs: `ChoicePrompter` (si aparece en el ejemplo local de Biblioteca), `String with:with:`/`Character cr`/`Character lf` para saltos y `subclassResponsibility`; requieren criterio docente si el alcance debe limitarse literalmente a los mensajes vistos.
- Los TXT externos `AplicacionAerolinea_completa.txt` y `Aerolinea_corregida.txt`, en Downloads, no se modificaron ni importaron completos. Las revisiones documentan los originales; la version del repo integra adaptaciones corregidas. El TXT de Aerolinea mezcla clase, ejemplos y prosa.

## Punto de continuacion

**26/10/2026: migracion Date/Time integrada y verificada.** La version vigente esta directamente en `trabajo-integrador/desarrollo/`: cuatro clases (`Vuelo`, `VueloNacional`, `VueloInternacional`, `Aerolinea`) y `AplicacionAerolinea.st`. Las clases conservan datos, constructores y accesores/modificadores; `Vuelo>>precioFinal` es abstracto y las subclases lo redefinen por polimorfismo. La lógica de gestión de la aerolínea se ejecuta en bloques del Workspace. Fecha y hora se guardan como `Date` y `Time` separados; duracion en minutos.

- Se compararon y conservaron los validadores de texto obligatorio, enteros, precios, estados, booleanos y calendario del Workspace principal previo. Ambos scripts recibidos permitian mas de dos decimales; se preservo ese comportamiento, que sustituye el limite mencionado historicamente.
- La precarga conserva fechas repetidas de la muestra; el comentario fue corregido. Si el cupo impide cargar diez vuelos ahora informa la cantidad aceptada.
- Prueba actual en `desarrollo/pruebas/`: `WorkspaceDateTimePrueba.cls`. La prueba de dominio y las cuatro baterias antiguas se movieron a `desarrollo/legado/pruebas/`. `AplicacionAerolinea.cls` permanece en `desarrollo/legado/`.
- El asistente ejecuto Dolphin7.exe con `-q -u -f` en una copia temporal de DPRO.img7. Pasaron 24 entradas de validacion y 35 recorridos del Workspace real con dialogos sustituidos por colas. Se repitio sobre los archivos principales despues de retirar la lógica de `Aerolinea`, conservando `precioFinal` como polimorfismo de `Vuelo`: todo OK. La instancia temporal se cerro sin guardar. El usuario habia confirmado antes el arranque visual de la variante; no atribuir inspeccion visual al recorrido automatizado.
- Evidencia y alcance: `documentacion/pruebasDateTime.md`. Script y salida locales: `.ia-local/ejecutarDateTime.st` y `.ia-local/resultadoDateTime.txt`.
- El usuario informo que todo parecia funcionar en su prueba manual y autorizo commit y push de todos los cambios. Se elimino `conDateTIME/`; `PruebasWS.st`, tambien solicitado para borrar, no existe en esta copia ni entre los archivos rastreados.

Para ejecutar: importar Vuelo, VueloNacional, VueloInternacional y Aerolinea desde desarrollo, luego abrir su AplicacionAerolinea.st en un Workspace y evaluar todo. Usar una imagen limpia o copia de respaldo: reimportar no convierte automaticamente vuelos antiguos con fecha textual ni elimina metodos viejos. No importar carpetas legado.

Revision de validacion de fechas (26/10): el fuente oficial de Dolphin (Core.Date.cls y Core.Time.cls en dolphinsmalltalk/Dolphin) muestra que newDay:monthIndex:year: calcula desplazamientos y fromMilliseconds: normaliza el horario. No reemplazar controles de rangos por esos constructores. Los lectores validan, pero Date>>readYearFrom: interpreta anios menores de 100 mediante pivote; cambiar a fromString: alteraria el contrato 0001-9999. Propuesta pendiente: conservar formato/rangos y sustituir el calculo manual de bisiestos por Date daysInYear: anio = 366 (mensaje publico). La inspeccion fue de fuentes; el intento de prueba en imagen temporal no produjo resultados y sus procesos propios se cerraron. No se modifico la aplicacion en esta revision.

Cambio autorizado posterior (26/10): aplicado en el Workspace principal el reemplazo del calculo manual de esBisiesto por (Date daysInYear: unAnio) = 366, con comentario explicativo. Se conservan formato, rangos y controles de cancelacion. Reejecucion completa en Dolphin aislado a las 15:40: 24 comprobaciones de validadores y 35 recorridos OK. Salida nueva comprobada por fecha de escritura; proceso cerrado y sin archivo de errores. El script se copio al directorio temporal para evitar el bloqueo de lectura observado en el intento previo.

Proximo paso: revision del equipo sobre la version integrada y preparacion del paquete de entrega. Opcionalmente realizar un recorrido visual del menu principal ya integrado para revisar presentacion de fechas y horas. La comprobacion automatizada no verifica apariencia de ventanas.
