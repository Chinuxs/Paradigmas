"Pruebas de carga, edicion de fecha, consultas y bajas de Aerolinea, sin dialogos ni objetos del usuario."!

Object subclass: #AerolineaPrueba
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    classInstanceVariableNames: ''!

!AerolineaPrueba categoriesForClass!TrabajoIntegrador-Pruebas! !
!AerolineaPrueba class methodsFor!

comprobar: unaCondicion mensaje: unMensaje
    unaCondicion ifFalse: [self error: unMensaje]!

crearAerolinea
    ^Aerolinea crear: 'UTN Air' con: 2000 con: 'Argentina' con: 'UTN' con: 10!

crearNacional: unNumero duracion: unaDuracion destino: unDestino precio: unPrecio estado: unEstado equipaje: unEquipaje
    ^VueloNacional
        crear: unNumero con: unaDuracion con: 'La Plata' con: unDestino
        con: '21/10/2026 10:00' con: unPrecio con: unEstado
        con: 'Buenos Aires' con: unEquipaje!

crearInternacional: unNumero duracion: unaDuracion precio: unPrecio tasa: unaTasa estado: unEstado
    ^VueloInternacional
        crear: unNumero con: unaDuracion con: 'La Plata' con: 'Montevideo'
        con: '21/10/2026 11:00' con: unPrecio con: unEstado
        con: 'Uruguay' con: unaTasa con: true!

probarVacia
    | aerolinea coleccion |
    aerolinea := self crearAerolinea.
    coleccion := aerolinea verTodos.
    self comprobar: (aerolinea buscarPorNumero: 1) isNil mensaje: 'La busqueda vacia debe devolver nil.'.
    self comprobar: aerolinea listarProgramados isEmpty mensaje: 'No debe haber programados.'.
    self comprobar: aerolinea listarDuracionMenorA2Horas isEmpty mensaje: 'El listado corto debe estar vacio.'.
    self comprobar: (aerolinea filtrarSegunDestino: 'Cordoba') isEmpty mensaje: 'El filtro vacio debe estar vacio.'.
    self comprobar: aerolinea vuelosDisponibles isEmpty mensaje: 'No debe haber disponibles.'.
    self comprobar: aerolinea calcularPrecioPromedio = 0 mensaje: 'El promedio vacio debe ser cero.'.
    self comprobar: aerolinea mostrarVuelosConPrecioSuperiorAlPromedio isEmpty mensaje: 'No debe haber precios superiores.'.
    self comprobar: aerolinea conocerVueloMayorDuracion isNil mensaje: 'El mayor vacio debe ser nil.'.
    self comprobar: aerolinea calcularFacturacionTotal = 0 mensaje: 'La facturacion vacia debe ser cero.'.
    self comprobar: aerolinea guardarEnDiccionarioVuelosPorEstado isEmpty mensaje: 'El diccionario vacio debe estar vacio.'.
    self comprobar: aerolinea eliminarTodosLosCancelados == aerolinea mensaje: 'La baja debe devolver la aerolinea.'.
    self comprobar: aerolinea verTodos == coleccion mensaje: 'La baja vacia debe conservar la coleccion.'!

probarBusqueda
    | aerolinea primero segundo encontrado |
    aerolinea := self crearAerolinea.
    primero := self crearNacional: 1 duracion: 90 destino: 'Cordoba' precio: 100 estado: 'Programado' equipaje: false.
    segundo := self crearInternacional: 2 duracion: 120 precio: 100 tasa: 50 estado: 'Demorado'.
    aerolinea agregar: primero; agregar: segundo.
    encontrado := aerolinea buscarPorNumero: 2.
    self comprobar: encontrado == segundo mensaje: 'Buscar debe devolver el mismo vuelo, no una copia.'.
    encontrado modDestino: 'Santiago'.
    self comprobar: (aerolinea buscarPorNumero: 2) verDestino = 'Santiago' mensaje: 'La modificacion debe afectar al vuelo almacenado.'.
    self comprobar: (aerolinea buscarPorNumero: 99) isNil mensaje: 'Un numero inexistente debe devolver nil.'.
    aerolinea eliminar: encontrado.
    self comprobar: (aerolinea buscarPorNumero: 2) isNil mensaje: 'El vuelo encontrado debe poder eliminarse.'.
    self comprobar: (aerolinea buscarPorNumero: 1) == primero mensaje: 'Eliminar otro vuelo debe conservar el primero.'!

