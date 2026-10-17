"Recorridos del menu completo con entradas programadas; no usa la imagen del usuario."!

AplicacionAerolineaPrueba subclass: #AplicacionAerolineaIntegracionPrueba
    instanceVariableNames: 'selecciones'
    classVariableNames: ''
    poolDictionaries: ''
    classInstanceVariableNames: ''!

!AplicacionAerolineaIntegracionPrueba categoriesForClass!TrabajoIntegrador-Pruebas! !
!AplicacionAerolineaIntegracionPrueba methodsFor!

prepararEntradas: unasEntradas opciones: unasOpciones selecciones: unasSelecciones
    super prepararEntradas: unasEntradas opciones: unasOpciones.
    selecciones := unasSelecciones readStream.
    ^self!

pedirOpcion: unasOpciones caption: unTitulo
    | opcion |
    selecciones atEnd ifTrue: [self error: 'Faltan selecciones para la prueba.'].
    opcion := selecciones next.
    opcion notNil ifTrue: [
        (unasOpciones includes: opcion) ifFalse: [self error: 'La opcion no existe en el selector real.']].
    ^opcion! !

!AplicacionAerolineaIntegracionPrueba categoriesFor: #prepararEntradas:opciones:selecciones:!public! !
!AplicacionAerolineaIntegracionPrueba categoriesFor: #pedirOpcion:caption:!private! !

!AplicacionAerolineaIntegracionPrueba class methodsFor!

crearConMaximo: unMaximo
    | aplicacion |
    aplicacion := self crear.
    aplicacion prepararEntradas: (Array with: 'UTN Air' with: '2000' with: 'Argentina' with: 'UTN' with: unMaximo)
        opciones: #() selecciones: #().
    aplicacion cargarAerolinea.
    ^aplicacion!

contiene: fragmento en: texto
    1 to: texto size - fragmento size + 1 do: [:i |
        (texto copyFrom: i to: i + fragmento size - 1) = fragmento ifTrue: [^true]].
    ^false!

agregarNacionalA: aplicacion numero: numero fecha: fecha estado: estado
    | vuelo |
    vuelo := AerolineaPrueba crearNacional: numero duracion: 90 destino: 'Cordoba'
        precio: 100 estado: estado equipaje: true.
    vuelo modFecha: fecha.
    self comprobar: (aplicacion verAerolinea cargar: vuelo) mensaje: 'Fallo la precarga del nacional.'.
    ^vuelo!

agregarInternacionalA: aplicacion numero: numero fecha: fecha estado: estado
    | vuelo |
    vuelo := AerolineaPrueba crearInternacional: numero duracion: 120 precio: 100 tasa: 50 estado: estado.
    vuelo modFecha: fecha.
    self comprobar: (aplicacion verAerolinea cargar: vuelo) mensaje: 'Fallo la precarga del internacional.'.
    ^vuelo!

probarImportesYEntradas
    | aplicacion |
    aplicacion := self crear.
    #('0' '0.00' '120' '120.5' '120.50' '001.25') do: [:texto |
        self comprobar: (aplicacion esPrecioValido: texto) mensaje: 'Debe aceptar un importe de cero a dos decimales.'].
    #('' '.' '.5' '120.' '120.555' '-1' '+1' '1,50' '1.2.3' '1e2' 'abc' '1 2') do: [:texto |
        self comprobar: (aplicacion esPrecioValido: texto) not mensaje: 'Debe rechazar un formato monetario invalido.'].
    aplicacion prepararEntradas: #('abc' '120.555' '-1' ' 120.50 ') opciones: #() selecciones: #().
    self comprobar: (aplicacion pedirPrecio: 'Precio') = 120.5 mensaje: 'Debe reintentar y convertir un importe decimal valido.'.
    self comprobar: aplicacion verMensajes size = 3 mensaje: 'Debe avisar cada importe invalido.'.
    aplicacion prepararEntradas: (Array with: nil) opciones: #() selecciones: #().
    self comprobar: (aplicacion pedirPrecio: 'Precio') isNil mensaje: 'Cancelar precio debe devolver nil.'.
    aplicacion prepararEntradas: #('0.5' '-1' '2') opciones: #() selecciones: #().
    self comprobar: (aplicacion pedirEntero: 'Numero' minimo: 1) = 2 mensaje: 'Los identificadores deben continuar siendo enteros.'.
    aplicacion prepararEntradas: #() opciones: #() selecciones: #('No').
    self comprobar: (aplicacion pedirBooleano: 'Dato') = false mensaje: 'No debe confundir false con cancelacion.'!

