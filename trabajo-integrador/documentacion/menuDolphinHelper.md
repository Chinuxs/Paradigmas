# Menu de aerolinea en Dolphin

Actualizado el **17/10/2026**. La aplicacion integra carga, busqueda, edicion, bajas y todas las consultas del [enunciado 1, p. 2](../enunciado/Trabajo%20Integrador%20-%20Enunciados%202026.pdf). El menu y las reglas de negocio se ejecutan en el Workspace; `Aerolinea` solo conserva los datos. `ChoicePrompter` requiere confirmacion docente.

## Importar y arrancar

Conservar primero cualquier cambio propio sin exportar. Importar con **File In** en este orden:

1. [Vuelo.cls](../desarrollo/Vuelo.cls).
2. [VueloNacional.cls](../desarrollo/VueloNacional.cls) y [VueloInternacional.cls](../desarrollo/VueloInternacional.cls).
3. [Aerolinea.cls](../desarrollo/Aerolinea.cls).

No importar `AplicacionAerolinea.cls`: es un archivo legado y la clase ya no participa de la aplicacion. El menu identifica los subtipos mediante `isKindOf:`, siguiendo Mensajes y control, p. 21, y el ejemplo local de Biblioteca. Por eleccion del usuario se retiro `verTipo` de las tres clases y sus listados. Si ese metodo ya estaba cargado en la imagen, eliminarlo desde el Browser en el lado de instancia de `Vuelo`, `VueloNacional` y `VueloInternacional`: reimportar no elimina metodos que desaparecieron del archivo. Los archivos `*Metodos.txt` son listados de consulta: importar los `.cls`.

Abrir [AplicacionAerolinea.st](../desarrollo/AplicacionAerolinea.st) en un Workspace, seleccionar todo su contenido y evaluarlo con **Evaluate it / Ctrl + E**. El archivo no declara clases: crea los bloques de trabajo, muestra el menu y lo ejecuta. No hace falta importar ni evaluar un script de arranque separado. Si se reevalua el Workspace, comienza una sesion nueva de la aplicacion; los datos no se persisten en disco.

En una imagen antigua, conviene hacer el File In de las clases de dominio en una imagen limpia o una copia de respaldo. La aplicacion activa no envía mensajes a `AplicacionAerolinea`.

## Opciones

| Opcion principal | Comportamiento |
| --- | --- |
| 1. Cargar aerolinea | Pide los cinco datos; publica el objeto al completar la entrada y conserva uno ya cargado |
| 2. Ver datos de la aerolinea | Muestra datos y cantidad total de vuelos |
| 3. Cargar vuelo | Elige Nacional o Internacional, solicita datos comunes y particulares y valida número único y cupo diario desde el Workspace |
| 4. Buscar vuelo | Busca por numero y muestra todos sus datos, incluidos subtipo y precio final |
| 5. Modificar vuelo | Busca por numero y ofrece los campos comunes y los correspondientes a su subtipo |
| 6. Eliminar vuelo | Busca por numero y retira ese objeto |
| 7. Consultas | Abre las nueve consultas de la tabla siguiente |
| 8. Eliminar todos los cancelados | Ejecuta la baja conjunta e informa cuantos retiro |
| 0. Salir | Termina el ciclo; cancelar el selector principal tambien sale |

| Consulta | Operacion ejecutada desde el Workspace |
| --- | --- |
| Todos los vuelos | `verTodos` |
| Programados | Filtro de la colección por estado |
| Duracion menor a dos horas | Filtro por duración menor a 120 minutos |
| Destino | Pide ciudad y filtra la colección |
| Precio final promedio | Promedio de vuelos Programados y Demorados |
| Precios superiores al promedio | Filtra los disponibles y compara `precioFinal` |
| Mayor duracion | Recorre los vuelos y conserva el de mayor duración |
| Facturacion potencial | Suma `precioFinal` de los Programados |
| Cantidad por estado | Cuenta vuelos en un diccionario y presenta sus contadores |

Los resultados se muestran con `MessageBox notify:`. Los listados vacios y la ausencia de vuelo de mayor duracion se informan; promedio y facturacion vacios valen cero. El diccionario muestra solo estados presentes.

## Entradas y edicion

