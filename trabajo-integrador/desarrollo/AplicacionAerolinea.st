"Evaluar todo este archivo en un Workspace de Dolphin Smalltalk 7.
No declara clases: el menu y la logica viven en bloques del Workspace.
Antes, importar Vuelo, VueloNacional, VueloInternacional y Aerolinea."

| aerolinea continuar opciones pedirOpcion informar salto recortar pedirTexto esEntero pedirEntero esPrecio pedirPrecio pedirEstado pedirBooleano esBisiesto esFecha pedirFecha buscarVuelo cargarVuelo modificarFecha textoBooleano textoVuelo mostrarVuelos calcularPromedio vuelosSuperiores mayorDuracion facturacionPotencial diccionarioEstado
 precargarVuelos vuelo1 vuelo2 vuelo3 vuelo4 vuelo5 vuelo6 vuelo7 vuelo8 vuelo9 vuelo10 |

precargarVuelos := [
"Precarga de diez vuelos, uno por dia, para la muestra."
vuelo1 := VueloNacional crear: 101 con: 2 con: 'Buenos Aires' con: 'Cordoba' con: '01/12/2026 08:30' con: 520000 con: 'Programado' con: 'Cordoba' con: true.
vuelo2 := VueloInternacional crear: 201 con: 10 con: 'Buenos Aires' con: 'Madrid' con: '02/12/2026 21:45' con: 3200000 con: 'Programado' con: 'Espana' con: 15 con: true.
vuelo3 := VueloNacional crear: 102 con: 3 con: 'Buenos Aires' con: 'Mendoza' con: '03/12/2026 14:00' con: 680000 con: 'Demorado' con: 'Mendoza' con: false.
vuelo4 := VueloInternacional crear: 202 con: 12 con: 'Buenos Aires' con: 'Roma' con: '04/12/2026 16:30' con: 3500000 con: 'Demorado' con: 'Italia' con: 10 con: false.
vuelo5 := VueloNacional crear: 103 con: 2 con: 'Buenos Aires' con: 'Bariloche' con: '05/12/2026 07:15' con: 750000 con: 'Cancelado' con: 'Rio Negro' con: true.
vuelo6 := VueloInternacional crear: 203 con: 9 con: 'Cordoba' con: 'Santiago de Chile' con: '06/12/2026 09:20' con: 2700000 con: 'Cancelado' con: 'Chile' con: 12 con: true.
vuelo7 := VueloNacional crear: 104 con: 1 con: 'Cordoba' con: 'Salta' con: '07/12/2026 19:00' con: 510000 con: 'Finalizado' con: 'Salta' con: false.
vuelo8 := VueloInternacional crear: 204 con: 11 con: 'Buenos Aires' con: 'Paris' con: '08/12/2026 18:15' con: 3800000 con: 'Finalizado' con: 'Francia' con: 15 con: true.
vuelo9 := VueloNacional crear: 105 con: 2 con: 'Buenos Aires' con: 'Tucuman' con: '09/12/2026 06:45' con: 590000 con: 'Programado' con: 'Tucuman' con: true.
vuelo10 := VueloInternacional crear: 205 con: 13 con: 'Buenos Aires' con: 'Londres' con: '10/12/2026 12:40' con: 4200000 con: 'Programado' con: 'Reino Unido' con: 20 con: true.


"Usar cargar: para conservar las validaciones de numero y cupo diario."
aerolinea cargar: vuelo1.
aerolinea cargar: vuelo2.
aerolinea cargar: vuelo3.
aerolinea cargar: vuelo4.
aerolinea cargar: vuelo5.
aerolinea cargar: vuelo6.
aerolinea cargar: vuelo7.
aerolinea cargar: vuelo8.
aerolinea cargar: vuelo9.
aerolinea cargar: vuelo10.
].
aerolinea := nil.
continuar := true.
opciones := #(
    '1. Cargar aerolinea'
    '2. Ver datos de la aerolinea'
    '3. Cargar vuelo'
    '4. Buscar vuelo'
    '5. Modificar vuelo'
    '6. Eliminar vuelo'
    '7. Consultas'
    '8. Eliminar todos los cancelados'
    '0. Salir').