probarCalendario
    | aplicacion |
    aplicacion := self crear.
    #('29/02/2024 23:59' '29/02/2000 00:00' '29/02/2400 10:00' '31/01/2026 10:00'
      '30/04/2026 10:00' '01/01/0001 00:00' '31/12/9999 23:59') do: [:fecha |
        self comprobar: (aplicacion esFechaValida: fecha) mensaje: 'Debe aceptar una fecha real y su horario.'].
    #('31/02/2026 10:00' '29/02/2025 10:00' '29/02/1900 10:00' '29/02/2100 10:00'
      '31/04/2026 10:00' '00/01/2026 10:00' '01/00/2026 10:00' '01/13/2026 10:00'
      '01/01/0000 10:00' '01/01/2026 24:00' '01/01/2026 10:60' '1/01/2026 10:00'
      '01-01-2026 10:00' 'aa/01/2026 10:00' '01/01/2026 10:00x') do: [:fecha |
        self comprobar: (aplicacion esFechaValida: fecha) not mensaje: 'Debe rechazar fechas imposibles o formatos invalidos.'].
    aplicacion prepararEntradas: #('31/02/2026 10:00' '29/02/2024 10:00') opciones: #() selecciones: #().
    self comprobar: aplicacion pedirFecha = '29/02/2024 10:00' mensaje: 'Debe volver a pedir una fecha imposible.'.
    aplicacion prepararEntradas: (Array with: nil) opciones: #() selecciones: #().
    self comprobar: aplicacion pedirFecha isNil mensaje: 'Debe permitir cancelar la fecha.'!

probarSinAerolinea
    | aplicacion |
    aplicacion := self crear.
    aplicacion prepararEntradas: #()
        opciones: #('2. Ver datos de la aerolinea' '3. Cargar vuelo' '4. Buscar vuelo'
            '5. Modificar vuelo' '6. Eliminar vuelo' '7. Consultas' '8. Eliminar todos los cancelados' '0. Salir')
        selecciones: #().
    aplicacion iniciar.
    self comprobar: aplicacion verAerolinea isNil mensaje: 'Las operaciones no deben crear una aerolinea implicitamente.'.
    self comprobar: aplicacion verMensajes size = 7 mensaje: 'Cada operacion debe controlar la falta de aerolinea.'!

probarCargaAmbosTipos
    | aplicacion nacional internacional |
    aplicacion := self crear.
    aplicacion prepararEntradas:
        #('UTN Air' '2000' 'Argentina' 'UTN' '2'
          '1' 'La Plata' 'Cordoba' '21/10/2026 10:00' '90' '120.50' 'Cordoba'
          '2' 'La Plata' 'Montevideo' '21/10/2026 11:00' '120' '100.25' 'Uruguay' '10.50')
        opciones: #('1. Cargar aerolinea' '3. Cargar vuelo' '3. Cargar vuelo' '0. Salir')
        selecciones: #('Nacional' 'Programado' 'No' 'Internacional' 'Demorado' 'Si').
    aplicacion iniciar.
    nacional := aplicacion verAerolinea buscarPorNumero: 1.
    internacional := aplicacion verAerolinea buscarPorNumero: 2.
    self comprobar: aplicacion verAerolinea tamanio = 2 mensaje: 'El menu debe cargar ambos subtipos.'.
    self comprobar: (nacional isKindOf: VueloNacional) mensaje: 'Debe construir un nacional.'.
    self comprobar: nacional verllevaEquipaje = false mensaje: 'Debe aceptar equipaje false sin cancelar la carga.'.
    self comprobar: nacional verPrecioBase = 120.5 mensaje: 'Debe cargar el precio decimal nacional.'.
    self comprobar: nacional verprovDestino = 'Cordoba' mensaje: 'Debe cargar provincia.'.
    self comprobar: (internacional isKindOf: VueloInternacional) mensaje: 'Debe construir un internacional.'.
    self comprobar: internacional verDocumentacion mensaje: 'Debe cargar documentacion true.'.
    self comprobar: internacional verpaisDestino = 'Uruguay' mensaje: 'Debe cargar pais.'.
    self comprobar: internacional precioFinal = 110.75 mensaje: 'Debe sumar precio y tasa con decimales.'!

