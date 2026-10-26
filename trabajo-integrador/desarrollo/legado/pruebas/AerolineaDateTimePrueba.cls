"Pruebas iniciales para la variante con Date y Time. Importar despues de las cuatro clases del modelo."!

Object subclass: #AerolineaDateTimePrueba
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    classInstanceVariableNames: ''!

!AerolineaDateTimePrueba categoriesForClass!TrabajoIntegrador-Pruebas! !
!AerolineaDateTimePrueba class methodsFor!

comprobar: unaCondicion mensaje: unMensaje
    unaCondicion ifFalse: [self error: unMensaje]!

fecha: unDia hora: unaHora minuto: unMinuto
    ^Array with: (Date newDay: unDia monthIndex: 10 year: 2026)
        with: (Time fromMilliseconds: ((unaHora * 60 + unMinuto) * 60000))!

crearNacional: unNumero fechaHora: unaFechaHora estado: unEstado
    ^VueloNacional crear: unNumero
        con: 90 con: 'La Plata' con: 'Cordoba'
        con: (unaFechaHora at: 1) con: (unaFechaHora at: 2)
        con: 100 con: unEstado con: 'Cordoba' con: false!

crearInternacional: unNumero fechaHora: unaFechaHora estado: unEstado
    ^VueloInternacional crear: unNumero
        con: 120 con: 'La Plata' con: 'Montevideo'
        con: (unaFechaHora at: 1) con: (unaFechaHora at: 2)
        con: 100 con: unEstado con: 'Uruguay' con: 50 con: true!

crearAerolineaConMaximo: unMaximo
    ^Aerolinea crear: 'UTN Air' con: 2000 con: 'Argentina' con: 'UTN' con: unMaximo!

probarTiposFechaYHora
    | vuelo fechaHora |
    fechaHora := self fecha: 21 hora: 10 minuto: 30.
    vuelo := self crearNacional: 1 fechaHora: fechaHora estado: 'Programado'.
    self comprobar: vuelo verFecha = (fechaHora at: 1) mensaje: 'Debe conservar un objeto Date.'.
    self comprobar: vuelo verHora = (fechaHora at: 2) mensaje: 'Debe conservar un objeto Time.'.
    self comprobar: vuelo verDuracion = 90 mensaje: 'La duracion debe estar expresada en minutos.'!

probarCargaPorDia
    | aerolinea primero segundo tercero otroDia |
    aerolinea := self crearAerolineaConMaximo: 2.
    primero := self crearNacional: 1 fechaHora: (self fecha: 21 hora: 0 minuto: 1) estado: 'Programado'.
    segundo := self crearInternacional: 2 fechaHora: (self fecha: 21 hora: 23 minuto: 59) estado: 'Demorado'.
    tercero := self crearNacional: 3 fechaHora: (self fecha: 21 hora: 12 minuto: 0) estado: 'Programado'.
    otroDia := self crearNacional: 4 fechaHora: (self fecha: 22 hora: 10 minuto: 0) estado: 'Programado'.
    self comprobar: (aerolinea cargar: primero) mensaje: 'Debe aceptar el primer vuelo del dia.'.
    self comprobar: (aerolinea cargar: segundo) mensaje: 'Debe aceptar otra hora del mismo dia.'.
    self comprobar: (aerolinea cargar: tercero) not mensaje: 'Debe rechazar el exceso diario.'.
    self comprobar: (aerolinea cargar: otroDia) mensaje: 'El dia siguiente debe tener cupo independiente.'.
    self comprobar: aerolinea tamanio = 3 mensaje: 'Debe conservar los vuelos aceptados.'.!

probarNumeroUnico
    | aerolinea primero repetido fecha |
    aerolinea := self crearAerolineaConMaximo: 3.
    fecha := self fecha: 21 hora: 10 minuto: 0.
    primero := self crearNacional: 1 fechaHora: fecha estado: 'Programado'.
    repetido := self crearInternacional: 1 fechaHora: (self fecha: 22 hora: 10 minuto: 0) estado: 'Programado'.
    self comprobar: (aerolinea cargar: primero) mensaje: 'Debe aceptar el primer numero.'.
    self comprobar: (aerolinea cargar: repetido) not mensaje: 'El numero debe ser unico entre fechas.'.
    self comprobar: aerolinea tamanio = 1 mensaje: 'El duplicado no debe mutar la coleccion.'.!

