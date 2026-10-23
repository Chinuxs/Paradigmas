# Carga, edicion de fecha, consultas y bajas de Aerolinea

Integracion del **16/10/2026** de los once metodos compartidos por un companero a traves del usuario. Fuente de requisitos: [enunciado 1, p. 2](../enunciado/Trabajo%20Integrador%20-%20Enunciados%202026.pdf). Para los iteradores `do:`, `select:` y `detect:ifNone:`, ver [Colecciones, pp. 13-14](../../teoria/material/5-POO-Colecciones.pdf); para diccionarios, p. 15 del mismo PDF.

El **17/10/2026** se incorporo `cargar:` adaptado a la decision del usuario de conservar **varias fechas en la misma coleccion**, usando las herramientas de catedra ya adoptadas. El aporte externo completo y el menu propuesto siguen teniendo la revision registrada en [revisionAerolinea.md](revisionAerolinea.md).

## Que se integro

Los metodos son de instancia de [Aerolinea](../desarrollo/Aerolinea.cls). Se conservaron los selectores del aporte y se agregaron sus categorias para la importacion en Dolphin. [aerolineaMetodos.txt](../desarrollo/aerolineaMetodos.txt) refleja la misma implementacion y el constructor de clase existente.

| Mensaje | Resultado |
| --- | --- |
| `cargar:` | `true` si incorpora el vuelo; `false` si el numero ya existe o se alcanzo el maximo de su dia de salida |
| `buscarPorNumero:` | El mismo objeto vuelo almacenado, o `nil` si no existe; para cambiar fecha con control de cupo usar el mensaje siguiente |
| `modificarFechaDeVuelo:a:` | Busca por numero y devuelve `true` si cambia la fecha; `false` si no existe o el dia de destino esta completo, sin modificar el vuelo |
| `listarProgramados` | Coleccion de vuelos con estado `'Programado'` |
| `listarDuracionMenorA2Horas` | Coleccion con duracion estrictamente menor a 120 |
| `filtrarSegunDestino:` | Coleccion con coincidencia exacta de ciudad de destino |
| `vuelosDisponibles` | Programados y Demorados, segun el criterio provisional elegido por el usuario el 16/10/2026 |
| `calcularPrecioPromedio` | Promedio de `precioFinal` de todos los vuelos mediante division directa; puede devolver una fraccion y devuelve 0 si no hay elementos |
| `mostrarVuelosConPrecioSuperiorAlPromedio` | Todos los vuelos con precio final estrictamente superior al promedio |
| `conocerVueloMayorDuracion` | El vuelo de mayor duracion; `nil` en vacio y primero encontrado en caso de empate |
| `calcularFacturacionTotal` | Suma de precios finales de vuelos programados |
| `eliminarTodosLosCancelados` | Retira todos los cancelados y devuelve `self`, conservando la coleccion original |
| `guardarEnDiccionarioVuelosPorEstado` | Diccionario de estado a cantidad de vuelos; incluye solo estados existentes |

Las consultas devuelven resultados para que el menu pueda mostrarlos; no abren dialogos ni escriben en `Transcript`. Los calculos usan `precioFinal` polimorfico de los vuelos nacionales e internacionales. La baja masiva selecciona antes de eliminar y no reemplaza `vuelos`.

## Ajustes respecto del aporte

- **Facturacion:** el aporte sumaba todos los no cancelados. El enunciado pide facturacion potencial de los **programados**; ahora recorre `self listarProgramados`.
- **Diccionario:** el aporte guardaba colecciones por estado. El enunciado pide la **cantidad** por estado; ahora guarda contadores numericos.

Se conservan el comportamiento de `agregar:`, la eliminacion individual, la inicializacion y el constructor. `cargar:` incorpora validaciones para las altas. El menu integrado el 17/10 usa ese mensaje, mantiene fijo el numero y delega los cambios de fecha a `modificarFechaDeVuelo:a:`. Ver [guia actual del menu](menuDolphinHelper.md).

## Carga en una coleccion de varias fechas

El usuario eligio el **17/10/2026** que `vuelos` conserve varias fechas. Es una decision de esta implementacion, pendiente de acuerdo grupal; el requisito expreso de la consigna es el maximo diario, junto con el numero unico.

