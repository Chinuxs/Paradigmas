# Pruebas de la variante Date y Time

## Integracion verificada en desarrollo (26/10/2026)

La version Date/Time fue integrada en los cinco archivos principales de `desarrollo/`. Se preservaron campos obligatorios, enteros, precios, estados, booleanos y calendario. La bateria vigente es `desarrollo/pruebas/WorkspaceDateTimePrueba.cls`; las baterias de arquitecturas anteriores estan en `desarrollo/legado/pruebas/`.

Ultima ejecucion: 26/10/2026, 15:40 (hora local), sobre los archivos actuales, incluido `esBisiesto` con `Date daysInYear:` y su comentario. Pasaron las 24 comprobaciones de validadores y los 35 recorridos. Se verificaron la fecha de escritura de la salida nueva, la ausencia de archivo de errores y el cierre del proceso de pruebas. Se uso una copia temporal de la imagen y del script de ejecucion.

Se repitio la ejecucion aislada contra los archivos principales, con resultado:

```text
Validadores Workspace: OK
OK: 35 recorridos del Workspace (consultas, cancelaciones, reintentos, edicion, cupos y bajas)
```

Los 35 recorridos ejecutan el codigo real del Workspace sustituyendo solo las llamadas de dialogo por colas y verificando que las opciones existan y las entradas se consuman. Incluyen nueve consultas con datos y en vacio, quince cancelaciones de campos de texto al cargar, once cancelaciones al editar, cancelaciones de booleanos en ambos subtipos, edicion de todos los campos comunes y particulares, ingreso de `No`, reintentos ante vacio/entero/fecha/precio invalidos, cambio de fecha sin cupo, cambio de hora con dia completo y ambas bajas. El promedio de la muestra se verifico en 2063607.2 y la facturacion de Programados en 8621035; en vacio ambos son cero. No es una inspeccion visual de los dialogos.

Se conservaron las fechas repetidas de la muestra y se corrigio su comentario. Cuando el cupo impide cargar diez vuelos se informa `Precarga parcial` con la cantidad aceptada; no se omiten los rechazos silenciosamente. La prueba con maximo uno verifica ese aviso.

La migracion de archivos queda completa. La apariencia de Date/Time depende de `displayString` en Dolphin; no se fuerza un formato de salida adicional. Las secciones siguientes conservan la primera ronda y sus pendientes historicos, ya cubiertos por la integracion anterior.

## Ronda automatizada del 26/10/2026

Ejecutada por el asistente con Dolphin7.exe, una copia temporal de DPRO.img7 y las opciones `-q -u -f`. Se importaron las cuatro clases de `desarrollo/` y `pruebas/WorkspaceDateTimePrueba.cls`. La imagen temporal se cerro sin guardar. No se utilizo la imagen del usuario.

Resultado registrado:

```text
Dominio: OK
Validadores Workspace: OK
```

La prueba de dominio anterior contenía ocho escenarios, pero dependía de una `Aerolinea` con lógica y quedó archivada. La cobertura vigente equivalente está en los 35 recorridos del Workspace: fecha/hora y duración, cupo diario, número único, modificación, consultas, precios, estados, bajas, límites de duración, cupo cero y fechas de otros meses/años.

Ademas se evaluaron los bloques reales de inicializacion del Workspace, antes del bucle del menu, para comprobar 24 entradas de enteros, precios, fechas y recorte de espacios. Se incluyeron siglos bisiestos, dias imposibles, horario fuera de rango y anio cero. Los dialogos interactivos y las nueve consultas completas del menu todavia requieren cobertura adicional; esta ronda no los verifica.

Ambos Workspace actuales admiten precios con mas de dos decimales (por ejemplo `1.234`). Esto contradice el limite mencionado en documentos antiguos, pero no es una perdida causada por Date/Time. Se conserva el comportamiento actual mientras se migra.

La precarga tiene cuatro fechas corregidas (1 a 4 de diciembre), mientras los vuelos restantes conservan las fechas recibidas (10 a 13, con repeticiones). El comentario de un vuelo por dia no coincide con todos los datos; falta resolver la muestra antes de promover la variante.

## Pendientes antes de promover

- Probar cancelaciones y reintentos de los dialogos y todos los campos editables.
- Comprobar las nueve consultas con datos y coleccion vacia, y las dos bajas desde el menu.
- Revisar la precarga y comprobar el resultado de cargas rechazadas por cupo.
- Fusionar Date/Time sobre el Workspace principal y volver a verificar sus validaciones.

El script de ejecucion y la salida estan en `.ia-local/ejecutarDateTime.st` y `.ia-local/resultadoDateTime.txt` en esta copia. Para repetir la bateria compartida manualmente, importar las cuatro clases de `desarrollo/`, la prueba del Workspace y evaluar `WorkspaceDateTimePrueba ejecutarArchivo: ...`.