probarModificacionFechaYHora
    | aerolinea vuelo otroFecha nuevaFecha |
    aerolinea := self crearAerolineaConMaximo: 1.
    vuelo := self crearNacional: 1 fechaHora: (self fecha: 21 hora: 10 minuto: 0) estado: 'Programado'.
    nuevaFecha := self fecha: 22 hora: 23 minuto: 59.
    otroFecha := self fecha: 21 hora: 12 minuto: 0.
    self comprobar: (aerolinea cargar: vuelo) mensaje: 'Debe cargar el vuelo.'.
    self comprobar: (aerolinea modificarFechaDeVuelo: 1 a: nuevaFecha) mensaje: 'Debe aceptar un dia libre.'.
    self comprobar: vuelo verFecha = (nuevaFecha at: 1) mensaje: 'Debe modificar el Date.'.
    self comprobar: vuelo verHora = (nuevaFecha at: 2) mensaje: 'Debe modificar el Time.'.
    self comprobar: (aerolinea modificarFechaDeVuelo: 1 a: otroFecha) mensaje: 'Debe permitir volver a un dia libre.'.
    self comprobar: vuelo verFecha = (otroFecha at: 1) mensaje: 'Debe conservar el nuevo Date.'.!

probarConsultas
    | aerolinea corto largo cancelado |
    aerolinea := self crearAerolineaConMaximo: 5.
    corto := self crearNacional: 1 fechaHora: (self fecha: 21 hora: 10 minuto: 0) estado: 'Programado'.
    largo := self crearInternacional: 2 fechaHora: (self fecha: 22 hora: 10 minuto: 0) estado: 'Demorado'.
    cancelado := self crearNacional: 3 fechaHora: (self fecha: 23 hora: 10 minuto: 0) estado: 'Cancelado'.
    aerolinea agregar: corto; agregar: largo; agregar: cancelado.
    self comprobar: (aerolinea listarDuracionMenorA2Horas includes: corto) mensaje: 'Debe listar duraciones menores a 120 minutos.'.
    self comprobar: (aerolinea listarDuracionMenorA2Horas includes: largo) not mensaje: '120 minutos no debe ingresar al filtro.'.
    self comprobar: aerolinea vuelosDisponibles size = 2 mensaje: 'Debe incluir Programado y Demorado.'.
    self comprobar: aerolinea conocerVueloMayorDuracion == largo mensaje: 'Debe encontrar el vuelo de mayor duracion.'.!

probarPreciosEstadosYBajas
    | aerolinea nacional internacional cancelado diccionario |
    aerolinea := self crearAerolineaConMaximo: 5.
    nacional := self crearNacional: 1 fechaHora: (self fecha: 21 hora: 10 minuto: 0) estado: 'Programado'.
    internacional := self crearInternacional: 2 fechaHora: (self fecha: 22 hora: 10 minuto: 0) estado: 'Programado'.
    cancelado := self crearNacional: 3 fechaHora: (self fecha: 23 hora: 10 minuto: 0) estado: 'Cancelado'.
    nacional modPrecioBase: 1000.
    nacional modllevaEquipaje: true.
    self comprobar: nacional precioFinal = 1100 mensaje: 'El nacional debe sumar el diez por ciento con equipaje.'.
    self comprobar: internacional precioFinal = 150 mensaje: 'El internacional debe sumar la tasa fija.'.
    aerolinea agregar: nacional; agregar: internacional; agregar: cancelado.
    self comprobar: aerolinea vuelosDisponibles size = 2 mensaje: 'Debe contar Programado y excluir Cancelado.'.
    diccionario := aerolinea guardarEnDiccionarioVuelosPorEstado.
    self comprobar: (diccionario at: 'Programado') = 2 mensaje: 'Debe contar los vuelos programados.'.
    self comprobar: (diccionario at: 'Cancelado') = 1 mensaje: 'Debe contar los vuelos cancelados.'.
    aerolinea eliminarTodosLosCancelados.
    self comprobar: aerolinea tamanio = 2 mensaje: 'Debe eliminar todos los cancelados.'.
    self comprobar: (aerolinea buscarPorNumero: 3) isNil mensaje: 'El cancelado eliminado no debe seguir disponible.'!