`cargar:` rechaza numeros que ya existan en toda la coleccion. Luego selecciona los vuelos con la misma fecha de salida y compara su cantidad con `cantVuelosMaxDia`. La hora no separa cupos: dos vuelos del 21/10/2026 a las 00:01 y 23:59 cuentan para el mismo dia. El 22/10/2026, el 21/11/2026 y el 21/10/2027 tienen cupos independientes. El total de la coleccion puede superar el maximo diario.

La representacion actual de `Vuelo>>fecha` es texto **`dd/mm/aaaa hh:mm`**, como en las pruebas y los ejemplos existentes del proyecto. El metodo utiliza `copyFrom: 1 to: 10` para comparar la fecha completa. Ese mensaje aparece en [Practica 2, diap. 18](../../practica/enunciados/Clase%202%20-%20Practica.pptx); `select:` y `size`, en [Colecciones, pp. 12 y 14](../../teoria/material/5-POO-Colecciones.pdf). El formato es una convencion del proyecto, no una exigencia textual del enunciado. El metodo presupone vuelos con fechas en ese formato; no incorpora validacion de calendario ni conversiones a otras representaciones de fecha.

La coleccion conserva vuelos de todos los estados. El usuario confirmo que cada operacion debe recorrer o seleccionar de esa coleccion los vuelos que correspondan a su requisito. Los cancelados permanecen hasta una baja explicita, incluida `eliminarTodosLosCancelados`; cambiar el estado no elimina el objeto. Este criterio encaja con las operaciones de conteo por estado y eliminacion conjunta de cancelados del enunciado, p. 2.

`cargar:` cuenta los vuelos almacenados de ese dia, sin excluir estados. Se mantiene ese comportamiento y se retira la consulta sobre una posible excepcion de cupo para cancelados como pendiente: esa excepcion no fue solicitada ni exigida por el material. El filtro provisional de disponibles pertenece al promedio y a su listado, no a la conservacion de los vuelos en la coleccion.

Las altas deben enviar **`unaAerolinea cargar: unVuelo`** y comprobar su respuesta booleana antes de anunciar exito. `agregar:` conserva la operacion basica sin validaciones del protocolo recibido; el nuevo metodo la reutiliza despues de controlar numero y cupo. El flujo de altas del menu debera usar `cargar:`. Un rechazo no cambia los datos ni la referencia de la coleccion. Maximo cero rechaza toda alta.

## Cambiar la fecha sin superar el maximo diario

El **17/10/2026** el usuario confirmo aplicar el control diario tambien al modificar fecha. El PDF, p. 2, exige el cupo al cargar y permite modificar vuelos; no describe el procedimiento de edicion. Extender ese control a la modificacion es una decision de implementacion confirmada por el usuario.

```smalltalk
unaAerolinea modificarFechaDeVuelo: 123 a: '22/10/2026 14:30'.
```

El metodo busca el vuelo por su numero, cuenta los otros vuelos de la fecha solicitada y verifica el cupo antes de llamar a `modFecha:`. Excluye el numero del propio vuelo del conteo; cambiar solo la hora o repetir la fecha y hora en un dia completo conserva su plaza. Cuenta todos los estados, igual que `cargar:`. Un cambio aceptado libera cupo en el dia anterior y ocupa uno en el nuevo, sin retirar, reordenar ni reemplazar objetos. Si el dia de destino esta completo o el numero no existe devuelve `false`; el rechazo no altera ningun vuelo.

Se usan `select:` y `size` ([Colecciones, pp. 12 y 14](../../teoria/material/5-POO-Colecciones.pdf)), `copyFrom:to:` ([Practica 2, diap. 18](../../practica/enunciados/Clase%202%20-%20Practica.pptx)) y las comparaciones y `&` de [Mensajes y control, p. 6](../../teoria/material/2-POO-Mensajes-EstControl.pdf). Mantiene la convencion de texto `dd/mm/aaaa hh:mm`; no valida calendario. El futuro menu debe usar este metodo para editar fecha y comprobar el booleano. El setter basico `Vuelo>>modFecha:` sigue disponible y por si solo no controla el cupo de la aerolinea.

