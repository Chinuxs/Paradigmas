"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Aerolinea
	instanceVariableNames: 'nomAero anioFundacion paisdeOrigen codigoId cantVuelosMaxDia vuelos'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Aerolinea guid: (GUID fromString: '{D316AFB3-E84F-499C-BC1F-D766E0E1A38C}')!
Aerolinea comment: ''!
!Aerolinea categoriesForClass!Kernel-Objects! !
!Aerolinea methodsFor!

agregar: unVue
vuelos add: unVue. 
!

eliminar: unVue
vuelos remove:  unVue ifAbsent:[^nil].  

!

esVacio
^vuelos isEmpty. 

!

existe: unVue
^vuelos includes: unVue.
!

init: unNomAero anio: unAnio pais: unPaisOr cod: unCod cant: unCantVM
nomAero := unNomAero.
anioFundacion := unAnio.
paisdeOrigen := unPaisOr.
codigoId := unCod.
cantVuelosMaxDia := unCantVM.
vuelos := OrderedCollection new.
^self 

!

modanioFundacion:otroAnio

anioFundacion:=otroAnio.

!

modcantVuelosMaxDia:otroCantVM

cantVuelosMaxDia:=otroCantVM.
!

modcodigoId:otroCod

codigoId:=otroCod.
!

modnomAero:otroNomAero

nomAero:=otroNomAero.
!

modpaisdeOrigen:otroPaisOr

paisdeOrigen:=otroPaisOr.

!

recuperar: i
^vuelos at: i.

!

tamanio
^vuelos size.

!

veranioFundacion
^anioFundacion

!

vercantVuelosMaxDia
^cantVuelosMaxDia

!

vercodigoId
^codigoId

!

vernomAero
^nomAero


!

verpaisdeOrigen
^paisdeOrigen

!

verTodos
^vuelos. 
"faltan los metodos que deberia cumplir la aerolinea, como :
-cargarsinosuperacantidadMax
-buscarvueloporNumparamodificaroeliminar
-listarprogramados
-listarduracionmenora2(dos)horas
-filtrarsegundestino
-calcularpreciopromdevuelosdisponibles
-mostrarvuelosconpreciosuperioralpromedio
-conocervuelomayorduracion
-calcularfacturaciontotal
-eliminartodosloscancelados
-guardarendiccionariovuelosporestado"! !
!Aerolinea categoriesFor: #agregar:!public! !
!Aerolinea categoriesFor: #eliminar:!public! !
!Aerolinea categoriesFor: #esVacio!public! !
!Aerolinea categoriesFor: #existe:!public! !
!Aerolinea categoriesFor: #init:anio:pais:cod:cant:!public! !
!Aerolinea categoriesFor: #modanioFundacion:!public! !
!Aerolinea categoriesFor: #modcantVuelosMaxDia:!public! !
!Aerolinea categoriesFor: #modcodigoId:!public! !
!Aerolinea categoriesFor: #modnomAero:!public! !
!Aerolinea categoriesFor: #modpaisdeOrigen:!public! !
!Aerolinea categoriesFor: #recuperar:!public! !
!Aerolinea categoriesFor: #tamanio!public! !
!Aerolinea categoriesFor: #veranioFundacion!public! !
!Aerolinea categoriesFor: #vercantVuelosMaxDia!public! !
!Aerolinea categoriesFor: #vercodigoId!public! !
!Aerolinea categoriesFor: #vernomAero!public! !
!Aerolinea categoriesFor: #verpaisdeOrigen!public! !
!Aerolinea categoriesFor: #verTodos!public! !

