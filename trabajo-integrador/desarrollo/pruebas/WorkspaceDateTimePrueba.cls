"Recorre el Workspace real sustituyendo solamente los dialogos por colas."!
Object subclass: #WorkspaceDateTimePrueba
 instanceVariableNames: ''
 classVariableNames: ''
 poolDictionaries: ''
 classInstanceVariableNames: ''!
!WorkspaceDateTimePrueba class methodsFor!
comprobar: condicion mensaje: mensaje
 condicion ifFalse: [Error signal: mensaje]!
buscar: unaAerolinea numero: unNumero
 ^unaAerolinea verTodos detect: [:unVuelo | unVuelo verNumero = unNumero] ifNone: [nil]!
correr: archivo textos: textos opciones: opciones
 | fuente limite prefijo cuerpo resultado |
 fuente := (FileStream read: archivo) contents.
 limite := fuente indexOfSubCollection: '[continuar] whileTrue:' startingAt: 1.
 prefijo := fuente copyFrom: 1 to: limite - 1.
 cuerpo := fuente copyFrom: limite to: fuente size.
 Smalltalk at: #DTTextos put: textos readStream.
 Smalltalk at: #DTOpciones put: opciones readStream.
 Smalltalk at: #DTMensajes put: OrderedCollection new.
 prefijo := prefijo copyReplaceAll: 'Prompter prompt: unMensaje' with: '[(Smalltalk at: #DTTextos) atEnd ifTrue: [Error signal: ''Faltan textos'']. (Smalltalk at: #DTTextos) next] value'.
 prefijo := prefijo copyReplaceAll: 'ChoicePrompter choices: unasOpciones caption: unTitulo' with: '| elegida | (Smalltalk at: #DTOpciones) atEnd ifTrue: [Error signal: ''Faltan opciones'']. elegida := (Smalltalk at: #DTOpciones) next. (elegida notNil and: [(unasOpciones includes: elegida) not]) ifTrue: [Error signal: ''Opcion inexistente: '', elegida]. elegida'.
 prefijo := prefijo copyReplaceAll: 'MessageBox notify: unMensaje' with: '(Smalltalk at: #DTMensajes) add: unMensaje'.
 resultado := Compiler evaluate: prefijo, cuerpo, ' Array with: aerolinea with: (Smalltalk at: #DTMensajes)'.
 self comprobar: resultado notNil mensaje: 'No compilo el Workspace instrumentado'.
 self comprobar: (Smalltalk at: #DTTextos) atEnd mensaje: 'Quedaron textos sin consumir: ', (Smalltalk at: #DTTextos) contents displayString, ' mensajes: ', (Smalltalk at: #DTMensajes) displayString.
 self comprobar: (Smalltalk at: #DTOpciones) atEnd mensaje: 'Quedaron opciones sin consumir'.
 ^resultado!
ejecutarArchivo: archivo
 | resultado textos opciones consultas campos valores numero vuelo |
 consultas := #('Todos los vuelos' 'Programados' 'Duracion menor a dos horas' 'Destino' 'Precio final promedio' 'Precios superiores al promedio' 'Mayor duracion' 'Facturacion potencial' 'Cantidad por estado').
 textos := OrderedCollection withAll: #('UTN' '2000' 'Argentina' 'UTN' '10').
 opciones := OrderedCollection with: '1. Cargar aerolinea'.
 consultas do: [:consulta | opciones add: '7. Consultas'; add: consulta. consulta = 'Destino' ifTrue: [textos add: 'Cordoba']].
 opciones add: '0. Salir'.
 resultado := self correr: archivo textos: textos opciones: opciones.
 self comprobar: resultado first verTodos size = 10 mensaje: 'Precarga con cupo suficiente debe cargar diez vuelos'.
 self comprobar: resultado last size = 10 mensaje: 'Las nueve consultas deben informar resultados'.
 self comprobar: ((resultado last at: 6) indexOfSubCollection: '2063607.2' startingAt: 1) > 0 mensaje: 'Promedio debe incluir los diez vuelos'.
 self comprobar: ((resultado last at: 9) indexOfSubCollection: '8621035' startingAt: 1) > 0 mensaje: 'Facturacion debe sumar solo Programados'.
 self comprobar: ((resultado last at: 10) indexOfSubCollection: 'Programado: 4' startingAt: 1) > 0 mensaje: 'Diccionario debe contar cuatro Programados'.
 "Cancelacion en cada campo de texto al cargar ambos subtipos."
 #('Nacional' 'Internacional') do: [:tipo |
  1 to: (tipo = 'Nacional' ifTrue: [7] ifFalse: [8]) do: [:indice |
   textos := OrderedCollection withAll: #('UTN' '2000' 'Argentina' 'UTN' '10').
   valores := #('999' 'Origen' 'Destino' '29/02/2024 23:59' '90' '100.50' 'Provincia' '10.50').
   1 to: indice - 1 do: [:i | textos add: (valores at: i)].
   textos add: nil.
   opciones := OrderedCollection withAll: (Array with: '1. Cargar aerolinea' with: '3. Cargar vuelo' with: tipo).
   indice > 6 ifTrue: [opciones add: 'Programado'].
   opciones add: '0. Salir'.
   resultado := self correr: archivo textos: textos opciones: opciones.
   self comprobar: resultado first verTodos size = 10 mensaje: 'Cancelar alta no debe crear vuelos parciales']].
 "Edicion de todos los campos comunes y particulares; false debe guardarse."
 #(101 201) do: [:id |
  campos := OrderedCollection withAll: #('Origen' 'Destino' 'Fecha y hora' 'Duracion' 'Precio base' 'Estado').
  valores := OrderedCollection withAll: #('Rosario' 'Mendoza' '29/02/2024 23:59' '119' '99.75' 'Finalizado').
  id = 101 ifTrue: [campos add: 'Provincia de destino'; add: 'Equipaje'. valores add: 'Mendoza'; add: 'No']
   ifFalse: [campos add: 'Pais de destino'; add: 'Tasa internacional'; add: 'Documentacion'. valores add: 'Chile'; add: '10.25'; add: 'No'].
  textos := OrderedCollection withAll: #('UTN' '2000' 'Argentina' 'UTN' '10').
  opciones := OrderedCollection with: '1. Cargar aerolinea'.
  1 to: campos size do: [:i |
   opciones add: '5. Modificar vuelo'; add: (campos at: i).
   textos add: id displayString.
   (#('Estado' 'Equipaje' 'Documentacion') includes: (campos at: i))
    ifTrue: [opciones add: (valores at: i)]
    ifFalse: [textos add: (valores at: i)]].
  opciones add: '0. Salir'.
  resultado := self correr: archivo textos: textos opciones: opciones.
  vuelo := self buscar: resultado first numero: id.
  self comprobar: (vuelo verOrigen = 'Rosario' and: [vuelo verDestino = 'Mendoza']) mensaje: 'Edicion origen/destino'.
  self comprobar: (vuelo verFecha = (Date newDay: 29 monthIndex: 2 year: 2024)) mensaje: 'Edicion Date'.
  self comprobar: vuelo verHora = (Time fromMilliseconds: 86340000) mensaje: 'Edicion Time'.
  self comprobar: (vuelo verDuracion = 119 and: [vuelo verPrecioBase = 99.75]) mensaje: 'Edicion duracion/precio'.
  self comprobar: vuelo verEstado = 'Finalizado' mensaje: 'Edicion estado'.
  id = 101 ifTrue: [self comprobar: (vuelo isKindOf: VueloNacional) mensaje: 'Tipo fijo nacional'. self comprobar: vuelo verllevaEquipaje = false mensaje: 'Equipaje false'. self comprobar: vuelo verprovDestino = 'Mendoza' mensaje: 'Provincia']
   ifFalse: [self comprobar: (vuelo isKindOf: VueloInternacional) mensaje: 'Tipo fijo internacional'. self comprobar: vuelo verDocumentacion = false mensaje: 'Documentacion false'. self comprobar: vuelo verpaisDestino = 'Chile' mensaje: 'Pais'. self comprobar: vuelo precioFinal = 110 mensaje: 'Precio internacional editado']].
 "Cancelar cada campo de edicion debe conservar el vuelo original."
 #('Origen' 'Destino' 'Fecha y hora' 'Duracion' 'Precio base' 'Estado' 'Provincia de destino' 'Equipaje' 'Pais de destino' 'Tasa internacional' 'Documentacion') do: [:campo |
  numero := (#('Pais de destino' 'Tasa internacional' 'Documentacion') includes: campo) ifTrue: ['201'] ifFalse: ['101'].
  textos := OrderedCollection withAll: #('UTN' '2000' 'Argentina' 'UTN' '10').
  textos add: numero.
  opciones := OrderedCollection withAll: (Array with: '1. Cargar aerolinea' with: '5. Modificar vuelo' with: campo).
  (#('Estado' 'Equipaje' 'Documentacion') includes: campo) ifTrue: [opciones add: nil] ifFalse: [textos add: nil].
  opciones add: '0. Salir'.
  resultado := self correr: archivo textos: textos opciones: opciones.
  vuelo := self buscar: resultado first numero: numero asNumber.
  self comprobar: vuelo verOrigen = 'Buenos Aires' mensaje: 'Cancelar edicion conserva origen'.
  self comprobar: vuelo verEstado = 'Programado' mensaje: 'Cancelar edicion conserva estado'.
  self comprobar: resultado last size = 1 mensaje: 'Cancelar edicion no debe anunciar modificacion'].
 "Cancelar selectores de alta."
 #('Nacional' 'Internacional') do: [:tipo |
  textos := OrderedCollection withAll: #('UTN' '2000' 'Argentina' 'UTN' '10' '999' 'Origen' 'Destino' '21/10/2026 10:00' '90' '100' 'Lugar').
  tipo = 'Internacional' ifTrue: [textos add: '10'].
  opciones := OrderedCollection withAll: (Array with: '1. Cargar aerolinea' with: '3. Cargar vuelo' with: tipo with: 'Programado').
  opciones add: nil; add: '0. Salir'.
  resultado := self correr: archivo textos: textos opciones: opciones.
  self comprobar: resultado first verTodos size = 10 mensaje: 'Cancelar booleano no debe cargar vuelo'].
 "Reintentos reales de vacio, entero, fecha y precio al cargar nacional."
 resultado := self correr: archivo textos: #('UTN' '2000' 'Argentina' 'UTN' '10' '0' '999' '' '  Rosario  ' 'Cordoba' '31/02/2026 10:00' '29/02/2024 23:59' '-1' '119' 'abc' '100.50' 'Cordoba') opciones: #('1. Cargar aerolinea' '3. Cargar vuelo' 'Nacional' 'Demorado' 'No' '0. Salir').
 vuelo := self buscar: resultado first numero: 999.
 self comprobar: (vuelo notNil and: [vuelo verOrigen = 'Rosario']) mensaje: 'Reintentar y recortar debe completar alta'.
 self comprobar: vuelo verllevaEquipaje = false mensaje: 'Alta con No debe guardar false'.
 self comprobar: vuelo verPrecioBase = 100.50 mensaje: 'Reintentar precio debe guardar decimal'.
 "Todas las consultas en vacio."
 textos := OrderedCollection withAll: #('UTN' '2000' 'Argentina' 'UTN' '0').
 opciones := OrderedCollection with: '1. Cargar aerolinea'.
 consultas do: [:consulta | opciones add: '7. Consultas'; add: consulta. consulta = 'Destino' ifTrue: [textos add: 'Cordoba']].
 opciones add: '0. Salir'.
 resultado := self correr: archivo textos: textos opciones: opciones.
 self comprobar: resultado first verTodos size = 0 mensaje: 'Cupo cero debe conservar vacio'.
 self comprobar: resultado last size = 11 mensaje: 'Precarga parcial y nueve consultas vacias deben informar resultados'.
 self comprobar: ((resultado last at: 7) indexOfSubCollection: ': 0' startingAt: 1) > 0 mensaje: 'Promedio vacio debe ser cero'.
 self comprobar: ((resultado last at: 10) indexOfSubCollection: ': 0' startingAt: 1) > 0 mensaje: 'Facturacion vacia debe ser cero'.
 "Cupo del Workspace: rechazo conserva fecha y hora; cambiar hora conserva plaza."
 resultado := self correr: archivo textos: #('UTN' '2000' 'Argentina' 'UTN' '1' '101' '10/12/2026 22:00' '101' '01/12/2026 23:59') opciones: #('1. Cargar aerolinea' '5. Modificar vuelo' 'Fecha y hora' '5. Modificar vuelo' 'Fecha y hora' '0. Salir').
 vuelo := self buscar: resultado first numero: 101.
 self comprobar: vuelo verFecha = (Date newDay: 1 monthIndex: 12 year: 2026) mensaje: 'Cupo completo debe conservar fecha'.
 self comprobar: vuelo verHora = (Time fromMilliseconds: 86340000) mensaje: 'Cambio de hora conserva plaza'.
 self comprobar: (resultado last first indexOfSubCollection: 'Precarga parcial' startingAt: 1) > 0 mensaje: 'Cupo bajo debe informar precarga parcial'.
 self comprobar: (resultado last anySatisfy: [:mensaje | (mensaje indexOfSubCollection: 'No se pudo modificar' startingAt: 1) > 0]) mensaje: 'Debe informar rechazo por cupo'.
 "Baja individual y masiva."
 resultado := self correr: archivo textos: #('UTN' '2000' 'Argentina' 'UTN' '10' '101') opciones: #('1. Cargar aerolinea' '6. Eliminar vuelo' '8. Eliminar todos los cancelados' '0. Salir').
 self comprobar: resultado first verTodos size = 7 mensaje: 'Bajas deben retirar uno individual y dos cancelados'.
 ^'OK: 35 recorridos del Workspace (consultas, cancelaciones, reintentos, edicion, cupos y bajas)'!
