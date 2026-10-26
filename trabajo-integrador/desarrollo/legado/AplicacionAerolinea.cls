"Archivo legado; no importar ni usar. La aplicacion se ejecuta desde AplicacionAerolinea.st."!

Object subclass: #AplicacionAerolinea
    instanceVariableNames: 'aerolinea continuar'
    classVariableNames: ''
    poolDictionaries: ''
    classInstanceVariableNames: ''!

AplicacionAerolinea guid: (GUID fromString: '{1C0A7CD0-8AF4-424B-9681-65F8D04CAA97}')!
AplicacionAerolinea comment: 'LEGADO. No importar ni usar; la logica y la interfaz viven en el Workspace AplicacionAerolinea.st.'!

!AplicacionAerolinea categoriesForClass!TrabajoIntegrador! !
!AplicacionAerolinea methodsFor!

init
    aerolinea := nil.
    continuar := false.
    ^self!

modAerolinea: otraAerolinea
    aerolinea := otraAerolinea.
    ^self!

verAerolinea
    ^aerolinea! !

!AplicacionAerolinea categoriesFor: #init!public! !
!AplicacionAerolinea categoriesFor: #modAerolinea:!public! !
!AplicacionAerolinea categoriesFor: #verAerolinea!public! !

!AplicacionAerolinea class methodsFor!

crear
    ^(super new) init! !

!AplicacionAerolinea class categoriesFor: #crear!public! !
