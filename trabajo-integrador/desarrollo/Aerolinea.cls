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

init: unNomAero anio: unAnio pais: unPaisOr cod: unCod cant: unCantVM
    nomAero := unNomAero.
    anioFundacion := unAnio.
    paisdeOrigen := unPaisOr.
    codigoId := unCod.
    cantVuelosMaxDia := unCantVM.
    vuelos := OrderedCollection new.
    ^self!

modanioFundacion: otroAnio
    anioFundacion := otroAnio!

modcantVuelosMaxDia: otroCantVM
    cantVuelosMaxDia := otroCantVM!

modcodigoId: otroCod
    codigoId := otroCod!

modnomAero: otroNomAero
    nomAero := otroNomAero!

modpaisdeOrigen: otroPaisOr
    paisdeOrigen := otroPaisOr!

modVuelos: unosVuelos
    vuelos := unosVuelos!

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
    ^vuelos! !

!Aerolinea categoriesFor: #init:anio:pais:cod:cant:!public! !
!Aerolinea categoriesFor: #modanioFundacion:!public! !
!Aerolinea categoriesFor: #modcantVuelosMaxDia:!public! !
!Aerolinea categoriesFor: #modcodigoId:!public! !
!Aerolinea categoriesFor: #modnomAero:!public! !
!Aerolinea categoriesFor: #modpaisdeOrigen:!public! !
!Aerolinea categoriesFor: #modVuelos:!public! !
!Aerolinea categoriesFor: #veranioFundacion!public! !
!Aerolinea categoriesFor: #vercantVuelosMaxDia!public! !
!Aerolinea categoriesFor: #vercodigoId!public! !
!Aerolinea categoriesFor: #vernomAero!public! !
!Aerolinea categoriesFor: #verpaisdeOrigen!public! !
!Aerolinea categoriesFor: #verTodos!public! !

!Aerolinea class methodsFor!

crear: unNom con: unAnio con: unPaisOr con: unCod con: unCant
    ^self new
        init: unNom anio: unAnio pais: unPaisOr cod: unCod cant: unCant! !
!Aerolinea class categoriesFor: #crear:con:con:con:con:!public! !