probarLimitesDeDuracion
    | aerolinea menor igual mayor |
    aerolinea := self crearAerolineaConMaximo: 5.
    menor := self crearNacional: 1 fechaHora: (self fecha: 21 hora: 10 minuto: 0) estado: 'Programado'.
    igual := self crearNacional: 2 fechaHora: (self fecha: 22 hora: 10 minuto: 0) estado: 'Programado'.
    mayor := self crearNacional: 3 fechaHora: (self fecha: 23 hora: 10 minuto: 0) estado: 'Programado'.
    menor modDuracion: 119.
    igual modDuracion: 120.
    mayor modDuracion: 121.
    aerolinea agregar: menor; agregar: igual; agregar: mayor.
    self comprobar: aerolinea listarDuracionMenorA2Horas size = 1 mensaje: 'Solo 119 minutos debe entrar al filtro.'.
    self comprobar: aerolinea conocerVueloMayorDuracion == mayor mensaje: 'Debe devolver el mayor de 121 minutos.'!

probarRechazoYCuposEntreFechas
    | aerolinea vuelo ocupado original destino coleccion |
    aerolinea := self crearAerolineaConMaximo: 1.
    original := self fecha: 21 hora: 10 minuto: 0.
    destino := self fecha: 22 hora: 23 minuto: 59.
    vuelo := self crearNacional: 1 fechaHora: original estado: 'Programado'.
    ocupado := self crearInternacional: 2 fechaHora: destino estado: 'Cancelado'.
    aerolinea cargar: vuelo; cargar: ocupado.
    coleccion := aerolinea verTodos.
    self comprobar: (aerolinea modificarFechaDeVuelo: 1 a: destino) not mensaje: 'Cancelados tambien ocupan cupo.'.
    self comprobar: (vuelo verFecha = original first and: [vuelo verHora = (original at: 2)]) mensaje: 'Rechazo debe conservar fecha y hora.'.
    self comprobar: (aerolinea modificarFechaDeVuelo: 1 a: (self fecha: 21 hora: 23 minuto: 59)) mensaje: 'Cambiar solo la hora conserva plaza.'.
    self comprobar: (aerolinea modificarFechaDeVuelo: 99 a: destino) not mensaje: 'Numero inexistente debe devolver false.'.
    destino := Array with: (Date newDay: 21 monthIndex: 11 year: 2026) with: original last.
    self comprobar: (aerolinea modificarFechaDeVuelo: 1 a: destino) mensaje: 'Otro mes tiene cupo propio.'.
    destino := Array with: (Date newDay: 21 monthIndex: 11 year: 2027) with: original last.
    self comprobar: (aerolinea modificarFechaDeVuelo: 1 a: destino) mensaje: 'Otro anio tiene cupo propio.'.
    self comprobar: (aerolinea verTodos == coleccion and: [coleccion first == vuelo]) mensaje: 'Editar conserva referencias y orden.'.
    aerolinea := self crearAerolineaConMaximo: 0.
    self comprobar: (aerolinea cargar: vuelo) not mensaje: 'Cupo cero rechaza la carga.'!

ejecutar
    self probarTiposFechaYHora.
    self probarCargaPorDia.
    self probarNumeroUnico.
    self probarModificacionFechaYHora.
    self probarConsultas.
    self probarPreciosEstadosYBajas.
    self probarLimitesDeDuracion.
    self probarRechazoYCuposEntreFechas.
    ^'OK'!

!AerolineaDateTimePrueba class categoriesFor: #comprobar:mensaje:!private! !
!AerolineaDateTimePrueba class categoriesFor: #fecha:hora:minuto:!private! !
!AerolineaDateTimePrueba class categoriesFor: #crearNacional:fechaHora:estado:!private! !
!AerolineaDateTimePrueba class categoriesFor: #crearInternacional:fechaHora:estado:!private! !
!AerolineaDateTimePrueba class categoriesFor: #crearAerolineaConMaximo:!private! !
!AerolineaDateTimePrueba class categoriesFor: #probarTiposFechaYHora!private! !
!AerolineaDateTimePrueba class categoriesFor: #probarCargaPorDia!private! !
!AerolineaDateTimePrueba class categoriesFor: #probarNumeroUnico!private! !
!AerolineaDateTimePrueba class categoriesFor: #probarModificacionFechaYHora!private! !
!AerolineaDateTimePrueba class categoriesFor: #probarConsultas!private! !
!AerolineaDateTimePrueba class categoriesFor: #probarPreciosEstadosYBajas!private! !
!AerolineaDateTimePrueba class categoriesFor: #probarLimitesDeDuracion!private! !
!AerolineaDateTimePrueba class categoriesFor: #ejecutar!public! !
!AerolineaDateTimePrueba class categoriesFor: #probarRechazoYCuposEntreFechas!private! !
