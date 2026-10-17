# Revision del aporte de AplicacionAerolinea

Fecha: **16/10/2026**. Archivo revisado: `C:\Users\Administrator\Downloads\AplicacionAerolinea_completa.txt`, recibido por el usuario y disponible fuera del repo. La revision se realizo sobre una copia del archivo en una imagen aislada de Dolphin Professional 7.0. La clase del repo conserva su version actual; el aporte aun no se integro.

## Compatibilidad comprobada

**Estado posterior, 17/10/2026:** por autorizacion del usuario se integro una adaptacion corregida a `AplicacionAerolinea.cls`, con menu completo, importes de hasta dos decimales, calendario real, edicion de todos los datos salvo numero y consultas en pantalla. Se sustituyeron las utilidades sin respaldo localizado, conservando ChoicePrompter como criterio provisional. Pasaron 46 casos/escenarios en Dolphin aislado y la prueba de reimportacion. El archivo recibido no se modifico. Los hallazgos y pendientes de la revision original que siguen describen ese archivo y el estado previo; para la version actual consultar [menuDolphinHelper.md](menuDolphinHelper.md).

La propuesta encaja con la estructura y el protocolo actuales: conserva superclase, variables `aerolinea continuar`, GUID, constructor `crear` e inicializacion explicita `init`. Agrega siete metodos de instancia y modifica solamente `mostrarMenu` y `ejecutarOpcion:`; no elimina metodos anteriores y tiene las categorias correspondientes.

Los nuevos metodos son `hayAerolinea`, `pedirOpcion:caption:`, `pedirEstado`, `pedirFecha`, `esFechaValida:`, `modificarVuelo` y `eliminarVuelo`. Los mensajes de dominio `buscarPorNumero:`, `eliminar:`, `modEstado:`, `modDuracion:` y `modPrecioBase:` existen en las clases actuales. Las etiquetas de las opciones 3 y 4 coinciden con el despacho del menu. Los cuatro estados de `pedirEstado` coinciden con el [enunciado 1, p. 2](../enunciado/Trabajo%20Integrador%20-%20Enunciados%202026.pdf).

Se comprobo que buscar, modificar y eliminar actuan sobre los mismos objetos. La reimportacion sobre una aplicacion con una aerolinea y un vuelo ya creados conservo sus datos y referencias.

## Hallazgos antes de incorporar

| Ubicacion en el archivo recibido | Hallazgo comprobado | Ajuste o criterio a resolver |
| --- | --- | --- |
| `esFechaValida:`, lineas 162-176 | Acepta `31/02/2026 10:00`, `29/02/2025 10:00` y `31/04/2026 10:00`. Solo controla dia 1-31, mes 1-12 y rango horario; no comprueba dias por mes ni bisiestos | Completar la validacion de calendario antes de usar el helper en carga o cambio de fecha |
| `esFechaValida:`, linea 169 | Introduce `isDigit`, sin respaldo localizado en el texto de las ocho fuentes PDF de teoria y seis presentaciones de practica disponibles | Sustituirlo por `'0123456789' includes: (unTexto at: i)`, usando recursos del material |
| `modificarVuelo`, lineas 197-200 | El precio base se pide con `pedirEntero:minimo:`. `120.50` se rechaza y se vuelve a pedir un entero; cero se acepta correctamente | El usuario definio el 17/10/2026 aceptar precios con hasta dos decimales. Adaptar la entrada al incorporar la opcion; criterio resuelto e implementacion pendiente |
| Metodos anteriores copiados de la clase actual | Conserva `trimBlanks`, `allSatisfy:`, `String streamContents:` y `printString`, cuya revision de catedra ya estaba pendiente; tampoco se localizaron en las fuentes examinadas | Completar esa revision para ajustar toda la clase al criterio solicitado por el usuario; estos cuatro usos no fueron introducidos por el aporte |

El validador de fecha si rechaza mes 13, dia 0, hora 24, minuto 60 y formatos incompletos. Tambien acepta anio `0000`: el codigo comprueba sus caracteres pero no extrae ni evalua el anio. `pedirFecha` y `esFechaValida:` no tienen un enlace desde las opciones del menu recibido; las fallas de calendario no intervienen en las dos operaciones nuevas actuales.

## Alcance real del aporte

