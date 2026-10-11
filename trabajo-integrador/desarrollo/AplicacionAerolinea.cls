"Menu inicial del trabajo integrador, preparado para Dolphin Smalltalk 7."!

Object subclass: #AplicacionAerolinea
    instanceVariableNames: 'aerolinea continuar'
    classVariableNames: ''
    poolDictionaries: ''
    classInstanceVariableNames: ''!

AplicacionAerolinea guid: (GUID fromString: '{1C0A7CD0-8AF4-424B-9681-65F8D04CAA97}')!
AplicacionAerolinea comment: 'Coordina el menu y conserva la misma aerolinea durante la ejecucion. Las operaciones del dominio pertenecen a Aerolinea y a los vuelos.'!

!AplicacionAerolinea categoriesForClass!TrabajoIntegrador! !
!AplicacionAerolinea methodsFor!

init
    aerolinea := nil.
    continuar := false.
    ^self!

iniciar
    continuar := true.
    [continuar] whileTrue: [self ejecutarOpcion: self mostrarMenu].
    ^self!

mostrarMenu
    ^ChoicePrompter
        choices: #(
            '1. Cargar aerolinea'
            '2. Ver datos de la aerolinea'
            '0. Salir')
        caption: 'Gestion de aerolinea'!

ejecutarOpcion: unaOpcion
    unaOpcion isNil ifTrue: [^self salir].
    unaOpcion = '0. Salir' ifTrue: [^self salir].
    unaOpcion = '1. Cargar aerolinea' ifTrue: [^self cargarAerolinea].
    unaOpcion = '2. Ver datos de la aerolinea'
        ifTrue: [^self mostrarDatosAerolinea].
    ^self informar: 'La opcion seleccionada no es valida.'!

salir
    continuar := false.
    ^self!

cargarAerolinea
    | nombre anio pais codigo maximo nuevaAerolinea |
    aerolinea notNil ifTrue: [
        ^self informar: 'La aerolinea ya esta cargada. Se conservan sus datos y vuelos.'].

    nombre := self pedirTexto: 'Nombre de la aerolinea'.
    nombre isNil ifTrue: [^self].
    anio := self pedirEntero: 'Anio de fundacion' minimo: 1.
    anio isNil ifTrue: [^self].
    pais := self pedirTexto: 'Pais de origen'.
    pais isNil ifTrue: [^self].
    codigo := self pedirTexto: 'Codigo identificador'.
    codigo isNil ifTrue: [^self].
    maximo := self pedirEntero: 'Cantidad maxima de vuelos diarios' minimo: 0.
    maximo isNil ifTrue: [^self].

    "Publicar la aerolinea solo despues de completar todos los datos."
    nuevaAerolinea := Aerolinea new.
    nuevaAerolinea
        init: nombre
        anio: anio
        pais: pais
        cod: codigo
        cant: maximo.
    aerolinea := nuevaAerolinea.
    ^self informar: 'Aerolinea cargada.'!

mostrarDatosAerolinea
    aerolinea isNil ifTrue: [
        ^self informar: 'Primero debe cargar una aerolinea.'].
    ^self informar: (String streamContents: [:salida |
        salida
            nextPutAll: 'Nombre: '; nextPutAll: aerolinea vernomAero; cr;
            nextPutAll: 'Anio de fundacion: ';
            nextPutAll: aerolinea veranioFundacion printString; cr;
            nextPutAll: 'Pais de origen: '; nextPutAll: aerolinea verpaisdeOrigen; cr;
            nextPutAll: 'Codigo: '; nextPutAll: aerolinea vercodigoId; cr;
            nextPutAll: 'Maximo de vuelos diarios: ';
            nextPutAll: aerolinea vercantVuelosMaxDia printString; cr;
            nextPutAll: 'Vuelos cargados: '; nextPutAll: aerolinea tamanio printString])!

pedirEntrada: unMensaje
    ^Prompter prompt: unMensaje!

pedirTexto: unMensaje
    | texto |
    [true] whileTrue: [
        texto := self pedirEntrada: unMensaje.
        texto isNil ifTrue: [^nil].
        texto := texto trimBlanks.
        texto isEmpty ifFalse: [^texto].
        self informar: 'El dato no puede quedar vacio.']!

pedirEntero: unMensaje minimo: unMinimo
    | texto numero |
    [true] whileTrue: [
        texto := self pedirTexto: unMensaje.
        texto isNil ifTrue: [^nil].
        (texto allSatisfy: [:caracter | '0123456789' includes: caracter]) ifTrue: [
            numero := texto asNumber.
            numero >= unMinimo ifTrue: [^numero]].
        self informar: 'Ingrese un numero entero mayor o igual a ', unMinimo printString, '.']!

informar: unMensaje
    MessageBox notify: unMensaje.
    ^self!

verAerolinea
    ^aerolinea! !

!AplicacionAerolinea categoriesFor: #init!initializing!public! !
!AplicacionAerolinea categoriesFor: #iniciar!public! !
!AplicacionAerolinea categoriesFor: #mostrarMenu!private! !
!AplicacionAerolinea categoriesFor: #ejecutarOpcion:!private! !
!AplicacionAerolinea categoriesFor: #salir!private! !
!AplicacionAerolinea categoriesFor: #cargarAerolinea!private! !
!AplicacionAerolinea categoriesFor: #mostrarDatosAerolinea!private! !
!AplicacionAerolinea categoriesFor: #pedirEntrada:!private! !
!AplicacionAerolinea categoriesFor: #pedirTexto:!private! !
!AplicacionAerolinea categoriesFor: #pedirEntero:minimo:!private! !
!AplicacionAerolinea categoriesFor: #informar:!private! !
!AplicacionAerolinea categoriesFor: #verAerolinea!public! !

!AplicacionAerolinea class methodsFor!

crear
    ^(super new) init! !

!AplicacionAerolinea class categoriesFor: #crear!public! !
