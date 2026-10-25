"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Aerolinea
	instanceVariableNames: 'nomAero anioFundacion paisdeOrigen codigoId cantVuelosMaxDia vuelos'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Aerolinea guid: (GUID fromString: '{D316AFB3-E84F-499C-BC1F-D766E0E1A38C}')!
Aerolinea comment: 'Objeto de datos de la aerolinea. La logica de vuelos y la interfaz estan en el Workspace AplicacionAerolinea.st.'!
!Aerolinea categoriesForClass!Kernel-Objects! !
!Aerolinea methodsFor!

agregar: unVue
    vuelos add: unVue!

buscarPorNumero: unNum
    ^vuelos detect: [:v | v verNumero = unNum] ifNone: [nil]!

calcularFacturacionTotal
    | total |
    total := 0.
    self listarProgramados do: [:v | total := total + v precioFinal].
    ^total!

calcularPrecioPromedio
    | total |
    vuelos isEmpty ifTrue: [^0].
    total := 0.
    vuelos do: [:v | total := total + v precioFinal].
    ^total / vuelos size!

cargar: unVue
    | diaDeSalida cantidadDelDia |
    (self buscarPorNumero: unVue verNumero) notNil ifTrue: [^false].

    diaDeSalida := unVue verFecha.

    cantidadDelDia := (vuelos select: [:v |
        v verFecha = diaDeSalida]) size.

    cantidadDelDia >= cantVuelosMaxDia ifTrue: [^false].

    self agregar: unVue.
    ^true!

conocerVueloMayorDuracion
    | mayor |
    vuelos isEmpty ifTrue: [^nil].
    mayor := vuelos first.
    vuelos do: [:v | v verDuracion > mayor verDuracion ifTrue: [mayor := v]].
    ^mayor!

eliminar: unVue
    vuelos remove: unVue ifAbsent: [^nil]!

eliminarTodosLosCancelados
    | cancelados |
    cancelados := vuelos select: [:v | v verEstado = 'Cancelado'].
    cancelados do: [:v | self eliminar: v].
    ^self!

filtrarSegunDestino: unDestino
    ^vuelos select: [:v | v verDestino = unDestino]!

guardarEnDiccionarioVuelosPorEstado
    | dic estados |
    estados := vuelos collect: [:v | v verEstado].
    dic := Dictionary new.
    estados asSet do: [:unEstado |
        dic at: unEstado put: (estados occurrencesOf: unEstado)].
    ^dic!

init: unNomAero anio: unAnio pais: unPaisOr cod: unCod cant: unCantVM
    nomAero := unNomAero.
    anioFundacion := unAnio.
    paisdeOrigen := unPaisOr.
    codigoId := unCod.
    cantVuelosMaxDia := unCantVM.
    vuelos := OrderedCollection new.
    ^self!

listarDuracionMenorA2Horas
    ^vuelos select: [:v | v verDuracion < 120]!

listarProgramados
    ^vuelos select: [:v | v verEstado = 'Programado']!

modanioFundacion: otroAnio
    anioFundacion := otroAnio!

modcantVuelosMaxDia: otroCantVM
    cantVuelosMaxDia := otroCantVM!

modcodigoId: otroCod
    codigoId := otroCod!

modificarFechaDeVuelo: unNumero a: otraFecha
    | vuelo diaDeSalida cantidadDelDia |
    vuelo := self buscarPorNumero: unNumero.
    vuelo isNil ifTrue: [^false].
    diaDeSalida := otraFecha copyFrom: 1 to: 10.
    cantidadDelDia := (vuelos select: [:v |
        (v verNumero ~= unNumero) &
            ((v verFecha copyFrom: 1 to: 10) = diaDeSalida)]) size.
    cantidadDelDia >= cantVuelosMaxDia ifTrue: [^false].
    vuelo modFecha: otraFecha.
    ^true!

modnomAero: otroNomAero
    nomAero := otroNomAero!

modpaisdeOrigen: otroPaisOr
    paisdeOrigen := otroPaisOr!

modVuelos: unosVuelos
    vuelos := unosVuelos!

mostrarVuelosConPrecioSuperiorAlPromedio
    | promedio |
    promedio := self calcularPrecioPromedio.
    ^vuelos select: [:v | v precioFinal > promedio]!

tamanio
    ^vuelos size!

veranioFundacion
    ^anioFundacion!

vercantVuelosMaxDia
    ^cantVuelosMaxDia!

vercodigoId
    ^codigoId!

vernomAero
    ^nomAero!

verpaisdeOrigen
    ^paisdeOrigen!

verTodos
^vuelos!

vuelosDisponibles
    ^vuelos select: [:v | #('Programado' 'Demorado') includes: v verEstado]! !
!Aerolinea categoriesFor: #agregar:!public! !
!Aerolinea categoriesFor: #buscarPorNumero:!public! !
!Aerolinea categoriesFor: #calcularFacturacionTotal!public! !
!Aerolinea categoriesFor: #calcularPrecioPromedio!public! !
!Aerolinea categoriesFor: #cargar:!public! !
!Aerolinea categoriesFor: #conocerVueloMayorDuracion!public! !
!Aerolinea categoriesFor: #eliminar:!public! !
!Aerolinea categoriesFor: #eliminarTodosLosCancelados!public! !
!Aerolinea categoriesFor: #filtrarSegunDestino:!public! !
!Aerolinea categoriesFor: #guardarEnDiccionarioVuelosPorEstado!public! !
!Aerolinea categoriesFor: #init:anio:pais:cod:cant:!public! !
!Aerolinea categoriesFor: #listarDuracionMenorA2Horas!public! !
!Aerolinea categoriesFor: #listarProgramados!public! !
!Aerolinea categoriesFor: #modanioFundacion:!public! !
!Aerolinea categoriesFor: #modcantVuelosMaxDia:!public! !
!Aerolinea categoriesFor: #modcodigoId:!public! !
!Aerolinea categoriesFor: #modificarFechaDeVuelo:a:!public! !
!Aerolinea categoriesFor: #modnomAero:!public! !
!Aerolinea categoriesFor: #modpaisdeOrigen:!public! !
!Aerolinea categoriesFor: #modVuelos:!public! !
!Aerolinea categoriesFor: #mostrarVuelosConPrecioSuperiorAlPromedio!public! !
!Aerolinea categoriesFor: #tamanio!public! !
!Aerolinea categoriesFor: #veranioFundacion!public! !
!Aerolinea categoriesFor: #vercantVuelosMaxDia!public! !
!Aerolinea categoriesFor: #vercodigoId!public! !
!Aerolinea categoriesFor: #vernomAero!public! !
!Aerolinea categoriesFor: #verpaisdeOrigen!public! !
!Aerolinea categoriesFor: #verTodos!public! !
!Aerolinea categoriesFor: #vuelosDisponibles!public! !

!Aerolinea class methodsFor!

crear: unNom con: unAnio con: unPaisOr con: unCod con: unCant
    ^self new
        init: unNom anio: unAnio pais: unPaisOr cod: unCod cant: unCant! !
!Aerolinea class categoriesFor: #crear:con:con:con:con:!public! !