probarListados
    | aerolinea corto frontera demorado finalizado cancelado seleccion coleccion |
    aerolinea := self crearAerolinea.
    corto := self crearNacional: 1 duracion: 90 destino: 'Cordoba' precio: 100 estado: 'Programado' equipaje: false.
    demorado := self crearNacional: 2 duracion: 119 destino: 'Cordoba' precio: 100 estado: 'Demorado' equipaje: false.
    frontera := self crearInternacional: 3 duracion: 120 precio: 100 tasa: 50 estado: 'Programado'.
    finalizado := self crearNacional: 4 duracion: 121 destino: 'Rosario' precio: 100 estado: 'Finalizado' equipaje: false.
    cancelado := self crearNacional: 5 duracion: 30 destino: 'Cordoba' precio: 100 estado: 'Cancelado' equipaje: false.
    aerolinea agregar: corto; agregar: demorado; agregar: frontera; agregar: finalizado; agregar: cancelado.
    coleccion := aerolinea verTodos.
    seleccion := aerolinea listarProgramados.
    self comprobar: seleccion size = 2 mensaje: 'Solo se deben listar los programados.'.
    self comprobar: ((seleccion includes: corto) and: [seleccion includes: frontera]) mensaje: 'El listado debe incluir ambos tipos de vuelo.'.
    seleccion := aerolinea listarDuracionMenorA2Horas.
    self comprobar: seleccion size = 3 mensaje: 'El filtro de duracion debe incluir 90, 119 y 30 minutos.'.
    self comprobar: (seleccion includes: frontera) not mensaje: 'Exactamente 120 minutos debe quedar afuera.'.
    self comprobar: (seleccion includes: finalizado) not mensaje: 'Mas de 120 minutos debe quedar afuera.'.
    self comprobar: (aerolinea filtrarSegunDestino: 'Cordoba') size = 3 mensaje: 'Destino debe filtrar todos los estados.'.
    self comprobar: (aerolinea filtrarSegunDestino: 'Inexistente') isEmpty mensaje: 'Un destino sin coincidencias debe devolver una coleccion vacia.'.
    self comprobar: (aerolinea verTodos == coleccion and: [aerolinea tamanio = 5]) mensaje: 'Las consultas no deben alterar la coleccion original.'!

