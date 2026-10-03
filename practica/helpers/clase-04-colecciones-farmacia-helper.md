# Helper práctico 4 — Farmacia, colecciones e iteradores

Fuente: [Clase 4.pptx](../enunciados/Clase%204.pptx), diapositivas 5–27. Prerrequisitos: [Remedio](clase-03-clases-aplicaciones-helper.md), [Biblioteca](../../teoria/apuntes/04-clase-biblioteca-helper.md) y [colecciones](../../teoria/apuntes/05-colecciones-helper.md).

## Qué hay que construir

`Farmacia` tiene `nombre conjRem`; la colección contiene objetos Remedio. La especificación y la implementación están en diapositivas 9–10 y 14–17.

La aplicación de la diapositiva 12 pide:

1. Crear una farmacia y cargar remedios.
2. Aumentar 20% el precio de los remedios cuyo stock sea menor que una cantidad ingresada.
3. Eliminar los del laboratorio Bagó.
4. Modificar el precio del Lotrial.

Las diapositivas 25–26 agregan un ejemplo de diccionario que cuenta remedios por laboratorio. La 27 remite al **TP3**, cuyo enunciado independiente no está entre los archivos recibidos.

## Receta para Farmacia

1. Crear `Farmacia` como subclase de Object con sus dos atributos.
2. Implementar `crear:` del lado de clase: `^self new init: nom`.
3. En `init:`, guardar nombre e inicializar `conjRem := OrderedCollection new`.
4. Implementar `agregar:`, `eliminar:`, `recuperar:`, `tamanio`, `verTodos`, `esVacio` y `existe:` según el protocolo.
5. Verificar primero vacío, alta y recuperación. Después resolver la aplicación.

`recuperar:` consulta por posición; `existe:` comprueba un objeto. Buscar por nombre requiere comparar `verNombre` de cada remedio. `verTodos` expone la colección interna en el material; mantener ese efecto presente al modificarla.

## Usar el iterador que corresponde, diapositivas 19–23

| Operación | Elección propuesta |
| --- | --- |
| Aumentar precios según stock | `do:` con condición |
| Encontrar los del laboratorio Bagó | `select:` |
| Obtener nombres de laboratorios | `collect:` |
| Buscar el primer Lotrial | `detect:ifNone:` |
| Obtener los que no son de un laboratorio | `reject:` |

Fragmento de aplicación; `far` y `stockMinimo` deben estar cargados:

```smalltalk
| candidatos lotrial |
far verTodos do: [:rem |
    rem verStock < stockMinimo ifTrue: [
        rem modPrecio: rem verPrecio * 1.2]].
candidatos := far verTodos select: [:rem | rem verLab = 'Bagó'].
candidatos do: [:rem | far eliminar: rem].
lotrial := far verTodos
    detect: [:rem | rem verNombre = 'Lotrial'] ifNone: [nil].
```

El incremento cambia objetos, sin cambiar el tamaño de la colección. Las bajas sí cambian su estructura, por eso se recorre otra colección con los candidatos. Para modificar Lotrial, comprobar `notNil` antes de `modPrecio:`. Si existen varios remedios con ese nombre, `detect:` toma el primero; la práctica 5 modifica todos mediante recorrido. Acordar el alcance esperado.

## Diccionario por laboratorio, diapositiva 26

```smalltalk
| laboratorios dic |
laboratorios := far verTodos collect: [:rem | rem verLab].
dic := Dictionary new.
laboratorios asSet do: [:lab |
    dic at: lab put: (laboratorios occurrencesOf: lab)].
dic keysDo: [:lab |
    Transcript show: lab; show: ' : ';
        show: (dic at: lab) printString; cr].
```

Cuenta **objetos Remedio**, no unidades de stock. Dos remedios del mismo laboratorio cuentan 2, aunque uno tenga stock 100. Si se ejecuta después de las bajas, los eliminados ya no participan.

## Errores del material que conviene corregir

- Diapositivas 6–7: `size`, `isEmpty` y `asSet` no llevan `:`; `occurrencesOf:` se escribe con doble c.
- Diapositiva 7: `add:` al final describe OrderedCollection; no generalizarlo a una SortedCollection. `at:put:` reemplaza una posición existente en OrderedCollection.
- Diapositiva 23: escribir `ifNone: [nil]`; falta `:` y `^nil` tiene efecto de retorno del método, inadecuado como simple alternativa en Workspace.
- Diapositiva 26: recuperar el contador con `(dic at: cla)` y convertirlo a texto antes de concatenar o mostrar como cadena.

## Datos y resultados de control

Con umbral 5: un remedio de precio 100 y stock 4 pasa a 120; otro con stock 5 conserva 100. Cargar dos Bagó consecutivos permite detectar una baja que salta elementos. Buscar Lotrial cuando no existe debe informar la ausencia sin enviar mensajes a `nil`.

- [ ] Vacío y búsquedas sin coincidencias previstos.
- [ ] Se respeta `<`, sin incluir el stock igual al umbral.
- [ ] Se eliminan todos los candidatos consecutivos.
- [ ] Se diferencia filtrar de transformar.
- [ ] Se puede explicar cada clave y contador del diccionario.

Preguntas para defender: ¿por qué `do:` sirve para aumentar precios?, ¿por qué seleccionar antes de borrar?, ¿qué retorna `detect:`?, ¿qué elimina `asSet`?, ¿qué cuenta el diccionario?

Ejemplos y controles propuestos; no ejecutados en Dolphin.