pedirOpcion := [:unasOpciones :unTitulo |
    ChoicePrompter choices: unasOpciones caption: unTitulo].

informar := [:unMensaje | MessageBox notify: unMensaje].
salto := String with: Character cr with: Character lf.

recortar := [:unTexto |
    | inicio fin |
    inicio := 1.
    fin := unTexto size.
    [(inicio <= fin) and: [(unTexto at: inicio) = $ ]] whileTrue: [inicio := inicio + 1].
    [(inicio <= fin) and: [(unTexto at: fin) = $ ]] whileTrue: [fin := fin - 1].
    inicio > fin
        ifTrue: ['']
        ifFalse: [unTexto copyFrom: inicio to: fin]].

pedirTexto := [:unMensaje |
    | texto terminado |
    texto := nil.
    terminado := false.
    [terminado not] whileTrue: [
        texto := Prompter prompt: unMensaje.
        texto isNil
            ifTrue: [terminado := true]
            ifFalse: [
                texto := recortar value: texto.
                texto isEmpty
                    ifTrue: [informar value: 'El dato no puede quedar vacio.']
                    ifFalse: [terminado := true]]].
    texto].

esEntero := [:unTexto |
    | valido |
    valido := unTexto isEmpty not.
    1 to: unTexto size do: [:i |
        ((unTexto at: i) isDigit) ifFalse: [valido := false]].
    valido].


pedirEntero := [:unMensaje :unMinimo |
    | texto numero terminado |
    numero := nil.
    terminado := false.
    [terminado not] whileTrue: [
        texto := pedirTexto value: unMensaje.
        texto isNil
            ifTrue: [terminado := true]
            ifFalse: [
                ((esEntero value: texto) and: [texto asNumber >= unMinimo])
                    ifTrue: [numero := texto asNumber. terminado := true]
                    ifFalse: [informar value: 'Ingrese un numero entero mayor o igual a ', unMinimo printString, '.']]].
    numero].

esPrecio := [:unTexto |
    | c puntos valido |
    valido := unTexto isEmpty not.
    puntos := 0.
    1 to: unTexto size do: [:i |
        c := unTexto at: i.
        (c = $.)
            ifTrue: [puntos := puntos + 1]
            ifFalse: [(c isDigit) ifFalse: [valido := false]]].
    valido and: [(puntos <= 1) and: [((unTexto at: 1) ~= $.) and: [(unTexto at: unTexto size) ~= $.]]]].

pedirPrecio := [:unMensaje |
    | texto precio terminado |
    precio := nil.
    terminado := false.
    [terminado not] whileTrue: [
        texto := pedirTexto value: unMensaje.
        texto isNil
            ifTrue: [terminado := true]
            ifFalse: [
                (esPrecio value: texto)
                    ifTrue: [precio := texto asNumber. terminado := true]
                    ifFalse: [informar value: 'Ingrese un precio valido. Use punto para los decimales, por ejemplo 1500.50']]].
    precio].