El menu ofrece cargar aerolinea, ver sus datos, modificar vuelo, eliminar vuelo y salir. La modificacion abarca **estado, duracion y precio base**. Las cancelaciones se comprueban antes de mutar el vuelo.

La modificacion de vuelos es un requisito expreso del [enunciado 1, p. 2](../enunciado/Trabajo%20Integrador%20-%20Enunciados%202026.pdf): "Tambien se debe poder buscar un vuelo por su numero para modificarlo o eliminarlo". Ese parrafo no enumera los atributos que debe permitir editar. Los tres campos del aporte son una eleccion de implementacion; no son una lista ni una restriccion impuesta por el PDF.

El **17/10/2026** el usuario confirmo que la entrada de precios debe aceptar **hasta dos decimales**, incluyendo enteros y valores con una sola cifra decimal. Ejemplos de aceptacion: `120`, `120.5`, `120.50`; un ingreso con mas de dos cifras decimales excede el criterio solicitado. Este requisito de entrada corresponde al usuario; el PDF solicita precio base sin precisar su cantidad de decimales. La clase actual del repo todavia no ofrece esa entrada y la propuesta recibida sigue usando `pedirEntero:minimo:`.

## Respaldo original para precios con decimales

Revision solicitada por el usuario el **17/10/2026**, contrastando fuentes originales y el ejemplo local:

- [Mensajes y control, p. 22](../../teoria/material/2-POO-Mensajes-EstControl.pdf) presenta `(Prompter prompt: 'ingrese valor') asNumber` con la aclaracion expresa de que convierte a numero **entero o real**. La p. 20 incluye `Integer`, `Float` y `Fraction` como subclases numericas.
- [Practica 5, diap. 5 y 8](../../practica/enunciados/Clase%205%20%20-%20Practica.pptx) usa `asNumber` para ingresar el precio de un remedio y para modificarlo: `pre := (Prompter prompt: 'Ingrese nuevo precio') asNumber`. El dato se asigna mediante `rem modPrecio: pre`.
- El ejemplo local `E:\UTN\Paradigmas\TPIntegrador_Ejemplo\actualizado6.st`, linea 126 y otras entradas numericas, tambien usa `(Prompter prompt: ...) asNumber`. Ese ejemplo de Biblioteca no carga precios ni impone una cantidad de decimales; respalda el patron de entrada numerica y se mantiene distinguido del material docente original.

Por lo tanto, aceptar precios con decimales mediante `asNumber` tiene respaldo directo en la catedra. El rechazo de `120.50` en el aporte proviene de usar `pedirEntero:minimo:`, cuyo control previo acepta exclusivamente digitos y rechaza el punto antes de llegar a `asNumber`. El maximo de **dos cifras decimales** sigue siendo la decision del usuario: las fuentes citadas admiten numeros reales sin establecer esa precision. La futura entrada monetaria debe conservar `asNumber` y validar aparte el formato solicitado, sin reutilizar el filtro exclusivo de enteros. Esta revision es documental; no se modifico la aplicacion ni se ejecutaron pruebas nuevas.

## Alcance de edicion elegido por el usuario

El **17/10/2026** el usuario eligio permitir la modificacion de los datos del vuelo conservando fijo su **numero unico**. La edicion debe actuar sobre el mismo objeto y preservar las referencias. Los datos existentes en las clases y sus setters son:

| Vuelo | Datos editables | Mensajes existentes |
| --- | --- | --- |
| Todos | Origen, destino, fecha y hora, duracion, precio base y estado | `modOrigen:`, `modDestino:`, `modFecha:`, `modDuracion:`, `modPrecioBase:`, `modEstado:` |
| Nacional | Provincia de destino e inclusion de equipaje | `modprovDestino:`, `modllevaEquipaje:` |
| Internacional | Pais de destino, tasa internacional y requerimiento de documentacion adicional | `modpaisDestino:`, `modtasaInter:`, `modDocumentacion:` |

La clase Nacional/Internacional no es un dato ordinario del formulario: la conversion entre subclases queda fuera de esta edicion de atributos. `precioFinal` es un resultado calculado por la formula del subtipo y se recalcula a partir de los datos editados; no se solicita como valor editable. El formulario no debe ofrecer numero de vuelo; el setter previo `modNumero:` existe en el dominio y no se retiro en esta definicion de alcance.