probarRechazosDeCarga
    | aplicacion original coleccion |
    aplicacion := self crearConMaximo: '1'.
    original := self agregarNacionalA: aplicacion numero: 1 fecha: '21/10/2026 10:00' estado: 'Cancelado'.
    coleccion := aplicacion verAerolinea verTodos.
    aplicacion prepararEntradas:
        #('1' '2' 'La Plata' 'Montevideo' '21/10/2026 11:00' '120' '100.25' 'Uruguay' '0'
          '3' 'La Plata' 'Rosario' '22/10/2026 10:00' '90' '0' 'Santa Fe')
        opciones: #('3. Cargar vuelo' '3. Cargar vuelo' '3. Cargar vuelo' '0. Salir')
        selecciones: #('Nacional' 'Internacional' 'Finalizado' 'No' 'Nacional' 'Programado' 'No').
    aplicacion iniciar.
    self comprobar: aplicacion verAerolinea tamanio = 2 mensaje: 'Debe rechazar duplicados y cupo, permitiendo otro dia.'.
    self comprobar: (aplicacion verAerolinea buscarPorNumero: 1) == original mensaje: 'El duplicado no debe reemplazar el original.'.
    self comprobar: (aplicacion verAerolinea buscarPorNumero: 2) isNil mensaje: 'El vuelo rechazado por cupo no debe quedar almacenado.'.
    self comprobar: aplicacion verAerolinea verTodos == coleccion mensaje: 'La carga debe conservar la coleccion.'.
    aplicacion := self crearConMaximo: '0'.
    aplicacion prepararEntradas: #('1' 'La Plata' 'Rosario' '21/10/2026 10:00' '90' '0' 'Santa Fe')
        opciones: #('3. Cargar vuelo' '0. Salir') selecciones: #('Nacional' 'Programado' 'No').
    aplicacion iniciar.
    self comprobar: aplicacion verAerolinea esVacio mensaje: 'El menu debe respetar maximo cero.'!

