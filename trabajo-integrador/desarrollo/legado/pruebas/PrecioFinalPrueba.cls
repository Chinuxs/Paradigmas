"Pruebas del precio final polimorfico, sin dialogos ni cambios en objetos del menu."!

Object subclass: #PrecioFinalPrueba
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    classInstanceVariableNames: ''!

!PrecioFinalPrueba categoriesForClass!TrabajoIntegrador-Pruebas! !
!PrecioFinalPrueba class methodsFor!

comprobar: unaCondicion mensaje: unMensaje
    unaCondicion ifFalse: [self error: unMensaje]!

ejecutar
    | nacionalConEquipaje nacionalSinEquipaje internacionalConTasa internacionalSinTasa vuelos total vueloBase fallo |

    nacionalConEquipaje := VueloNacional
        crear: 1 con: 90 con: 'La Plata' con: 'Cordoba'
        con: '21/10/2026 10:00' con: 1000 con: 'Programado'
        con: 'Cordoba' con: true.
    self comprobar: (nacionalConEquipaje precioFinal - 1100) abs < 0.000001
        mensaje: 'El nacional con equipaje debe sumar el diez por ciento.'.
    self comprobar: nacionalConEquipaje verPrecioBase = 1000
        mensaje: 'Calcular el precio final no debe modificar el precio base.'.

    nacionalSinEquipaje := VueloNacional
        crear: 2 con: 100 con: 'La Plata' con: 'Rosario'
        con: '21/10/2026 11:00' con: 1000 con: 'Programado'
        con: 'Santa Fe' con: false.
    self comprobar: nacionalSinEquipaje precioFinal = 1000
        mensaje: 'El nacional sin equipaje debe conservar el precio base.'.

    internacionalConTasa := VueloInternacional
        crear: 3 con: 120 con: 'La Plata' con: 'Montevideo'
        con: '21/10/2026 12:00' con: 1000 con: 'Programado'
        con: 'Uruguay' con: 200 con: true.
    self comprobar: internacionalConTasa precioFinal = 1200
        mensaje: 'El internacional debe sumar su tasa al precio base.'.
    self comprobar: internacionalConTasa verPrecioBase = 1000
        mensaje: 'Sumar la tasa no debe modificar el precio base.'.

    internacionalSinTasa := VueloInternacional
        crear: 4 con: 180 con: 'La Plata' con: 'Santiago'
        con: '21/10/2026 13:00' con: 1000 con: 'Programado'
        con: 'Chile' con: 0 con: false.
    self comprobar: internacionalSinTasa precioFinal = 1000
        mensaje: 'Una tasa cero debe conservar el precio base.'.

    vuelos := OrderedCollection new.
    vuelos add: nacionalConEquipaje.
    vuelos add: nacionalSinEquipaje.
    vuelos add: internacionalConTasa.
    vuelos add: internacionalSinTasa.
    total := 0.
    vuelos do: [:unVuelo | total := total + unVuelo precioFinal].
    self comprobar: (total - 4300) abs < 0.000001
        mensaje: 'La coleccion mezclada debe usar el mismo mensaje para cada tipo.'.

    nacionalConEquipaje modllevaEquipaje: false.
    self comprobar: nacionalConEquipaje precioFinal = 1000
        mensaje: 'Cambiar el equipaje debe actualizar el precio final.'.

    internacionalConTasa modtasaInter: 350.
    self comprobar: internacionalConTasa precioFinal = 1350
        mensaje: 'Cambiar la tasa debe actualizar el precio final.'.
    internacionalConTasa modPrecioBase: 2000.
    self comprobar: internacionalConTasa precioFinal = 2350
        mensaje: 'Cambiar el precio base debe actualizar el precio final.'.

    nacionalSinEquipaje modPrecioBase: 0.
    nacionalSinEquipaje modllevaEquipaje: true.
    self comprobar: nacionalSinEquipaje precioFinal = 0
        mensaje: 'Un precio base cero con equipaje debe seguir siendo cero.'.

    vueloBase := Vuelo
        crear: 5 con: 90 con: 'La Plata' con: 'Cordoba'
        con: '21/10/2026 14:00' con: 1000 con: 'Programado'.
    self comprobar: vueloBase class == Vuelo
        mensaje: 'No se debe bloquear la creacion directa de Vuelo.'.
    fallo := nil.
    [vueloBase precioFinal] on: Error do: [:error | fallo := error].
    self comprobar: fallo notNil
        mensaje: 'El precio final de Vuelo debe exigir una implementacion de subclase.'.
    self comprobar: fallo displayString = '#precioFinal is the responsibility of the subclass'
        mensaje: 'Debe fallar por responsabilidad de subclase, no por otro error.'.
    ^9! !

!PrecioFinalPrueba class categoriesFor: #comprobar:mensaje:!private! !
!PrecioFinalPrueba class categoriesFor: #ejecutar!public! !
