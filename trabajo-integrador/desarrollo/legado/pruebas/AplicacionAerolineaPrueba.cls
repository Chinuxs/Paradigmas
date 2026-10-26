"Pruebas del menu inicial con entradas programadas, sin abrir dialogos."!

AplicacionAerolinea subclass: #AplicacionAerolineaPrueba
    instanceVariableNames: 'entradas opciones mensajes'
    classVariableNames: ''
    poolDictionaries: ''
    classInstanceVariableNames: ''!

!AplicacionAerolineaPrueba categoriesForClass!TrabajoIntegrador-Pruebas! !
!AplicacionAerolineaPrueba methodsFor!

prepararEntradas: unasEntradas opciones: unasOpciones
    entradas := unasEntradas readStream.
    opciones := unasOpciones readStream.
    mensajes := OrderedCollection new.
    ^self!

pedirEntrada: unMensaje
    entradas atEnd ifTrue: [self error: 'Faltan entradas para la prueba.'].
    ^entradas next!

mostrarMenu
    opciones atEnd ifTrue: [self error: 'El menu no termino como se esperaba.'].
    ^opciones next!

informar: unMensaje
    mensajes add: unMensaje.
    ^self!

verMensajes
    ^mensajes! !

!AplicacionAerolineaPrueba categoriesFor: #prepararEntradas:opciones:!public! !
!AplicacionAerolineaPrueba categoriesFor: #pedirEntrada:!private! !
!AplicacionAerolineaPrueba categoriesFor: #mostrarMenu!private! !
!AplicacionAerolineaPrueba categoriesFor: #informar:!private! !
!AplicacionAerolineaPrueba categoriesFor: #verMensajes!public! !

!AplicacionAerolineaPrueba class methodsFor!

comprobar: unaCondicion mensaje: unMensaje
    unaCondicion ifFalse: [self error: unMensaje]!

ejecutar
    | aplicacion original vuelos marcador canceladas separador |

    aplicacion := self new.
    self comprobar: aplicacion init == aplicacion mensaje: 'Init debe devolver la misma aplicacion.'.
    aplicacion
        prepararEntradas: #()
        opciones: (Array with: nil).
    self comprobar: aplicacion iniciar == aplicacion mensaje: 'Iniciar debe devolver la aplicacion.'.
    self comprobar: aplicacion verAerolinea isNil mensaje: 'Cancelar el menu no debe crear una aerolinea.'.

    aplicacion := self crear
        prepararEntradas: #()
        opciones: #('2. Ver datos de la aerolinea' '0. Salir').
    aplicacion iniciar.
    self comprobar: aplicacion verAerolinea isNil mensaje: 'Consultar datos no debe crear una aerolinea.'.
    self comprobar: aplicacion verMensajes size = 1 mensaje: 'Debe avisar que falta cargar la aerolinea.'.

    canceladas := Array
        with: (Array with: nil)
        with: (Array with: 'UTN Air' with: nil)
        with: (Array with: 'UTN Air' with: '2000' with: nil)
        with: (Array with: 'UTN Air' with: '2000' with: 'Argentina' with: nil)
        with: (Array with: 'UTN Air' with: '2000' with: 'Argentina' with: 'UTN' with: nil).
    canceladas do: [:datos |
        aplicacion := self crear
            prepararEntradas: datos
            opciones: #('1. Cargar aerolinea' '0. Salir').
        aplicacion iniciar.
        self comprobar: aplicacion verAerolinea isNil mensaje: 'Cancelar una carga no debe publicar datos parciales.'].

    aplicacion := self crear
        prepararEntradas: #('   ' ' UTN Air ' 'abc' '2000.5' '0' '2000' 'Argentina' 'UTN' '-1' '3')
        opciones: #('1. Cargar aerolinea' '2. Ver datos de la aerolinea' '0. Salir').
    aplicacion iniciar.
    original := aplicacion verAerolinea.
    self comprobar: original vernomAero = 'UTN Air' mensaje: 'Debe recortar blancos en el nombre.'.
    self comprobar: original veranioFundacion = 2000 mensaje: 'Debe rechazar anios invalidos.'.
    self comprobar: original vercantVuelosMaxDia = 3 mensaje: 'Debe rechazar el maximo negativo.'.
    separador := String with: Character cr with: Character lf.
    self comprobar: aplicacion verMensajes last = ('Nombre: UTN Air', separador,
        'Anio de fundacion: 2000', separador, 'Pais de origen: Argentina', separador,
        'Codigo: UTN', separador, 'Maximo de vuelos diarios: 3', separador,
        'Vuelos cargados: 0') mensaje: 'Debe mostrar los datos cargados.'.

    vuelos := original verTodos.
    marcador := Object new.
    original agregar: marcador.
    aplicacion
        prepararEntradas: #()
        opciones: #('1. Cargar aerolinea' '2. Ver datos de la aerolinea' '0. Salir').
    aplicacion iniciar.
    self comprobar: aplicacion verAerolinea == original mensaje: 'Reabrir el menu debe conservar la misma aerolinea.'.
    self comprobar: original verTodos == vuelos mensaje: 'No debe reemplazar la coleccion de vuelos.'.
    self comprobar: vuelos size = 1 mensaje: 'No debe vaciar los vuelos cargados.'.
    self comprobar: vuelos first == marcador mensaje: 'Debe conservar la referencia al objeto agregado.'.

    aplicacion := self crear
        prepararEntradas: #('UTN Air' '2000' 'Argentina' 'UTN' '0')
        opciones: #('1. Cargar aerolinea' 'opcion inexistente' '0. Salir').
    aplicacion iniciar.
    self comprobar: aplicacion verAerolinea vercantVuelosMaxDia = 0 mensaje: 'El maximo cero debe conservarse.'.
    self comprobar: aplicacion verMensajes last = 'La opcion seleccionada no es valida.' mensaje: 'Debe controlar una opcion invalida.'.
    ^10! !

!AplicacionAerolineaPrueba class categoriesFor: #comprobar:mensaje:!private! !
!AplicacionAerolineaPrueba class categoriesFor: #ejecutar!public! !