probarCancelacionesDeCarga
    | aplicacion original coleccion datos entradas casos |
    aplicacion := self crearConMaximo: '5'.
    original := self agregarNacionalA: aplicacion numero: 1 fecha: '21/10/2026 10:00' estado: 'Programado'.
    coleccion := aplicacion verAerolinea verTodos.
    #(#('2' 'La Plata' 'Cordoba' '21/10/2026 10:00' '90' '120.50' 'Cordoba')
      #('2' 'La Plata' 'Montevideo' '21/10/2026 10:00' '120' '100.25' 'Uruguay' '10.50'))
        do: [:completos |
            1 to: completos size do: [:paso |
                entradas := OrderedCollection new.
                1 to: paso - 1 do: [:i | entradas add: (completos at: i)].
                entradas add: nil.
                datos := #('Nacional' 'Programado' 'No').
                completos size = 8 ifTrue: [datos := #('Internacional' 'Demorado' 'Si')].
                aplicacion prepararEntradas: entradas opciones: #() selecciones: datos.
                aplicacion cargarVuelo.
                self comprobar: aplicacion verAerolinea tamanio = 1 mensaje: 'Cancelar cualquier campo no debe guardar un vuelo parcial.']].
    casos := Array
        with: (Array with: #() with: (Array with: nil))
        with: (Array with: #('2' 'La Plata' 'Cordoba' '21/10/2026 10:00' '90' '120.50')
            with: (Array with: 'Nacional' with: nil))
        with: (Array with: #('2' 'La Plata' 'Cordoba' '21/10/2026 10:00' '90' '120.50' 'Cordoba')
            with: (Array with: 'Nacional' with: 'Programado' with: nil))
        with: (Array with: #('2' 'La Plata' 'Montevideo' '21/10/2026 10:00' '120' '100.25' 'Uruguay' '10.50')
            with: (Array with: 'Internacional' with: 'Demorado' with: nil)).
    casos do: [:caso |
        aplicacion prepararEntradas: caso first opciones: #() selecciones: (caso at: 2).
        aplicacion cargarVuelo.
        self comprobar: aplicacion verAerolinea tamanio = 1 mensaje: 'Cancelar un selector no debe guardar un vuelo.'].
    self comprobar: aplicacion verAerolinea verTodos == coleccion mensaje: 'Las cancelaciones deben conservar la coleccion.'.
    self comprobar: (aplicacion verAerolinea buscarPorNumero: 1) == original mensaje: 'Deben conservar el vuelo existente.'!

probarEdicionComun
    | aplicacion vuelo coleccion |
    aplicacion := self crearConMaximo: '2'.
    vuelo := self agregarNacionalA: aplicacion numero: 1 fecha: '21/10/2026 10:00' estado: 'Programado'.
    coleccion := aplicacion verAerolinea verTodos.
    aplicacion prepararEntradas:
        #('1' 'Rosario' '1' 'Mendoza' '1' '22/10/2026 23:59' '1' '121' '1' '120.50' '1')
        opciones: #('5. Modificar vuelo' '5. Modificar vuelo' '5. Modificar vuelo'
            '5. Modificar vuelo' '5. Modificar vuelo' '5. Modificar vuelo' '0. Salir')
        selecciones: #('Origen' 'Destino' 'Fecha y hora' 'Duracion' 'Precio base' 'Estado' 'Finalizado').
    aplicacion iniciar.
    self comprobar: vuelo verNumero = 1 mensaje: 'La edicion debe conservar el numero.'.
    self comprobar: vuelo verOrigen = 'Rosario' mensaje: 'Debe editar origen.'.
    self comprobar: vuelo verDestino = 'Mendoza' mensaje: 'Debe editar destino.'.
    self comprobar: vuelo verFecha = '22/10/2026 23:59' mensaje: 'Debe editar fecha y hora.'.
    self comprobar: vuelo verDuracion = 121 mensaje: 'Debe editar duracion.'.
    self comprobar: vuelo verPrecioBase = 120.5 mensaje: 'Debe editar precio decimal.'.
    self comprobar: vuelo verEstado = 'Finalizado' mensaje: 'Debe editar estado sin eliminar el vuelo.'.
    self comprobar: (aplicacion verAerolinea buscarPorNumero: 1) == vuelo mensaje: 'Debe editar el mismo objeto.'.
    self comprobar: aplicacion verAerolinea verTodos == coleccion mensaje: 'Debe conservar la coleccion.'!

probarEdicionParticular
    | aplicacion nacional internacional |
    aplicacion := self crearConMaximo: '2'.
    nacional := self agregarNacionalA: aplicacion numero: 1 fecha: '21/10/2026 10:00' estado: 'Programado'.
    internacional := self agregarInternacionalA: aplicacion numero: 2 fecha: '21/10/2026 11:00' estado: 'Demorado'.
    aplicacion prepararEntradas: #('1' 'Santa Fe' '1' '2' 'Chile' '2' '12.34' '2')
        opciones: #('5. Modificar vuelo' '5. Modificar vuelo' '5. Modificar vuelo'
            '5. Modificar vuelo' '5. Modificar vuelo' '0. Salir')
        selecciones: #('Provincia de destino' 'Equipaje' 'No' 'Pais de destino'
            'Tasa internacional' 'Documentacion' 'No').
    aplicacion iniciar.
    self comprobar: nacional verprovDestino = 'Santa Fe' mensaje: 'Debe editar provincia.'.
    self comprobar: nacional verllevaEquipaje = false mensaje: 'Debe aceptar equipaje false.'.
    self comprobar: nacional precioFinal = 100 mensaje: 'El precio final debe reflejar el cambio de equipaje.'.
    self comprobar: internacional verpaisDestino = 'Chile' mensaje: 'Debe editar pais.'.
    self comprobar: internacional vertasaInter = 12.34 mensaje: 'Debe editar la tasa decimal.'.
    self comprobar: internacional verDocumentacion = false mensaje: 'Debe aceptar documentacion false.'.
    self comprobar: (internacional precioFinal - 112.34) abs < 0.000001 mensaje: 'Debe recalcular el precio final internacional.'!