probarDisponiblesYPromedio
    "Verifica disponibles y el promedio sobre todos los vuelos."
    | aerolinea bajo igual alto cancelado finalizado seleccion fraccionaria |
    aerolinea := self crearAerolinea.
    cancelado := self crearNacional: 4 duracion: 90 destino: 'Cordoba' precio: 1000 estado: 'Cancelado' equipaje: false.
    finalizado := self crearInternacional: 5 duracion: 120 precio: 10000 tasa: 500 estado: 'Finalizado'.
    aerolinea agregar: cancelado; agregar: finalizado.
    self comprobar: aerolinea vuelosDisponibles isEmpty mensaje: 'Cancelado y Finalizado no deben ser disponibles.'.
    self comprobar: (aerolinea calcularPrecioPromedio - 5750) abs < 0.000001 mensaje: 'El promedio debe incluir todos los estados.'.
    self comprobar: (aerolinea mostrarVuelosConPrecioSuperiorAlPromedio size = 1 and: [aerolinea mostrarVuelosConPrecioSuperiorAlPromedio first == finalizado]) mensaje: 'El listado superior debe incluir todos los estados.'.
    bajo := self crearNacional: 1 duracion: 90 destino: 'Cordoba' precio: 100 estado: 'Programado' equipaje: true.
    igual := self crearNacional: 2 duracion: 90 destino: 'Rosario' precio: 130 estado: 'Demorado' equipaje: false.
    alto := self crearInternacional: 3 duracion: 120 precio: 100 tasa: 50 estado: 'Demorado'.
    aerolinea agregar: bajo; agregar: igual; agregar: alto.
    seleccion := aerolinea vuelosDisponibles.
    self comprobar: seleccion size = 3 mensaje: 'Debe seleccionar el programado y los dos demorados.'.
    self comprobar: ((seleccion includes: bajo) and: [seleccion includes: igual]) mensaje: 'Ambos estados deben participar de los disponibles.'.
    self comprobar: (seleccion includes: alto) mensaje: 'Debe incluir tambien al internacional demorado.'.
    self comprobar: ((seleccion includes: cancelado) not and: [(seleccion includes: finalizado) not]) mensaje: 'Cancelados y finalizados deben quedar fuera de la seleccion.'.
    self comprobar: aerolinea listarProgramados size = 1 mensaje: 'Listar programados debe conservar su filtro propio.'.
    self comprobar: (aerolinea calcularPrecioPromedio - 2378) abs < 0.000001 mensaje: 'El promedio debe usar todos los estados y precioFinal.'.
    seleccion := aerolinea mostrarVuelosConPrecioSuperiorAlPromedio.
    self comprobar: seleccion size = 1 mensaje: 'La comparacion debe ser estrictamente superior al promedio.'.
    self comprobar: seleccion first == finalizado mensaje: 'Debe devolver el vuelo de mayor precio, aunque este finalizado.'.
    alto modEstado: 'Finalizado'.
    self comprobar: aerolinea vuelosDisponibles size = 2 mensaje: 'El cambio a Finalizado debe quitar el vuelo de los disponibles.'.
    self comprobar: (aerolinea calcularPrecioPromedio - 2378) abs < 0.000001 mensaje: 'El promedio debe conservar todos los estados.'.
    self comprobar: aerolinea mostrarVuelosConPrecioSuperiorAlPromedio first == igual mensaje: 'El listado superior debe actualizarse al cambiar un estado.'.
    alto modEstado: 'Programado'.
    self comprobar: (aerolinea calcularPrecioPromedio - 2378) abs < 0.000001 mensaje: 'Cambiar a Programado no debe alterar la poblacion del promedio.'.
    alto modtasaInter: 20.
    self comprobar: (aerolinea calcularPrecioPromedio - 2372) abs < 0.000001 mensaje: 'El promedio debe recalcularse tras modificar un vuelo.'.
    fraccionaria := self crearAerolinea.
    fraccionaria agregar: (self crearNacional: 6 duracion: 90 destino: 'Cordoba' precio: 100 estado: 'Programado' equipaje: false).
    fraccionaria agregar: (self crearNacional: 7 duracion: 90 destino: 'Rosario' precio: 101 estado: 'Demorado' equipaje: false).
    self comprobar: fraccionaria calcularPrecioPromedio = (201 / 2) mensaje: 'La division directa debe conservar un promedio no entero.'.
    seleccion := fraccionaria mostrarVuelosConPrecioSuperiorAlPromedio.
    self comprobar: (seleccion size = 1 and: [seleccion first verPrecioBase = 101]) mensaje: 'El filtro debe comparar correctamente contra un promedio fraccionario.'!

probarMayorDuracion
    | aerolinea primero empatado |
    aerolinea := self crearAerolinea.
    primero := self crearNacional: 1 duracion: 180 destino: 'Cordoba' precio: 100 estado: 'Cancelado' equipaje: false.
    empatado := self crearInternacional: 2 duracion: 180 precio: 100 tasa: 50 estado: 'Programado'.
    aerolinea agregar: primero.
    self comprobar: aerolinea conocerVueloMayorDuracion == primero mensaje: 'Con un vuelo debe devolver ese mismo objeto.'.
    aerolinea agregar: empatado.
    self comprobar: aerolinea conocerVueloMayorDuracion == primero mensaje: 'Un empate debe conservar el primer maximo encontrado.'.
    empatado modDuracion: 181.
    self comprobar: aerolinea conocerVueloMayorDuracion == empatado mensaje: 'El mayor debe actualizarse al cambiar una duracion.'!