- Texto: se recortan espacios externos y se vuelve a pedir si queda vacio. Se usan recorrido, comparaciones y `copyFrom:to:` en lugar de `trimBlanks`.
- Enteros: numero de vuelo y duracion desde 1; anio de fundacion desde 1; maximo diario desde 0. Se recorren los caracteres con `do:` e `includes:`, en lugar de `allSatisfy:` o `isDigit`.
- Importes: precio base y tasa internacional desde cero, con punto y hasta dos cifras decimales. Se aceptan `120`, `120.5`, `120.50` y `0`; se rechazan negativos, comas, letras, mas de dos decimales y puntos sin cifras a ambos lados. La conversion es `asNumber`. El limite de dos decimales se aplica a la entrada; `precioFinal` conserva la formula del subtipo.
- Fecha: texto `dd/mm/aaaa hh:mm`, con dia real del mes, anio 0001-9999, hora 00-23 y minuto 00-59. Se comprueban bisiestos: divisible por 400, o por 4 salvo los divisibles por 100. Se implementa con restas y repeticion, sin agregar utilidades numericas ajenas al material. Se aceptan fechas pasadas y futuras; el proyecto no impone una restriccion temporal adicional.
- Estado: Programado, Demorado, Cancelado o Finalizado. Los booleanos se eligen con Si/No; `false` es un dato valido y `nil` representa cancelacion.

La edicion conserva el **numero unico** y el objeto vuelo. Ofrece origen, destino, fecha/hora, duracion, precio base y estado; en nacionales, provincia y equipaje; en internacionales, pais, tasa y documentacion. `precioFinal` se calcula a partir de esos datos y el tipo de objeto se conserva.

Cancelar cualquier campo o selector vuelve sin publicar una carga parcial ni cambiar el atributo elegido. Un numero inexistente informa el caso. El menu no ofrece modificar el numero.

## Cupo y coleccion

La coleccion conserva **varias fechas y todos los estados**, segun las decisiones del usuario. Cancelar un vuelo mediante su estado mantiene el objeto hasta una baja explicita. Los filtros de cada consulta se aplican sobre esa coleccion.

Las altas validan desde el Workspace el numero unico entre todas las fechas y el cupo de la fecha de salida completa, ignorando la hora. El bloque de edicion de fecha cuenta los otros vuelos del dia solicitado antes de mutar. Un rechazo conserva la fecha original; cambiar solo la hora mantiene la plaza. Se cuentan todos los estados. El total almacenado puede superar el maximo diario.

Los vuelos conservan sus operaciones previas y `Aerolinea` queda como contenedor de datos. El flujo del menu mantiene fijo el numero y ejecuta las reglas de alta y cambio de fecha en sus bloques. El dominio presupone fechas con el formato del proyecto; la validacion de calendario se realiza en la entrada del menu.

## Recursos de la catedra

| Recurso utilizado | Fuente original |
| --- | --- |
| Constructor de clase e inicializacion explicita | [Clase Libro, pp. 9-10](../../teoria/material/3-%20POO-ClaseLibro.pdf) |
| Iteradores `do:`, `select:`, `detect:ifNone:`; `size`, `includes:`, `isEmpty` | [Colecciones, pp. 12-14](../../teoria/material/5-POO-Colecciones.pdf) |
| `at:`, `copyFrom:to:`, caracteres y arreglos literales | Colecciones, p. 7; [Practica 2, diap. 18](../../practica/enunciados/Clase%202%20-%20Practica.pptx) |
| Comparaciones, `between:and:`, `ifTrue:`, `ifFalse:`, `whileTrue:`, `to:do:` | [Mensajes y control, pp. 6-7 y 13-15](../../teoria/material/2-POO-Mensajes-EstControl.pdf) |
| `Prompter prompt:`, `MessageBox notify:`, concatenacion y `displayString` | Mensajes y control, p. 22 |
| `asNumber` para enteros y reales; entrada y modificacion de precios | Mensajes y control, p. 22; [Practica 5, diap. 5 y 8](../../practica/enunciados/Clase%205%20%20-%20Practica.pptx) |
| `keysDo:`, `at:` y `displayString` para presentar contadores | Practica 5, diap. 12 |
| `isKindOf:` para identificar el subtipo y ofrecer sus datos particulares | [Mensajes y control, p. 21](../../teoria/material/2-POO-Mensajes-EstControl.pdf), tabla de mensajes de Object; ejemplo local de Biblioteca, lineas 193, 210 y 377 |