probarEdicionFechaYCupo
    | aplicacion vuelo otro coleccion |
    aplicacion := self crearConMaximo: '1'.
    vuelo := self agregarNacionalA: aplicacion numero: 1 fecha: '21/10/2026 10:00' estado: 'Programado'.
    otro := self agregarInternacionalA: aplicacion numero: 2 fecha: '22/10/2026 10:00' estado: 'Demorado'.
    coleccion := aplicacion verAerolinea verTodos.
    aplicacion prepararEntradas: #('1' '22/10/2026 11:00')
        opciones: #('5. Modificar vuelo' '0. Salir') selecciones: #('Fecha y hora').
    aplicacion iniciar.
    self comprobar: vuelo verFecha = '21/10/2026 10:00' mensaje: 'El menu debe conservar la fecha si el otro dia esta completo.'.
    aplicacion prepararEntradas: #('1' '21/10/2026 23:59')
        opciones: #('5. Modificar vuelo' '0. Salir') selecciones: #('Fecha y hora').
    aplicacion iniciar.
    self comprobar: vuelo verFecha = '21/10/2026 23:59' mensaje: 'Debe permitir cambiar solo la hora con el cupo completo.'.
    aplicacion prepararEntradas: #('1' '31/02/2026 10:00' '23/10/2026 10:00')
        opciones: #('5. Modificar vuelo' '0. Salir') selecciones: #('Fecha y hora').
    aplicacion iniciar.
    self comprobar: vuelo verFecha = '23/10/2026 10:00' mensaje: 'Debe reintentar una fecha imposible y aceptar un dia con cupo.'.
    self comprobar: otro verFecha = '22/10/2026 10:00' mensaje: 'No debe modificar otro vuelo.'.
    self comprobar: aplicacion verAerolinea verTodos == coleccion mensaje: 'Las ediciones y reaperturas deben conservar la coleccion.'.
    self agregarNacionalA: aplicacion numero: 3 fecha: '21/10/2026 12:00' estado: 'Programado'!