probarFacturacion
    | aerolinea nacional internacional |
    aerolinea := self crearAerolinea.
    nacional := self crearNacional: 1 duracion: 90 destino: 'Cordoba' precio: 100 estado: 'Programado' equipaje: true.
    internacional := self crearInternacional: 2 duracion: 120 precio: 100 tasa: 50 estado: 'Programado'.
    aerolinea agregar: nacional; agregar: internacional.
    aerolinea agregar: (self crearNacional: 3 duracion: 90 destino: 'Cordoba' precio: 1000 estado: 'Demorado' equipaje: false).
    aerolinea agregar: (self crearNacional: 4 duracion: 90 destino: 'Cordoba' precio: 2000 estado: 'Cancelado' equipaje: false).
    aerolinea agregar: (self crearNacional: 5 duracion: 90 destino: 'Cordoba' precio: 3000 estado: 'Finalizado' equipaje: false).
    self comprobar: (aerolinea calcularFacturacionTotal - 260) abs < 0.000001 mensaje: 'La facturacion debe sumar 110 y 150, excluyendo los otros estados.'.
    nacional modEstado: 'Demorado'.
    self comprobar: aerolinea calcularFacturacionTotal = 150 mensaje: 'Cambiar un programado debe actualizar la facturacion.'.
    internacional modEstado: 'Finalizado'.
    self comprobar: aerolinea calcularFacturacionTotal = 0 mensaje: 'Sin programados la facturacion debe ser cero.'!

probarBajas
    | aerolinea primero segundo vigente coleccion soloCancelados |
    aerolinea := self crearAerolinea.
    primero := self crearNacional: 1 duracion: 90 destino: 'Cordoba' precio: 100 estado: 'Cancelado' equipaje: false.
    segundo := self crearInternacional: 2 duracion: 120 precio: 100 tasa: 50 estado: 'Cancelado'.
    vigente := self crearNacional: 3 duracion: 90 destino: 'Rosario' precio: 100 estado: 'Programado' equipaje: false.
    aerolinea agregar: primero; agregar: segundo; agregar: vigente.
    coleccion := aerolinea verTodos.
    self comprobar: aerolinea eliminarTodosLosCancelados == aerolinea mensaje: 'La baja debe devolver self.'.
    self comprobar: aerolinea verTodos == coleccion mensaje: 'La baja masiva debe conservar la referencia de la coleccion.'.
    self comprobar: (coleccion size = 1 and: [coleccion first == vigente]) mensaje: 'Debe retirar cancelados consecutivos y conservar el vuelo vigente.'.
    aerolinea eliminarTodosLosCancelados.
    self comprobar: coleccion size = 1 mensaje: 'Repetir la baja sin cancelados no debe quitar otros vuelos.'.
    soloCancelados := self crearAerolinea.
    soloCancelados agregar: primero; agregar: segundo.
    soloCancelados eliminarTodosLosCancelados.
    self comprobar: soloCancelados esVacio mensaje: 'Si todos son cancelados debe quedar vacia.'!

probarDiccionario
    | aerolinea dic |
    aerolinea := self crearAerolinea.
    aerolinea agregar: (self crearNacional: 1 duracion: 90 destino: 'Cordoba' precio: 100 estado: 'Programado' equipaje: false).
    aerolinea agregar: (self crearInternacional: 2 duracion: 120 precio: 100 tasa: 50 estado: 'Programado').
    aerolinea agregar: (self crearNacional: 3 duracion: 90 destino: 'Rosario' precio: 100 estado: 'Demorado' equipaje: false).
    aerolinea agregar: (self crearNacional: 4 duracion: 90 destino: 'Rosario' precio: 100 estado: 'Cancelado' equipaje: false).
    aerolinea agregar: (self crearInternacional: 5 duracion: 120 precio: 100 tasa: 50 estado: 'Cancelado').
    aerolinea agregar: (self crearNacional: 6 duracion: 90 destino: 'Rosario' precio: 100 estado: 'Finalizado' equipaje: false).
    dic := aerolinea guardarEnDiccionarioVuelosPorEstado.
    self comprobar: dic size = 4 mensaje: 'El diccionario debe tener una entrada por estado existente.'.
    self comprobar: (dic at: 'Programado') = 2 mensaje: 'Programado debe guardar el contador 2.'.
    self comprobar: (dic at: 'Demorado') = 1 mensaje: 'Demorado debe guardar el contador 1.'.
    self comprobar: (dic at: 'Cancelado') = 2 mensaje: 'Cancelado debe guardar el contador 2.'.
    self comprobar: (dic at: 'Finalizado') = 1 mensaje: 'Finalizado debe guardar el contador 1.'.
    self comprobar: aerolinea tamanio = 6 mensaje: 'Contar no debe modificar los vuelos.'.
    aerolinea eliminarTodosLosCancelados.
    self comprobar: (aerolinea guardarEnDiccionarioVuelosPorEstado at: 'Cancelado' ifAbsent: [nil]) isNil mensaje: 'Un nuevo conteo no debe conservar estados sin vuelos.'.
    self comprobar: (dic at: 'Cancelado') = 2 mensaje: 'El diccionario previo debe conservar su resultado.'!