## Revision de recursos de la catedra

El **16/10/2026** el usuario reitero que los metodos nuevos deben usar recursos presentes en el material de la catedra. Se reviso el texto de las ocho fuentes PDF de teoria y las seis presentaciones de practica disponibles, y se leyeron los ejemplos originales pertinentes. Esta restriccion corresponde al pedido del usuario; las referencias siguientes respaldan las herramientas utilizadas.

| Recurso del aporte sin respaldo localizado | Adaptacion realizada | Fuente original |
| --- | --- | --- |
| `asFloat` | Se devuelve `total / disponibles size` directamente | [Mensajes y control, p. 9](../../teoria/material/2-POO-Mensajes-EstControl.pdf), ejemplos de division y fracciones |
| `removeAll:` | Se seleccionan los cancelados y se recorre esa seleccion enviando `self eliminar:` | [Colecciones, pp. 7 y 13-14](../../teoria/material/5-POO-Colecciones.pdf), `remove:ifAbsent:`, `do:` y `select:` |
| `includesKey:` | Se construye el conteo con `collect:`, `asSet`, `occurrencesOf:` y `at:put:` | [Practica 4, diap. 26](../../practica/enunciados/Clase%204.pptx) y [Practica 5, diap. 12](../../practica/enunciados/Clase%205%20%20-%20Practica.pptx), ejemplo de Farmacia por laboratorio |

La baja recorre `cancelados` y modifica `vuelos`, colecciones distintas: respeta el cuidado de la p. 13 de Colecciones y conserva la referencia de `vuelos`. La division `/` admite un promedio no entero sin conversion adicional; su resultado numerico puede ser fraccionario o real segun los operandos.

Recursos conservados y fuentes:

- `first` esta expresamente en **Colecciones, p. 7**, en la tabla de recuperacion de `OrderedCollection`.
- `size`, `isEmpty`, `asSet` e `includes:`: **Colecciones, p. 12**; `do:`: **p. 13**; `detect:ifNone:`, `select:` y `collect:`: **p. 14**. El filtro de disponibles usa `#('Programado' 'Demorado') includes: v verEstado`; los arreglos literales de cadenas se ejemplifican en [Practica 2, diap. 18](../../practica/enunciados/Clase%202%20-%20Practica.pptx).
- `Dictionary new`, `at:put:` y conteo por repeticion: **Practica 4, diap. 26**, repetido en **Practica 5, diap. 12**. Es la misma receta aplicada a estados en lugar de laboratorios.
- `ifTrue:`, `ifFalse:` y bloques: [Mensajes y control, p. 13](../../teoria/material/2-POO-Mensajes-EstControl.pdf). La suma, division, comparaciones y precedencia se trabajan en ese PDF; los ejemplos de division de la p. 9 incluyen fracciones.
- `verNumero`, `verEstado`, `verDuracion`, `verDestino` y `precioFinal` son mensajes de las clases del proyecto. El calculo comun por subtipo responde al [enunciado, p. 2](../enunciado/Trabajo%20Integrador%20-%20Enunciados%202026.pdf) y al polimorfismo de [Herencia, pp. 19-21](../../teoria/material/6-POO-Herencia.pdf).

La revision corresponde a los once metodos de consultas, a `cargar:` y a `modificarFechaDeVuelo:a:` incorporados el 17/10. La revision pendiente de utilidades anteriores de `AplicacionAerolinea` sigue registrada en [la guia del menu](menuDolphinHelper.md).

## Criterio provisional y consultas pendientes

El PDF enumera los estados **Programado, Demorado, Cancelado y Finalizado**. La catedra confirmo el **22/10/2026** que Programado y Demorado son los vuelos disponibles, pero tambien indico que el promedio y el listado superior deben analizar **todos los vuelos**, incluyendo todos los estados y subclases. Por eso `vuelosDisponibles` conserva el filtro de disponibilidad, mientras que los dos calculos recorren la coleccion completa.