Al cambiar fecha debe comprobarse el cupo del dia de destino antes de mutar, considerando los otros vuelos sin contar dos veces el propio. El usuario confirmo ese control y se implemento en `Aerolinea>>modificarFechaDeVuelo:a:` el 17/10: devuelve booleano y conserva la fecha original ante rechazo. Cambiar solo la hora dentro del mismo dia conserva su plaza. Verificado en Dolphin aislado, con 14 escenarios de Aerolinea, 10 del menu actual y 9 de precios; el futuro formulario debe delegar la fecha a ese mensaje. Los importes deben respetar la precision de entrada ya elegida. El alcance es una decision del usuario, pendiente de implementar en el menu y de revision grupal; no se atribuye como una lista de campos exigida por el PDF.

El archivo no aporta carga de vuelos ni opciones para las consultas de `Aerolinea`. Para probar modificacion y baja se precargaron vuelos en las pruebas aisladas. Las validaciones de numero unico y cupo diario del dominio siguen pendientes como antes. Esta propuesta no representa por si sola el menu completo del integrador.

## Fuentes de los recursos revisados

| Recurso | Fuente original |
| --- | --- |
| `includes:` e `isEmpty` de colecciones | [Colecciones, p. 12](../../teoria/material/5-POO-Colecciones.pdf) |
| Acceso `at:`, recorrido `to:do:` | Colecciones, pp. 7 y 13 del mismo PDF |
| `copyFrom:to:` y un caracter como `$e` | [Practica 2, diap. 18](../../practica/enunciados/Clase%202%20-%20Practica.pptx) |
| `between:and:`, comparaciones y `&` | [Mensajes y control, pp. 6-9](../../teoria/material/2-POO-Mensajes-EstControl.pdf) |
| `ifTrue:`, `ifFalse:`, bloques y repeticion | Mensajes y control, pp. 13-15 del mismo PDF |
| `asNumber`, `Prompter prompt:` y `MessageBox notify:` | Mensajes y control, p. 22 del mismo PDF |

`ChoicePrompter` ya formaba parte del menu actual y de la referencia local de Biblioteca; la aceptacion docente de esa referencia y de la clase de aplicacion sigue pendiente segun [la guia del menu](menuDolphinHelper.md). La busqueda de recursos se limita al material disponible; no sustituye una indicacion del tutor.

## Verificacion ejecutada

Importacion del archivo recibido y pruebas ejecutadas en **Dolphin Professional 7.0 aislado**, salida 0:

- **6 escenarios nuevos:** operaciones sin aerolinea, numeros inexistentes, cambios de estado/duracion/precio, cancelaciones en todos los pasos, baja con referencias conservadas y caracterizacion de entrada de precio entero/cero.
- **10 casos existentes del menu**, **8 escenarios de Aerolinea** y **9 casos de precios**, sin regresiones.
- Reimportacion con objetos existentes: datos, aerolinea, coleccion y vuelos conservados.
- Pruebas directas del helper de fechas: reprodujeron las aceptaciones incorrectas indicadas arriba; el reintento ante formato invalido y la cancelacion funcionan.

Se usaron entradas y selecciones programadas; no se verifico visualmente el recorrido de dialogos. La salida 0 indica que el script de revision completo sus comprobaciones y reprodujo los hallazgos; las fechas invalidas aceptadas siguen siendo defectos del aporte. No se modificaron el archivo original ni la imagen del usuario.

## Revision conjunta del 17/10/2026

Se probo esta misma aplicacion con el bloque de clase de `Aerolinea_corregida.txt`: los diez casos anteriores del menu, ocho de Aerolinea, nueve de precios y seis nuevos de la aplicacion volvieron a pasar en Dolphin aislado. Los hallazgos de fechas, recursos y precio entero siguen vigentes. `cargar:` del archivo de dominio recibido no se invoca desde este menu, limita por cantidad total y deja `agregar:` sin validaciones. El enunciado no especifica la representacion de la coleccion. Posteriormente el usuario eligio varias fechas y se incorporo `cargar:` adaptado por fecha de salida en la clase actual del repo; el menu propuesto sigue pendiente de ajustes e integracion y sus altas futuras deberan usar ese mensaje. Ver [revision conjunta y pruebas de carga](revisionAerolinea.md).