probarCargaPorDia
    | aerolinea coleccion primero segundo tercero cuarto quinto sexto otroMes otroAnio |
    aerolinea := Aerolinea crear: 'UTN Air' con: 2000 con: 'Argentina' con: 'UTN' con: 2.
    coleccion := aerolinea verTodos.
    primero := self crearNacional: 1 duracion: 90 destino: 'Cordoba' precio: 100 estado: 'Programado' equipaje: false.
    primero modFecha: '21/10/2026 00:01'.
    segundo := self crearInternacional: 2 duracion: 120 precio: 100 tasa: 50 estado: 'Demorado'.
    segundo modFecha: '21/10/2026 23:59'.
    tercero := self crearNacional: 3 duracion: 90 destino: 'Rosario' precio: 100 estado: 'Programado' equipaje: false.
    tercero modFecha: '21/10/2026 12:00'.
    cuarto := self crearInternacional: 4 duracion: 120 precio: 100 tasa: 50 estado: 'Programado'.
    cuarto modFecha: '22/10/2026 00:01'.
    quinto := self crearNacional: 5 duracion: 90 destino: 'Rosario' precio: 100 estado: 'Programado' equipaje: false.
    quinto modFecha: '22/10/2026 23:59'.
    sexto := self crearNacional: 6 duracion: 90 destino: 'Cordoba' precio: 100 estado: 'Programado' equipaje: false.
    sexto modFecha: '22/10/2026 12:00'.
    self comprobar: (aerolinea cargar: primero) mensaje: 'Debe admitir el primer vuelo del dia.'.
    self comprobar: (aerolinea cargar: segundo) mensaje: 'Debe aceptar exactamente el maximo diario con otra hora y subtipo.'.
    self comprobar: (aerolinea cargar: tercero) not mensaje: 'Debe rechazar el tercer vuelo del mismo dia.'.
    self comprobar: (aerolinea tamanio = 2 and: [(aerolinea buscarPorNumero: 3) isNil]) mensaje: 'Rechazar por cupo no debe agregar el vuelo.'.
    self comprobar: (aerolinea cargar: cuarto) mensaje: 'El primer vuelo del otro dia debe tener cupo independiente.'.
    self comprobar: (aerolinea cargar: quinto) mensaje: 'El segundo dia tambien debe admitir su maximo.'.
    self comprobar: (aerolinea cargar: sexto) not mensaje: 'Debe rechazar superar el cupo del segundo dia.'.
    self comprobar: aerolinea tamanio = 4 mensaje: 'El total puede superar el maximo diario con varias fechas.'.
    otroMes := self crearNacional: 7 duracion: 90 destino: 'Cordoba' precio: 100 estado: 'Programado' equipaje: false.
    otroMes modFecha: '21/11/2026 10:00'.
    otroAnio := self crearNacional: 8 duracion: 90 destino: 'Cordoba' precio: 100 estado: 'Programado' equipaje: false.
    otroAnio modFecha: '21/10/2027 10:00'.
    self comprobar: (aerolinea cargar: otroMes) mensaje: 'El mismo numero de dia en otro mes debe tener cupo propio.'.
    self comprobar: (aerolinea cargar: otroAnio) mensaje: 'El mismo dia y mes de otro anio debe tener cupo propio.'.
    self comprobar: aerolinea tamanio = 6 mensaje: 'Deben conservarse todos los vuelos de las cuatro fechas.'.
    self comprobar: aerolinea verTodos == coleccion mensaje: 'Cargar y rechazar deben conservar la coleccion original.'.
    self comprobar: (aerolinea buscarPorNumero: 1) == primero mensaje: 'Debe conservar la referencia al vuelo cargado.'.
    aerolinea eliminar: primero.
    self comprobar: (aerolinea cargar: tercero) mensaje: 'Eliminar un vuelo debe liberar lugar en ese mismo dia.'.
    self comprobar: (aerolinea tamanio = 6 and: [aerolinea verTodos == coleccion]) mensaje: 'Reutilizar el cupo debe conservar los otros dias y la coleccion.'!