pedirEstado := [
    pedirOpcion value: #('Programado' 'Demorado' 'Cancelado' 'Finalizado') value: 'Estado del vuelo'].

pedirBooleano := [:unMensaje |
    | opcion resultado |
    opcion := pedirOpcion value: #('Si' 'No') value: unMensaje.
    resultado := nil.
    opcion = 'Si' ifTrue: [resultado := true].
    opcion = 'No' ifTrue: [resultado := false].
    resultado].

esBisiesto := [:unAnio |
    | resto resultado |
    resto := unAnio.
    [resto >= 400] whileTrue: [resto := resto - 400].
    resultado := resto = 0.
    (resultado not and: [#(100 200 300) includes: resto])
        ifFalse: [
            (resultado not) ifTrue: [
                [resto >= 4] whileTrue: [resto := resto - 4].
                resultado := resto = 0]].
    resultado].

esFecha := [:unTexto |
    | dia mes anio hora minuto maximoDia valido |
    valido := unTexto size = 16.
    valido ifTrue: [
        ((unTexto at: 3) = $/) ifFalse: [valido := false].
        ((unTexto at: 6) = $/) ifFalse: [valido := false].
        ((unTexto at: 11) = $ ) ifFalse: [valido := false].
        ((unTexto at: 14) = $:) ifFalse: [valido := false]].
    valido ifTrue: [
        #(1 2 4 5 7 8 9 10 12 13 15 16) do: [:i |
            ('0123456789' includes: (unTexto at: i)) ifFalse: [valido := false]]].
    valido ifTrue: [
        dia := (unTexto copyFrom: 1 to: 2) asNumber.
        mes := (unTexto copyFrom: 4 to: 5) asNumber.
        anio := (unTexto copyFrom: 7 to: 10) asNumber.
        hora := (unTexto copyFrom: 12 to: 13) asNumber.
        minuto := (unTexto copyFrom: 15 to: 16) asNumber.
        (mes between: 1 and: 12) ifFalse: [valido := false].
        anio < 1 ifTrue: [valido := false].
        (hora between: 0 and: 23) ifFalse: [valido := false].
        (minuto between: 0 and: 59) ifFalse: [valido := false]].
    valido ifTrue: [
        maximoDia := #(31 28 31 30 31 30 31 31 30 31 30 31) at: mes.
        (mes = 2 and: [esBisiesto value: anio]) ifTrue: [maximoDia := 29].
        valido := dia between: 1 and: maximoDia].
    valido].

pedirFecha := [
    | texto terminado resultado |
    terminado := false.
    resultado := nil.
    [terminado not] whileTrue: [
        texto := pedirTexto value: 'Fecha y hora de salida (dd/mm/aaaa hh:mm)'.
        texto isNil
            ifTrue: [terminado := true]
            ifFalse: [
                (esFecha value: texto)
                    ifTrue: [resultado := texto. terminado := true]
                    ifFalse: [informar value: 'Ingrese una fecha y hora reales con formato dd/mm/aaaa hh:mm.']]].
    resultado
].

buscarVuelo := [:unNumero |
    aerolinea verTodos detect: [:vuelo | vuelo verNumero = unNumero] ifNone: [nil]].

cargarVuelo := [:unVuelo |
    | dia cantidad duplicado cargado |
    duplicado := (buscarVuelo value: unVuelo verNumero) notNil.
    cargado := false.
    duplicado
        ifFalse: [
            dia := unVuelo verFecha copyFrom: 1 to: 10.
            cantidad := (aerolinea verTodos select: [:vuelo |
                (vuelo verFecha copyFrom: 1 to: 10) = dia]) size.
            (cantidad < aerolinea vercantVuelosMaxDia) ifTrue: [
                aerolinea verTodos add: unVuelo.
                cargado := true]].
    cargado].

modificarFecha := [:unNumero :otraFecha |
    | vuelo dia cantidad valido |
    vuelo := buscarVuelo value: unNumero.
    valido := vuelo notNil.
    valido ifTrue: [
        dia := otraFecha copyFrom: 1 to: 10.
        cantidad := (aerolinea verTodos select: [:otroVuelo |
            (otroVuelo verNumero ~= unNumero) and:
                [(otroVuelo verFecha copyFrom: 1 to: 10) = dia]]) size.
        (cantidad < aerolinea vercantVuelosMaxDia)
            ifTrue: [vuelo modFecha: otraFecha]
            ifFalse: [valido := false]].
    valido].

textoBooleano := [:unBooleano |
    unBooleano ifTrue: ['Si'] ifFalse: ['No']].

textoVuelo := [:unVuelo |
    | tipo texto |
    tipo := 'Vuelo'.
    (unVuelo isKindOf: VueloNacional) ifTrue: [tipo := 'Nacional'].
    (unVuelo isKindOf: VueloInternacional) ifTrue: [tipo := 'Internacional'].
    texto := 'Vuelo ', unVuelo verNumero displayString, ' - ', tipo,
        salto, 'Origen: ', unVuelo verOrigen,
        salto, 'Destino: ', unVuelo verDestino,
        salto, 'Salida: ', unVuelo verFecha,
        salto, 'Duracion: ', unVuelo verDuracion displayString, ' minutos',
        salto, 'Estado: ', unVuelo verEstado,
        salto, 'Precio base: ', unVuelo verPrecioBase displayString,
        salto, 'Precio final: ', unVuelo precioFinal displayString.
    (unVuelo isKindOf: VueloNacional) ifTrue: [
        texto := texto, salto, 'Provincia: ', unVuelo verprovDestino,
            salto, 'Equipaje: ', (textoBooleano value: unVuelo verllevaEquipaje)].
    (unVuelo isKindOf: VueloInternacional) ifTrue: [
        texto := texto, salto, 'Pais: ', unVuelo verpaisDestino,
            salto, 'Tasa internacional: ', unVuelo vertasaInter displayString,
            salto, 'Documentacion adicional: ', (textoBooleano value: unVuelo verDocumentacion)].
    texto].

mostrarVuelos := [:unosVuelos :unTitulo |
    | texto |
    unosVuelos isEmpty
        ifTrue: [informar value: unTitulo, ': no hay vuelos.']
        ifFalse: [
            texto := unTitulo.
            unosVuelos do: [:vuelo |
                | tipo |
                tipo := 'Vuelo'.
                (vuelo isKindOf: VueloNacional) ifTrue: [tipo := 'Nacional'].
                (vuelo isKindOf: VueloInternacional) ifTrue: [tipo := 'Internacional'].
                texto := texto, salto, salto,
                    'Vuelo ', vuelo verNumero displayString, ' - ', tipo, ' - ', vuelo verEstado,
                    salto, vuelo verOrigen, ' -> ', vuelo verDestino,
                    ' | ', vuelo verFecha, salto,
                    'Duracion: ', vuelo verDuracion displayString, ' min | Precio final: ',
                    vuelo precioFinal displayString].
            informar value: texto]].

calcularPromedio := [
    | vuelos total |
    vuelos := aerolinea verTodos.
    total := 0.
    vuelos do: [:vuelo | total := total + vuelo precioFinal].
    vuelos isEmpty ifTrue: [0] ifFalse: [total / vuelos size]].

vuelosSuperiores := [
    | vuelos promedio |
    promedio := calcularPromedio value.
    vuelos := aerolinea verTodos.
    vuelos select: [:vuelo | vuelo precioFinal > promedio]].

mayorDuracion := [
    | mayor |
    mayor := nil.
    aerolinea verTodos do: [:vuelo |
        (mayor isNil or: [vuelo verDuracion > mayor verDuracion])
            ifTrue: [mayor := vuelo]].
    mayor].

facturacionPotencial := [
    | total |
    total := 0.
    (aerolinea verTodos select: [:vuelo | vuelo verEstado = 'Programado'])
        do: [:vuelo | total := total + vuelo precioFinal].
    total].

diccionarioEstado := [
    | estados diccionario |
    estados := aerolinea verTodos collect: [:vuelo | vuelo verEstado].
    diccionario := Dictionary new.
    estados asSet do: [:estado |
        diccionario at: estado put: (estados occurrencesOf: estado)].
    diccionario].

[continuar] whileTrue: [
    | opcion |
    opcion := pedirOpcion value: opciones value: 'Gestion de aerolinea'.
    opcion isNil ifTrue: [continuar := false].
    opcion = '0. Salir' ifTrue: [continuar := false].

    opcion = '1. Cargar aerolinea' ifTrue: [
        | nombre anio pais codigo maximo |
        aerolinea notNil
            ifTrue: [informar value: 'La aerolinea ya esta cargada. Se conservan sus datos y vuelos.']
            ifFalse: [
                nombre := pedirTexto value: 'Nombre de la aerolinea'.
                nombre notNil ifTrue: [anio := pedirEntero value: 'Anio de fundacion' value: 1].
                (nombre notNil and: [anio notNil]) ifTrue: [pais := pedirTexto value: 'Pais de origen'].
                (nombre notNil and: [anio notNil and: [pais notNil]]) ifTrue: [codigo := pedirTexto value: 'Codigo identificador'].
                (nombre notNil and: [anio notNil and: [pais notNil and: [codigo notNil]]])
                    ifTrue: [maximo := pedirEntero value: 'Cantidad maxima de vuelos diarios' value: 0].
                (nombre notNil and: [anio notNil and: [pais notNil and: [codigo notNil and: [maximo notNil]]]])
                    ifTrue: [
                        aerolinea := Aerolinea crear: nombre con: anio con: pais con: codigo con: maximo.
                        precargarVuelos value.
                        informar value: 'Aerolinea cargada.']]].

    opcion = '2. Ver datos de la aerolinea' ifTrue: [
        aerolinea isNil
            ifTrue: [informar value: 'Primero debe cargar una aerolinea.']
            ifFalse: [
                informar value: 'Nombre: ', aerolinea vernomAero, salto,
                    'Anio de fundacion: ', aerolinea veranioFundacion displayString, salto,
                    'Pais de origen: ', aerolinea verpaisdeOrigen, salto,
                    'Codigo: ', aerolinea vercodigoId, salto,
                    'Maximo de vuelos diarios: ', aerolinea vercantVuelosMaxDia displayString, salto,
                    'Vuelos cargados: ', aerolinea verTodos size displayString]].

 opcion = '3. Cargar vuelo' ifTrue: [
        | tipo numero origen destino fecha duracion precio estado provincia equipaje pais tasa documentacion vuelo |
        aerolinea isNil
            ifTrue: [informar value: 'Primero debe cargar una aerolinea.']
            ifFalse: [
                tipo := pedirOpcion value: #('Nacional' 'Internacional') value: 'Tipo de vuelo'.
                tipo notNil ifTrue: [numero := pedirEntero value: 'Numero unico del vuelo' value: 1].
                (tipo notNil and: [numero notNil]) ifTrue: [
                    (buscarVuelo value: numero) notNil
                        ifTrue: [informar value: 'Ya existe un vuelo con ese numero.']
                        ifFalse: [
                            origen := pedirTexto value: 'Ciudad de origen'.
                            origen notNil ifTrue: [destino := pedirTexto value: 'Ciudad de destino'].
                            (origen notNil and: [destino notNil]) ifTrue: [fecha := pedirFecha value].
                            (origen notNil and: [destino notNil and: [fecha notNil]])
                                ifTrue: [duracion := pedirEntero value: 'Duracion en minutos' value: 1].
                            (origen notNil and: [destino notNil and: [fecha notNil and: [duracion notNil]]])
                                ifTrue: [precio := pedirPrecio value: 'Precio base'].
                            (origen notNil and: [destino notNil and: [fecha notNil and: [duracion notNil and: [precio notNil]]]])
                                ifTrue: [estado := pedirEstado value].
                            (origen notNil and: [destino notNil and: [fecha notNil and: [duracion notNil and: [precio notNil and: [estado notNil]]]]])
                                ifTrue: [
                                    tipo = 'Nacional'
                                        ifTrue: [
                                            provincia := pedirTexto value: 'Provincia de destino'.
                                            provincia notNil ifTrue: [equipaje := pedirBooleano value: 'Incluye equipaje despachado?'].
                                            (provincia notNil and: [equipaje notNil]) ifTrue: [
                                                vuelo := VueloNacional crear: numero con: duracion con: origen con: destino
                                                    con: fecha con: precio con: estado con: provincia con: equipaje]]
                                        ifFalse: [
                                            pais := pedirTexto value: 'Pais de destino'.
                                            pais notNil ifTrue: [tasa := pedirPrecio value: 'Tasa internacional'].
                                            (pais notNil and: [tasa notNil]) ifTrue: [documentacion := pedirBooleano value: 'Requiere documentacion adicional?'].
                                            (pais notNil and: [tasa notNil and: [documentacion notNil]]) ifTrue: [
                                                vuelo := VueloInternacional crear: numero con: duracion con: origen con: destino
                                                    con: fecha con: precio con: estado con: pais con: tasa con: documentacion]]].
                            vuelo notNil ifTrue: [
                                (cargarVuelo value: vuelo)
                                    ifTrue: [informar value: 'Vuelo cargado.']
                                    ifFalse: [informar value: 'No se pudo cargar: numero repetido o cupo diario completo.']]]]]].


    opcion = '4. Buscar vuelo' ifTrue: [
        | numero vuelo |
        aerolinea isNil
            ifTrue: [informar value: 'Primero debe cargar una aerolinea.']
            ifFalse: [
                numero := pedirEntero value: 'Numero del vuelo a buscar' value: 1.
                numero notNil ifTrue: [
                    vuelo := buscarVuelo value: numero.
                    vuelo isNil
                        ifTrue: [informar value: 'No existe un vuelo con ese numero.']
                        ifFalse: [informar value: (textoVuelo value: vuelo)]]]].

    opcion = '5. Modificar vuelo' ifTrue: [
        | numero vuelo campos campo dato modificacionCorrecta |
        aerolinea isNil
            ifTrue: [informar value: 'Primero debe cargar una aerolinea.']
            ifFalse: [
                numero := pedirEntero value: 'Numero del vuelo a modificar' value: 1.
                numero notNil ifTrue: [
                    vuelo := buscarVuelo value: numero.
                    vuelo isNil
                        ifTrue: [informar value: 'No existe un vuelo con ese numero.']
                        ifFalse: [
                            campos := OrderedCollection new.
                            #('Origen' 'Destino' 'Fecha y hora' 'Duracion' 'Precio base' 'Estado')
                                do: [:campoComun | campos add: campoComun].
                            (vuelo isKindOf: VueloNacional) ifTrue: [
                                #('Provincia de destino' 'Equipaje') do: [:campoNacional | campos add: campoNacional]].
                            (vuelo isKindOf: VueloInternacional) ifTrue: [
                                #('Pais de destino' 'Tasa internacional' 'Documentacion')
                                    do: [:campoInternacional | campos add: campoInternacional]].
                            campo := pedirOpcion value: campos value: 'Dato a modificar'.
                            dato := nil.
                            campo = 'Origen' ifTrue: [dato := pedirTexto value: 'Nueva ciudad de origen'].
                            campo = 'Destino' ifTrue: [dato := pedirTexto value: 'Nueva ciudad de destino'].
                            campo = 'Fecha y hora' ifTrue: [dato := pedirFecha value].
                            campo = 'Duracion' ifTrue: [dato := pedirEntero value: 'Nueva duracion en minutos' value: 1].
                            campo = 'Precio base' ifTrue: [dato := pedirPrecio value: 'Nuevo precio base'].
                            campo = 'Estado' ifTrue: [dato := pedirEstado value].
                            campo = 'Provincia de destino' ifTrue: [dato := pedirTexto value: 'Nueva provincia de destino'].
                            campo = 'Equipaje' ifTrue: [dato := pedirBooleano value: 'Incluye equipaje despachado?'].
                            campo = 'Pais de destino' ifTrue: [dato := pedirTexto value: 'Nuevo pais de destino'].
                            campo = 'Tasa internacional' ifTrue: [dato := pedirPrecio value: 'Nueva tasa internacional'].
                            campo = 'Documentacion' ifTrue: [dato := pedirBooleano value: 'Requiere documentacion adicional?'].
                            modificacionCorrecta := true.
                            dato notNil ifTrue: [
                                campo = 'Fecha y hora'
                                    ifTrue: [modificacionCorrecta := modificarFecha value: vuelo verNumero value: dato]
                                    ifFalse: [
                                        campo = 'Origen' ifTrue: [vuelo modOrigen: dato].
                                        campo = 'Destino' ifTrue: [vuelo modDestino: dato].
                                        campo = 'Duracion' ifTrue: [vuelo modDuracion: dato].
                                        campo = 'Precio base' ifTrue: [vuelo modPrecioBase: dato].
                                        campo = 'Estado' ifTrue: [vuelo modEstado: dato].
                                        campo = 'Provincia de destino' ifTrue: [vuelo modprovDestino: dato].
                                        campo = 'Equipaje' ifTrue: [vuelo modllevaEquipaje: dato].
                                        campo = 'Pais de destino' ifTrue: [vuelo modpaisDestino: dato].
                                        campo = 'Tasa internacional' ifTrue: [vuelo modtasaInter: dato].
                                        campo = 'Documentacion' ifTrue: [vuelo modDocumentacion: dato]].
                                modificacionCorrecta
                                    ifTrue: [informar value: 'Vuelo modificado.']
                                    ifFalse: [informar value: 'No se pudo modificar: el dia solicitado no tiene cupo.']]]]]].

    opcion = '6. Eliminar vuelo' ifTrue: [
        | numero vuelo |
        aerolinea isNil
            ifTrue: [informar value: 'Primero debe cargar una aerolinea.']
            ifFalse: [
                numero := pedirEntero value: 'Numero del vuelo a eliminar' value: 1.
                numero notNil ifTrue: [
                    vuelo := buscarVuelo value: numero.
                    vuelo isNil
                        ifTrue: [informar value: 'No existe un vuelo con ese numero.']
                        ifFalse: [aerolinea verTodos remove: vuelo ifAbsent: []. informar value: 'Vuelo eliminado.']]]].

    opcion = '7. Consultas' ifTrue: [
        | consulta dic texto mayor |
        aerolinea isNil
            ifTrue: [informar value: 'Primero debe cargar una aerolinea.']
            ifFalse: [
                consulta := pedirOpcion value: #(
                    'Todos los vuelos' 'Programados' 'Duracion menor a dos horas' 'Destino'
                    'Precio final promedio' 'Precios superiores al promedio' 'Mayor duracion'
                    'Facturacion potencial' 'Cantidad por estado') value: 'Consultas'.
                consulta = 'Todos los vuelos' ifTrue: [mostrarVuelos value: aerolinea verTodos value: 'Todos los vuelos'].
                consulta = 'Programados' ifTrue: [
                    mostrarVuelos value: (aerolinea verTodos select: [:vuelo | vuelo verEstado = 'Programado'])
                        value: 'Vuelos programados'].
                consulta = 'Duracion menor a dos horas' ifTrue: [
                    mostrarVuelos value: (aerolinea verTodos select: [:vuelo | vuelo verDuracion < 120])
                        value: 'Duracion menor a dos horas'].
                consulta = 'Destino' ifTrue: [
                    | destino |
                    destino := pedirTexto value: 'Ciudad de destino a buscar'.
                    destino notNil ifTrue: [
                        mostrarVuelos value: (aerolinea verTodos select: [:vuelo | vuelo verDestino = destino])
                            value: 'Vuelos a ', destino]].
                consulta = 'Precio final promedio' ifTrue: [
                    informar value: 'Precio final promedio (todos los vuelos): ',
                        (calcularPromedio value) displayString].
                consulta = 'Precios superiores al promedio' ifTrue: [
                    mostrarVuelos value: (vuelosSuperiores value)
                        value: 'Vuelos con precio superior al promedio'].
                consulta = 'Mayor duracion' ifTrue: [
                    mayor := mayorDuracion value.
                    mayor isNil
                        ifTrue: [informar value: 'No hay vuelos cargados.']
                        ifFalse: [informar value: 'Vuelo de mayor duracion', salto, (textoVuelo value: mayor)]].
                consulta = 'Facturacion potencial' ifTrue: [
                    informar value: 'Facturacion potencial de Programados: ', (facturacionPotencial value) displayString].
                consulta = 'Cantidad por estado' ifTrue: [
                    dic := diccionarioEstado value.
                    dic isEmpty
                        ifTrue: [informar value: 'No hay vuelos cargados.']
                        ifFalse: [
                            texto := 'Cantidad de vuelos por estado'.
                            dic keysDo: [:estado |
                                texto := texto, salto, estado, ': ', (dic at: estado) displayString].
                            informar value: texto]]]].

    opcion = '8. Eliminar todos los cancelados' ifTrue: [
        | cancelados cantidad |
        aerolinea isNil
            ifTrue: [informar value: 'Primero debe cargar una aerolinea.']
            ifFalse: [
                cancelados := aerolinea verTodos select: [:vuelo | vuelo verEstado = 'Cancelado'].
                cantidad := cancelados size.
                cancelados do: [:vuelo | aerolinea verTodos remove: vuelo ifAbsent: []].
                informar value: 'Vuelos cancelados eliminados: ', cantidad displayString]]].