La tabla original de la p. 21 escribe `isKindOff:` con una errata. El selector utilizado en el ejemplo de Biblioteca y verificado en Dolphin es **`isKindOf:`**, con una sola `f` final. Por ejemplo, `unVuelo isKindOf: VueloNacional` reconoce instancias de esa clase y de sus subclases. Esta comprobacion se aplica a campos y presentacion; `precioFinal` conserva su calculo polimorfico.

La presentacion usa concatenacion de cadenas y `displayString`, sustituyendo `String streamContents:` y `printString`. `ChoicePrompter choices:caption:` conserva la referencia local compartida por el usuario, `E:\UTN\Paradigmas\TPIntegrador_Ejemplo\actualizado6.st`, lineas 82-98. Su aceptacion docente sigue pendiente; el usuario autorizo mantenerlo provisionalmente. La confirmacion del significado de disponibles tambien sigue pendiente: la implementacion conserva **Programado + Demorado** para promedio y superiores.

## Verificacion

El **17/10/2026** se ejecuto el Workspace actual en una copia temporal de **Dolphin Smalltalk Professional 7.0.5**. Tras corregir los delimitadores detectados por el compilador, se completo el recorrido real de carga, edicion, consultas y bajas con datos y en vacio. Tambien se confirmo dentro de la imagen que no existian `AplicacionAerolinea` ni `MenuAerolinea`. Ver [el registro actualizado](validacionMenuDolphin.md).

Como antecedente de la arquitectura anterior con clase de aplicacion, ese mismo dia habian pasado **46 escenarios/casos automatizados** en una copia aislada de **Dolphin Professional 7.0**, salida 0. Esas clases de prueba no ejecutan el Workspace actual:

| Clase de prueba | Resultado |
| --- | --- |
| `AerolineaPrueba ejecutar` | 14 escenarios de dominio |
| `AplicacionAerolineaPrueba ejecutar` | 10 casos anteriores del menu |
| `PrecioFinalPrueba ejecutar` | 9 casos de precios |
| `AplicacionAerolineaIntegracionPrueba ejecutar` | 13 escenarios nuevos de integracion |

Los nuevos escenarios recorren carga de ambos subtipos, duplicados, cupo diario y cero, cancelacion en cada campo, edicion de todos los atributos ofrecidos, booleanos false, numero fijo, fecha con y sin cupo, reapertura, busquedas, bajas y las nueve consultas, con datos y en vacio. Las validaciones incluyen importes decimales, fechas imposibles y siglos bisiestos. Las selecciones programadas se comprueban contra las opciones realmente ofrecidas.

La prueba inicial de actualizacion sobre las clases anteriores de Git conservo aplicacion, aerolinea, coleccion y vuelo. Tras elegir `isKindOf:`, se repitio la actualizacion desde la version que tenia `verTipo`, se retiraron esos tres metodos en la imagen aislada y se comprobaron busqueda y edicion sobre los objetos existentes. Pasaron nuevamente los 46 casos/escenarios, salida 0.

Para repetirlos, importar primero `pruebas/AerolineaPrueba.cls`, `pruebas/AplicacionAerolineaPrueba.cls`, `pruebas/PrecioFinalPrueba.cls` y finalmente [AplicacionAerolineaIntegracionPrueba.cls](../desarrollo/pruebas/AplicacionAerolineaIntegracionPrueba.cls). Evaluar los cuatro mensajes de la tabla. Las clases de prueba sustituyen entradas y avisos; no son necesarias para ejecutar la aplicacion.

La comprobacion historica posterior completo el recorrido controlado de la clase de aplicacion sobre dialogos reales: **184 acciones/comprobaciones y una verificacion final**. Sus capturas se conservan como antecedente, pero no sustituyen el recorrido nuevo del Workspace. La revision por otro integrante sigue pendiente; no se modificaron ni guardaron las imagenes de trabajo.

Para la revision del equipo, repetir el recorrido registrado: cargar ambos tipos con importes decimales; reintentar una fecha imposible; cancelar una carga y una edicion; mover a un dia completo y cambiar solo la hora; consultar resultados y contadores; eliminar un vuelo y luego cancelados; salir y reabrir la misma instancia.

El [diagrama de clases](diagramaClases.md) refleja los atributos, relaciones y operaciones principales de esta version.