probarCargaConNumeroUnicoYCero
    | aerolinea primero repetido otro sinCupo coleccion |
    aerolinea := Aerolinea crear: 'UTN Air' con: 2000 con: 'Argentina' con: 'UTN' con: 3.
    primero := self crearNacional: 1 duracion: 90 destino: 'Cordoba' precio: 100 estado: 'Programado' equipaje: false.
    repetido := self crearInternacional: 1 duracion: 120 precio: 100 tasa: 50 estado: 'Programado'.
    repetido modFecha: '22/10/2026 10:00'.
    otro := self crearNacional: 2 duracion: 90 destino: 'Rosario' precio: 100 estado: 'Programado' equipaje: false.
    otro modFecha: '22/10/2026 11:00'.
    coleccion := aerolinea verTodos.
    self comprobar: (aerolinea cargar: primero) mensaje: 'Debe aceptar el primer numero.'.
    self comprobar: (aerolinea cargar: repetido) not mensaje: 'El numero debe ser unico aunque cambie la fecha.'.
    self comprobar: (aerolinea cargar: primero) not mensaje: 'No debe cargar dos veces el mismo objeto.'.
    self comprobar: (aerolinea tamanio = 1 and: [(aerolinea buscarPorNumero: 1) == primero]) mensaje: 'Rechazar duplicados debe conservar el vuelo original.'.
    self comprobar: (aerolinea cargar: otro) mensaje: 'Debe aceptar otro numero en la nueva fecha.'.
    self comprobar: (aerolinea tamanio = 2 and: [aerolinea verTodos == coleccion]) mensaje: 'Debe conservar la coleccion y las cargas aceptadas.'.
    sinCupo := Aerolinea crear: 'Sin cupo' con: 2000 con: 'Argentina' con: 'CERO' con: 0.
    coleccion := sinCupo verTodos.
    self comprobar: (sinCupo cargar: primero) not mensaje: 'Con maximo cero debe rechazar el primer vuelo.'.
    self comprobar: (sinCupo esVacio and: [sinCupo verTodos == coleccion]) mensaje: 'El rechazo con cupo cero debe conservar el vacio.'!

probarCambioDeFechaSinCupo
    | aerolinea vuelo cancelado finalizado coleccion |
    aerolinea := Aerolinea crear: 'UTN Air' con: 2000 con: 'Argentina' con: 'UTN' con: 2.
    vuelo := self crearNacional: 1 duracion: 90 destino: 'Cordoba' precio: 100 estado: 'Programado' equipaje: true.
    cancelado := self crearInternacional: 2 duracion: 120 precio: 100 tasa: 50 estado: 'Cancelado'.
    cancelado modFecha: '22/10/2026 00:01'.
    finalizado := self crearNacional: 3 duracion: 90 destino: 'Rosario' precio: 100 estado: 'Finalizado' equipaje: false.
    finalizado modFecha: '22/10/2026 23:59'.
    self comprobar: (aerolinea cargar: vuelo) mensaje: 'Debe cargar el vuelo a editar.'.
    self comprobar: (aerolinea cargar: cancelado) mensaje: 'Debe conservar vuelos cancelados.'.
    self comprobar: (aerolinea cargar: finalizado) mensaje: 'Debe conservar vuelos finalizados.'.
    coleccion := aerolinea verTodos.
    self comprobar: (aerolinea modificarFechaDeVuelo: 1 a: '22/10/2026 12:00') not mensaje: 'Debe rechazar el cambio a un dia completo, contando todos los estados.'.
    self comprobar: vuelo verFecha = '21/10/2026 10:00' mensaje: 'El rechazo debe conservar la fecha y hora originales.'.
    self comprobar: (aerolinea buscarPorNumero: 1) == vuelo mensaje: 'El rechazo debe conservar el mismo objeto vuelo.'.
    self comprobar: (aerolinea verTodos == coleccion and: [coleccion size = 3]) mensaje: 'El rechazo no debe reemplazar ni quitar vuelos de la coleccion.'.
    self comprobar: (aerolinea recuperar: 1) == vuelo mensaje: 'El rechazo debe conservar el orden de los vuelos.'.
    self comprobar: cancelado verFecha = '22/10/2026 00:01' mensaje: 'No debe modificar el vuelo cancelado.'.
    self comprobar: finalizado verFecha = '22/10/2026 23:59' mensaje: 'No debe modificar el vuelo finalizado.'.
    aerolinea eliminar: cancelado.
    self comprobar: (aerolinea modificarFechaDeVuelo: 1 a: '22/10/2026 12:00') mensaje: 'Debe admitir el cambio cuando una baja libera cupo.'.
    self comprobar: vuelo verFecha = '22/10/2026 12:00' mensaje: 'El cambio aceptado debe conservar la hora solicitada.'.
    self comprobar: (vuelo verNumero = 1 and: [vuelo verEstado = 'Programado']) mensaje: 'La edicion de fecha no debe cambiar numero ni estado.'.
    self comprobar: (vuelo verDuracion = 90 and: [vuelo verPrecioBase = 100]) mensaje: 'La edicion de fecha no debe cambiar duracion ni precio.'.
    self comprobar: vuelo verllevaEquipaje mensaje: 'Debe conservar el dato particular del nacional.'!

