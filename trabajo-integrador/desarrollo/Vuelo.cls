"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Vuelo
	instanceVariableNames: 'numero duracion origen destino fecha precioBase estado hora'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Vuelo guid: (GUID fromString: '{0779A1CF-1A13-4E35-A45C-269799C98DB9}')!
Vuelo comment: ''!
!Vuelo categoriesForClass!Kernel-Objects! !
!Vuelo methodsFor!

init:unNum dura:unDura ori:unOri des:unDes fech:unFech hor:unHor preb:unpreBa est:unEst
numero:= unNum.
duracion:=unDura.
origen:=unOri.
destino:=unDes.
fecha:=unFech.
hora:=unHor.
precioBase:=unpreBa.
estado:=unEst.
!

modDestino: otroDes
destino:= otroDes.!

modDuracion: otroDura
duracion:=otroDura.!

modEstado: otroEst
estado:= otroEst.!

modFecha: otroFech
fecha:= otroFech.!

modHora: otroHor
hora:= otroHor.!

modNumero: otroNum
numero :=otroNum.!

modOrigen: otroOri
origen:= otroOri.!

modPrecioBase: otropreBa
precioBase:=  otropreBa.!

precioFinal
  ^self subclassResponsibility!

verDestino
  ^destino!

verDuracion
  ^duracion!

verEstado
^estado!

verFecha
^fecha!

verHora
^hora!

verNumero
^numero!

verOrigen
^origen!

verPrecioBase
^precioBase! !
!Vuelo categoriesFor: #init:dura:ori:des:fech:hor:preb:est:!public! !
!Vuelo categoriesFor: #modDestino:!public! !
!Vuelo categoriesFor: #modDuracion:!public! !
!Vuelo categoriesFor: #modEstado:!public! !
!Vuelo categoriesFor: #modFecha:!public! !
!Vuelo categoriesFor: #modHora:!public! !
!Vuelo categoriesFor: #modNumero:!public! !
!Vuelo categoriesFor: #modOrigen:!public! !
!Vuelo categoriesFor: #modPrecioBase:!public! !
!Vuelo categoriesFor: #precioFinal!public! !
!Vuelo categoriesFor: #verDestino!public! !
!Vuelo categoriesFor: #verDuracion!public! !
!Vuelo categoriesFor: #verEstado!public! !
!Vuelo categoriesFor: #verFecha!public! !
!Vuelo categoriesFor: #verHora!public! !
!Vuelo categoriesFor: #verNumero!public! !
!Vuelo categoriesFor: #verOrigen!public! !
!Vuelo categoriesFor: #verPrecioBase!public! !

!Vuelo class methodsFor!

crear:unNum con:unDura con:unOri con:unDes con:unFech con:unHor con:unpreBa con:unEst
^self new init:unNum dura:unDura ori:unOri des:unDes fech:unFech hor:unHor preb:unpreBa est:unEst  ! !
!Vuelo class categoriesFor: #crear:con:con:con:con:con:con:con:!public! !

