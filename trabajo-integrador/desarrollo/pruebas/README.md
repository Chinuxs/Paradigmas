# Pruebas vigentes

Importar primero `Vuelo`, `VueloNacional`, `VueloInternacional` y `Aerolinea` desde `desarrollo/`, luego `WorkspaceDateTimePrueba.cls`.

```smalltalk
WorkspaceDateTimePrueba ejecutarArchivo: 'E:\UTN\Paradigmas\WSParadigmas\Paradigmas\trabajo-integrador\desarrollo\AplicacionAerolinea.st'.
```

Ajustar la ruta absoluta a la copia local. Ejecutar en una imagen de pruebas: el arnes usa nombres globales auxiliares `DTTextos`, `DTOpciones` y `DTMensajes` para las colas de dialogos. Evalua el Workspace real sustituyendo los dialogos por entradas programadas; no comprueba la apariencia de ventanas.

Las pruebas anteriores a Date/Time y la prueba de dominio acoplada a la arquitectura anterior están en `../legado/pruebas/` y no corresponden al modelo vigente. Resultados y limitaciones en `../../documentacion/pruebasDateTime.md`.