probarCambioDeFechaConCupo
    | aerolinea vuelo reemplazo exceso coleccion |
    aerolinea := Aerolinea crear: 'UTN Air' con: 2000 con: 'Argentina' con: 'UTN' con: 1.
    vuelo := self crearInternacional: 1 duracion: 120 precio: 100 tasa: 50 estado: 'Demorado'.
    self comprobar: (aerolinea cargar: vuelo) mensaje: 'Debe cargar el internacional.'.
    coleccion := aerolinea verTodos.
    self comprobar: (aerolinea modificarFechaDeVuelo: 1 a: '21/11/2026 23:59') mensaje: 'Otro mes debe tener cupo independiente.'.
    self comprobar: vuelo verFecha = '21/11/2026 23:59' mensaje: 'Debe actualizar la fecha y hora del mismo vuelo.'.
    self comprobar: (aerolinea buscarPorNumero: 1) == vuelo mensaje: 'El cambio aceptado debe conservar la referencia al vuelo.'.
    reemplazo := self crearNacional: 2 duracion: 90 destino: 'Cordoba' precio: 100 estado: 'Programado' equipaje: false.
    self comprobar: (aerolinea cargar: reemplazo) mensaje: 'Mover el vuelo debe liberar su cupo de origen.'.
    exceso := self crearNacional: 3 duracion: 90 destino: 'Cordoba' precio: 100 estado: 'Programado' equipaje: false.
    exceso modFecha: '21/11/2026 00:01'.
    self comprobar: (aerolinea cargar: exceso) not mensaje: 'El vuelo movido debe ocupar cupo en su nueva fecha.'.
    self comprobar: (aerolinea modificarFechaDeVuelo: 1 a: '21/11/2027 00:01') mensaje: 'Otro anio debe tener cupo independiente.'.
    self comprobar: vuelo verFecha = '21/11/2027 00:01' mensaje: 'Debe conservar la fecha completa con el nuevo anio.'.
    self comprobar: (aerolinea cargar: exceso) mensaje: 'Un segundo cambio debe liberar el cupo del mes anterior.'.
    self comprobar: (aerolinea verTodos == coleccion and: [coleccion size = 3]) mensaje: 'Debe conservar la coleccion y permitir mas vuelos totales que el maximo diario.'.
    self comprobar: (aerolinea recuperar: 1) == vuelo mensaje: 'Mover no debe cambiar el orden del vuelo.'.
    self comprobar: (vuelo verNumero = 1 and: [vuelo vertasaInter = 50]) mensaje: 'Debe conservar numero y tasa del internacional.'!

probarCambioDeHoraConDiaCompleto
    | aerolinea vuelo otro coleccion |
    aerolinea := Aerolinea crear: 'UTN Air' con: 2000 con: 'Argentina' con: 'UTN' con: 2.
    vuelo := self crearNacional: 1 duracion: 90 destino: 'Cordoba' precio: 100 estado: 'Programado' equipaje: false.
    otro := self crearInternacional: 2 duracion: 120 precio: 100 tasa: 50 estado: 'Demorado'.
    self comprobar: (aerolinea cargar: vuelo) mensaje: 'Debe cargar el nacional.'.
    self comprobar: (aerolinea cargar: otro) mensaje: 'Debe completar el cupo del dia.'.
    coleccion := aerolinea verTodos.
    self comprobar: (aerolinea modificarFechaDeVuelo: 1 a: '21/10/2026 23:59') mensaje: 'Cambiar solo la hora en un dia completo no debe contar dos veces al propio vuelo.'.
    self comprobar: vuelo verFecha = '21/10/2026 23:59' mensaje: 'Debe actualizar la hora solicitada.'.
    self comprobar: (aerolinea modificarFechaDeVuelo: 1 a: '21/10/2026 23:59') mensaje: 'Repetir la misma fecha y hora debe conservar su plaza.'.
    self comprobar: (aerolinea modificarFechaDeVuelo: 2 a: '21/10/2026 00:01') mensaje: 'El internacional tambien debe conservar su plaza al cambiar la hora.'.
    self comprobar: otro verFecha = '21/10/2026 00:01' mensaje: 'Debe actualizar tambien la hora del internacional.'.
    self comprobar: (aerolinea verTodos == coleccion and: [coleccion size = 2]) mensaje: 'Editar las horas no debe agregar ni retirar vuelos.'!