probarCancelacionesDeEdicion
    | aplicacion nacional internacional previo coleccion opciones |
    aplicacion := self crearConMaximo: '2'.
    nacional := self agregarNacionalA: aplicacion numero: 1 fecha: '21/10/2026 10:00' estado: 'Programado'.
    internacional := self agregarInternacionalA: aplicacion numero: 2 fecha: '21/10/2026 11:00' estado: 'Demorado'.
    coleccion := aplicacion verAerolinea verTodos.
    (Array with: nacional with: internacional) do: [:vuelo |
        previo := aplicacion textoDeVuelo: vuelo.
        opciones := aplicacion camposPara: vuelo.
        self comprobar: (opciones includes: 'Numero') not mensaje: 'El selector no debe ofrecer editar numero.'.
        opciones do: [:campo |
            (#('Estado' 'Equipaje' 'Documentacion') includes: campo)
                ifTrue: [
                    aplicacion prepararEntradas: (Array with: vuelo verNumero displayString)
                        opciones: #() selecciones: (Array with: campo with: nil)]
                ifFalse: [
                    aplicacion prepararEntradas: (Array with: vuelo verNumero displayString with: nil)
                        opciones: #() selecciones: (Array with: campo)].
            aplicacion modificarVuelo.
            self comprobar: (aplicacion textoDeVuelo: vuelo) = previo mensaje: 'Cancelar el dato no debe cambiar ningun atributo.'].
        self comprobar: (aplicacion aplicarDato: 999 campo: 'Numero' vuelo: vuelo) not mensaje: 'No debe permitir editar el identificador.'].
    aplicacion prepararEntradas: (Array with: '1') opciones: #() selecciones: (Array with: nil).
    aplicacion modificarVuelo.
    aplicacion prepararEntradas: (Array with: nil) opciones: #() selecciones: #().
    aplicacion modificarVuelo.
    self comprobar: aplicacion verAerolinea verTodos == coleccion mensaje: 'Cancelar debe conservar la coleccion.'.
    self comprobar: nacional verNumero = 1 mensaje: 'Debe conservar el numero nacional.'.
    self comprobar: internacional verNumero = 2 mensaje: 'Debe conservar el numero internacional.'!

probarBusquedaYBajas
    | aplicacion nacional internacional coleccion |
    aplicacion := self crearConMaximo: '2'.
    nacional := self agregarNacionalA: aplicacion numero: 1 fecha: '21/10/2026 10:00' estado: 'Cancelado'.
    internacional := self agregarInternacionalA: aplicacion numero: 2 fecha: '21/10/2026 11:00' estado: 'Demorado'.
    coleccion := aplicacion verAerolinea verTodos.
    aplicacion prepararEntradas: (Array with: '1' with: '99' with: '99' with: nil with: '99')
        opciones: #('4. Buscar vuelo' '4. Buscar vuelo' '5. Modificar vuelo'
            '6. Eliminar vuelo' '6. Eliminar vuelo' '0. Salir') selecciones: #().
    aplicacion iniciar.
    self comprobar: (self contiene: 'Vuelo 1 - Nacional' en: aplicacion verMensajes first) mensaje: 'La busqueda debe mostrar el vuelo encontrado.'.
    self comprobar: aplicacion verAerolinea tamanio = 2 mensaje: 'Cancelar o usar un numero inexistente no debe eliminar vuelos.'.
    aplicacion prepararEntradas: #('1') opciones: #('6. Eliminar vuelo' '0. Salir') selecciones: #().
    aplicacion iniciar.
    self comprobar: (aplicacion verAerolinea buscarPorNumero: 1) isNil mensaje: 'Debe eliminar el vuelo elegido.'.
    self comprobar: (aplicacion verAerolinea buscarPorNumero: 2) == internacional mensaje: 'Debe conservar el otro vuelo.'.
    self comprobar: aplicacion verAerolinea verTodos == coleccion mensaje: 'La baja debe conservar la coleccion.'!

probarConsultas
    | aplicacion nacional internacional cancelado finalizado mensaje |
    aplicacion := self crearConMaximo: '5'.
    nacional := self agregarNacionalA: aplicacion numero: 1 fecha: '21/10/2026 10:00' estado: 'Programado'.
    internacional := self agregarInternacionalA: aplicacion numero: 2 fecha: '21/10/2026 11:00' estado: 'Demorado'.
    cancelado := self agregarNacionalA: aplicacion numero: 3 fecha: '21/10/2026 12:00' estado: 'Cancelado'.
    cancelado modDuracion: 180; modDestino: 'Rosario'; modPrecioBase: 1000.
    finalizado := self agregarNacionalA: aplicacion numero: 4 fecha: '21/10/2026 13:00' estado: 'Finalizado'.
    finalizado modDuracion: 30; modPrecioBase: 2000.
    #('Todos los vuelos' 'Programados' 'Duracion menor a dos horas' 'Destino'
      'Precio final promedio' 'Precios superiores al promedio' 'Mayor duracion'
      'Facturacion potencial' 'Cantidad por estado') do: [:consulta |
        aplicacion prepararEntradas: #('Cordoba') opciones: #('7. Consultas' '0. Salir')
            selecciones: (Array with: consulta).
        aplicacion iniciar.
        mensaje := aplicacion verMensajes last.
        consulta = 'Todos los vuelos' ifTrue: [
            self comprobar: (self contiene: 'Vuelo 3 - Nacional - Cancelado' en: mensaje) mensaje: 'El listado general debe conservar cancelados.'].
        consulta = 'Programados' ifTrue: [
            self comprobar: (self contiene: 'Vuelo 1 - Nacional - Programado' en: mensaje) mensaje: 'Debe mostrar programados.'.
            self comprobar: (self contiene: 'Vuelo 2 -' en: mensaje) not mensaje: 'Programados no debe mostrar demorados.'].
        consulta = 'Duracion menor a dos horas' ifTrue: [
            self comprobar: (self contiene: 'Vuelo 4 -' en: mensaje) mensaje: 'El listado corto debe incluir otros estados.'.
            self comprobar: (self contiene: 'Vuelo 2 -' en: mensaje) not mensaje: 'El listado corto debe excluir exactamente 120 minutos.'].
        consulta = 'Destino' ifTrue: [
            self comprobar: (self contiene: 'Vuelo 1 -' en: mensaje) mensaje: 'Debe filtrar destino.'.
            self comprobar: (self contiene: 'Vuelo 3 -' en: mensaje) not mensaje: 'Debe excluir destinos distintos.'].
        consulta = 'Precio final promedio' ifTrue: [
            self comprobar: (self contiene: '130' en: mensaje) mensaje: 'El promedio debe usar 110 y 150.'].
        consulta = 'Precios superiores al promedio' ifTrue: [
            self comprobar: (self contiene: 'Vuelo 2 -' en: mensaje) mensaje: 'Debe mostrar el disponible superior al promedio.'.
            self comprobar: (self contiene: 'Vuelo 3 -' en: mensaje) not mensaje: 'Debe excluir cancelados caros del listado superior.'].
        consulta = 'Mayor duracion' ifTrue: [
            self comprobar: (self contiene: 'Vuelo 3 - Nacional' en: mensaje) mensaje: 'Debe mostrar el mayor incluso cancelado.'].
        consulta = 'Facturacion potencial' ifTrue: [
            self comprobar: (self contiene: '110' en: mensaje) mensaje: 'Debe facturar solo programados.'].
        consulta = 'Cantidad por estado' ifTrue: [
            #('Programado: 1' 'Demorado: 1' 'Cancelado: 1' 'Finalizado: 1') do: [:fragmento |
                self comprobar: (self contiene: fragmento en: mensaje) mensaje: 'Debe mostrar el diccionario con contadores por estado.']]].
    self comprobar: aplicacion verAerolinea tamanio = 4 mensaje: 'Las consultas no deben alterar la coleccion.'!

