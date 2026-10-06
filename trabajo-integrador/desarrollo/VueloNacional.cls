"Filed out from Dolphin Smalltalk 7"!

Vuelo subclass: #VueloNacional
	instanceVariableNames: 'provDestino llevaEquipaje'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
VueloNacional guid: (GUID fromString: '{57983F98-1F3C-474B-8EF7-538A0AC02788}')!
VueloNacional comment: ''!
!VueloNacional categoriesForClass!Kernel-Objects! !
!VueloNacional methodsFor!

init: unNum dura: unDura ori: unOri des: unDes fech: unFech preb: unPreBa est: unEst provDes: unprovDes llevaEquip: unllevaEquip
    super init: unNum dura: unDura ori: unOri des: unDes fech: unFech preb: unPreBa est: unEst.
     provDestino:= unprovDes.
     llevaEquipaje:= unllevaEquip.  
    ^self!

modllevaEquipaje: otrollevaEquip
llevaEquipaje:= otrollevaEquip.!

modprovDestino: otroprovDes
provDestino:= otroprovDes.!

precioFinalNac
      llevaEquipaje ifTrue: [^precioBase *1.10] 
                           ifFalse:[^precioBase ] 
         !

verllevaEquipaje
^llevaEquipaje!

verprovDestino
^provDestino! !
!VueloNacional categoriesFor: #init:dura:ori:des:fech:preb:est:provDes:llevaEquip:!public! !
!VueloNacional categoriesFor: #modllevaEquipaje:!public! !
!VueloNacional categoriesFor: #modprovDestino:!public! !
!VueloNacional categoriesFor: #precioFinalNac!public! !
!VueloNacional categoriesFor: #verllevaEquipaje!public! !
!VueloNacional categoriesFor: #verprovDestino!public! !