probarCambioDeFechaInexistente
    | aerolinea vuelo coleccion |
    aerolinea := self crearAerolinea.
    coleccion := aerolinea verTodos.
    self comprobar: (aerolinea modificarFechaDeVuelo: 99 a: '22/10/2026 10:00') not mensaje: 'Sin vuelos debe rechazar un numero inexistente.'.
    self comprobar: (aerolinea esVacio and: [aerolinea verTodos == coleccion]) mensaje: 'El rechazo debe conservar la coleccion vacia.'.
    vuelo := self crearNacional: 1 duracion: 90 destino: 'Cordoba' precio: 100 estado: 'Programado' equipaje: false.
    self comprobar: (aerolinea cargar: vuelo) mensaje: 'Debe cargar el vuelo existente.'.
    self comprobar: (aerolinea modificarFechaDeVuelo: 99 a: '22/10/2026 10:00') not mensaje: 'Con vuelos debe rechazar tambien un numero inexistente.'.
    self comprobar: vuelo verFecha = '21/10/2026 10:00' mensaje: 'Un numero inexistente no debe modificar otro vuelo.'.
    self comprobar: (aerolinea verTodos == coleccion and: [coleccion size = 1]) mensaje: 'El rechazo no debe agregar ni retirar vuelos existentes.'!

ejecutar
    self probarVacia.
    self probarBusqueda.
    self probarListados.
    self probarDisponiblesYPromedio.
    self probarMayorDuracion.
    self probarFacturacion.
    self probarBajas.
    self probarDiccionario.
    self probarCargaPorDia.
    self probarCargaConNumeroUnicoYCero.
    self probarCambioDeFechaSinCupo.
    self probarCambioDeFechaConCupo.
    self probarCambioDeHoraConDiaCompleto.
    self probarCambioDeFechaInexistente.
    ^14! !

!AerolineaPrueba class categoriesFor: #comprobar:mensaje:!private! !
!AerolineaPrueba class categoriesFor: #crearAerolinea!private! !
!AerolineaPrueba class categoriesFor: #crearNacional:duracion:destino:precio:estado:equipaje:!private! !
!AerolineaPrueba class categoriesFor: #crearInternacional:duracion:precio:tasa:estado:!private! !
!AerolineaPrueba class categoriesFor: #probarVacia!private! !
!AerolineaPrueba class categoriesFor: #probarBusqueda!private! !
!AerolineaPrueba class categoriesFor: #probarListados!private! !
!AerolineaPrueba class categoriesFor: #probarDisponiblesYPromedio!private! !
!AerolineaPrueba class categoriesFor: #probarMayorDuracion!private! !
!AerolineaPrueba class categoriesFor: #probarFacturacion!private! !
!AerolineaPrueba class categoriesFor: #probarBajas!private! !
!AerolineaPrueba class categoriesFor: #probarDiccionario!private! !
!AerolineaPrueba class categoriesFor: #probarCargaPorDia!private! !
!AerolineaPrueba class categoriesFor: #probarCargaConNumeroUnicoYCero!private! !
!AerolineaPrueba class categoriesFor: #probarCambioDeFechaSinCupo!private! !
!AerolineaPrueba class categoriesFor: #probarCambioDeFechaConCupo!private! !
!AerolineaPrueba class categoriesFor: #probarCambioDeHoraConDiaCompleto!private! !
!AerolineaPrueba class categoriesFor: #probarCambioDeFechaInexistente!private! !
!AerolineaPrueba class categoriesFor: #ejecutar!public! !