probarVaciosYBajaMasiva
    | aplicacion conservado coleccion |
    aplicacion := self crearConMaximo: '5'.
    #('Todos los vuelos' 'Programados' 'Duracion menor a dos horas' 'Destino'
      'Precio final promedio' 'Precios superiores al promedio' 'Mayor duracion'
      'Facturacion potencial' 'Cantidad por estado') do: [:consulta |
        aplicacion prepararEntradas: #('Inexistente') opciones: #('7. Consultas' '0. Salir')
            selecciones: (Array with: consulta).
        aplicacion iniciar.
        self comprobar: aplicacion verMensajes size = 1 mensaje: 'Cada consulta vacia debe informar su resultado.'].
    aplicacion prepararEntradas: (Array with: nil) opciones: #('7. Consultas' '7. Consultas' '0. Salir')
        selecciones: (Array with: nil with: 'Destino').
    aplicacion iniciar.
    self comprobar: aplicacion verMensajes isEmpty mensaje: 'Cancelar consulta o destino no debe ejecutar ni mostrar un resultado.'.
    conservado := self agregarNacionalA: aplicacion numero: 1 fecha: '21/10/2026 10:00' estado: 'Programado'.
    self agregarNacionalA: aplicacion numero: 2 fecha: '21/10/2026 11:00' estado: 'Cancelado'.
    self agregarInternacionalA: aplicacion numero: 3 fecha: '21/10/2026 12:00' estado: 'Cancelado'.
    coleccion := aplicacion verAerolinea verTodos.
    aplicacion prepararEntradas: #()
        opciones: #('8. Eliminar todos los cancelados' '8. Eliminar todos los cancelados' '0. Salir')
        selecciones: #().
    aplicacion iniciar.
    self comprobar: aplicacion verAerolinea tamanio = 1 mensaje: 'Debe retirar solo cancelados.'.
    self comprobar: coleccion first == conservado mensaje: 'Debe conservar el vuelo vigente.'.
    self comprobar: aplicacion verAerolinea verTodos == coleccion mensaje: 'La baja masiva debe conservar la coleccion.'.
    self comprobar: aplicacion verMensajes first = 'Vuelos cancelados eliminados: 2' mensaje: 'Debe informar la cantidad eliminada.'.
    self comprobar: aplicacion verMensajes last = 'Vuelos cancelados eliminados: 0' mensaje: 'Repetir la baja debe informar cero.'!