El promedio y el listado superior al promedio usan ese mismo conjunto. Sin Programados ni Demorados, el promedio devuelve 0 y el listado queda vacio. La facturacion mantiene su requisito independiente: solo Programados. La interpretacion docente de disponibles y la poblacion del listado superior siguen pendientes de confirmacion; al recibir la respuesta, revisar ambos metodos y sus pruebas. La verificacion local acredita el criterio provisional implementado.

El filtro de dos horas conserva la representacion recibida de la duracion en **minutos** (`< 120`). El PDF no fija su unidad de almacenamiento; la carga de vuelos debera usar la misma convencion. El promedio vacio en 0 y el desempate por primer vuelo son comportamientos del aporte, no requisitos docentes expresos.

## Actualizar y probar

1. Conservar cualquier cambio propio sin exportar antes de reimportar una clase.
2. Tener cargados `Vuelo.cls`, `VueloNacional.cls` y `VueloInternacional.cls`, con `precioFinal` actualizado como indica [su guia](precioFinalHelper.md).
3. Importar `Aerolinea.cls` sobre la clase existente. No eliminar la clase ni reinicializar las aerolineas cargadas.
4. Para repetir las pruebas, importar [AerolineaPrueba.cls](../desarrollo/pruebas/AerolineaPrueba.cls) y evaluar:

```smalltalk
AerolineaPrueba ejecutar.
```

Devuelve **14** si pasan los diez escenarios anteriores y los cuatro de edicion de fecha: rechazo por dia completo, traslado con cupo y liberacion de la fecha anterior, cambio de hora en dia completo y numero inexistente. `probarDisponiblesYPromedio` usa los cuatro estados del enunciado: incluye Programados y Demorados, excluye Cancelados y Finalizados y verifica la actualizacion al cambiar estados y precios.

El **16/10/2026** se verificaron importacion y ocho escenarios en una copia aislada de **Dolphin Professional 7.0**, con salida 0. Tambien pasaron los diez casos existentes de `AplicacionAerolineaPrueba` y los nueve de `PrecioFinalPrueba`. Una prueba adicional cargo la clase anterior, creo una aerolinea con un vuelo y reimporto la version nueva: conservo datos, referencia a la coleccion y vuelo, y el objeto existente respondio a los metodos nuevos. No se modifico la imagen del usuario.

La proxima ronda debe actualizar el escenario de promedio para incluir Cancelados y Finalizados, y comprobar que el listado superior tambien los considera. La tasa internacional se trata como importe fijo y se suma al precio base, segun el enunciado y la implementacion actual.

El **17/10/2026** se verificaron los diez escenarios con `cargar:` en otra copia aislada de Dolphin Professional 7.0, salida 0, junto con diez casos del menu actual y nueve de precios. Las pruebas nuevas cubren maximo exacto y rechazo del exceso en dos dias, distintas horas del mismo dia, mismo numero de dia en otro mes o anio, conservacion de referencias, reutilizacion de cupo tras una baja, numero repetido entre fechas distintas, mismo objeto repetido y maximo cero. Una instancia creada antes de reimportar conservo sus datos y respondio al nuevo `cargar:`.

La verificacion posterior del **17/10/2026**, con `modificarFechaDeVuelo:a:`, paso **14 escenarios de Aerolinea, 10 del menu actual y 9 de precios** en Dolphin Professional 7.0 aislado, salida 0. Incluye fechas de otro mes/anio, todos los estados para el conteo, ambos subtipos y conservacion del numero, los objetos y el orden. Reimportar con objetos existentes conservo las referencias y permitio modificar la fecha del mismo vuelo.

La integracion posterior del **17/10/2026** conecto estas operaciones al menu, con edicion de datos comunes y particulares, numero fijo, validacion completa de calendario en la entrada y presentacion de resultados. Pasaron 46 casos/escenarios de las cuatro clases de prueba, incluido el dominio anterior sin regresiones. La actualizacion sobre clases anteriores conservo aplicacion, aerolinea, coleccion y vuelos existentes. Tambien se completo la [verificacion con dialogos reales](validacionMenuDolphin.md), con capturas revisadas y salida 0. La revision por otro integrante y los criterios docentes provisionales conservan su alcance. Ver [guia de importacion y pruebas](menuDolphinHelper.md).