ejecutar
    self probarImportesYEntradas.
    self probarCalendario.
    self probarSinAerolinea.
    self probarCargaAmbosTipos.
    self probarRechazosDeCarga.
    self probarCancelacionesDeCarga.
    self probarEdicionComun.
    self probarEdicionParticular.
    self probarEdicionFechaYCupo.
    self probarCancelacionesDeEdicion.
    self probarBusquedaYBajas.
    self probarConsultas.
    self probarVaciosYBajaMasiva.
    ^13! !

!AplicacionAerolineaIntegracionPrueba class categoriesFor: #crearConMaximo:!private! !
!AplicacionAerolineaIntegracionPrueba class categoriesFor: #contiene:en:!private! !
!AplicacionAerolineaIntegracionPrueba class categoriesFor: #agregarNacionalA:numero:fecha:estado:!private! !
!AplicacionAerolineaIntegracionPrueba class categoriesFor: #agregarInternacionalA:numero:fecha:estado:!private! !
!AplicacionAerolineaIntegracionPrueba class categoriesFor: #probarImportesYEntradas!private! !
!AplicacionAerolineaIntegracionPrueba class categoriesFor: #probarCalendario!private! !
!AplicacionAerolineaIntegracionPrueba class categoriesFor: #probarSinAerolinea!private! !
!AplicacionAerolineaIntegracionPrueba class categoriesFor: #probarCargaAmbosTipos!private! !
!AplicacionAerolineaIntegracionPrueba class categoriesFor: #probarRechazosDeCarga!private! !
!AplicacionAerolineaIntegracionPrueba class categoriesFor: #probarCancelacionesDeCarga!private! !
!AplicacionAerolineaIntegracionPrueba class categoriesFor: #probarEdicionComun!private! !
!AplicacionAerolineaIntegracionPrueba class categoriesFor: #probarEdicionParticular!private! !
!AplicacionAerolineaIntegracionPrueba class categoriesFor: #probarEdicionFechaYCupo!private! !
!AplicacionAerolineaIntegracionPrueba class categoriesFor: #probarCancelacionesDeEdicion!private! !
!AplicacionAerolineaIntegracionPrueba class categoriesFor: #probarBusquedaYBajas!private! !
!AplicacionAerolineaIntegracionPrueba class categoriesFor: #probarConsultas!private! !
!AplicacionAerolineaIntegracionPrueba class categoriesFor: #probarVaciosYBajaMasiva!private! !
!AplicacionAerolineaIntegracionPrueba class categoriesFor: #ejecutar!public! !
