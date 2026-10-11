# Precio final polimorfico

Fuentes: [enunciado de aerolinea, p. 2](../enunciado/Trabajo%20Integrador%20-%20Enunciados%202026.pdf) para las formulas; [Herencia, pp. 19-21](../../teoria/material/6-POO-Herencia.pdf) para la operacion comun con implementaciones por subtipo. La expresion `self implemented by Subclass` de la p. 21 no es codigo Smalltalk valido para copiar literalmente. El mecanismo concreto `self subclassResponsibility` se contrasto con [Object de Dolphin 7.2](https://github.com/dolphinsmalltalk/Dolphin/blob/release/7.2/Core/Object%20Arts/Dolphin/Base/Object.cls#L1318); esa escritura no aparece en el PDF.

## Comportamiento

- `Vuelo>>precioFinal` delega la responsabilidad de implementacion a las subclases; ejecutarlo en un `Vuelo` base genera un error.
- `VueloNacional>>precioFinal` conserva el precio base o adiciona el diez por ciento si incluye equipaje.
- `VueloInternacional>>precioFinal` suma al precio base la tasa internacional.

Los tres metodos son de instancia. Los consumidores envian siempre `unVuelo precioFinal`, sin distinguir el tipo. No se modificaron los constructores ni inicializadores, ni se bloqueo `Vuelo new` mediante `isAbstract: true`. El menu de vuelos sigue pendiente de integracion.

## Actualizar la imagen

1. Comprobar que la imagen no tenga cambios propios sin exportar en estas clases.
2. Importar `Vuelo.cls`, luego `VueloNacional.cls` y `VueloInternacional.cls`.
3. Si se habia importado la version anterior, retirar en el Browser el metodo de instancia `precioFinalNac` de `VueloNacional` y `precioFinalInter` de `VueloInternacional`. Importar un archivo no elimina los metodos ausentes de esa nueva version.

No eliminar las clases ni reinicializar los objetos cargados. Actualizar cualquier Workspace propio que envie los nombres anteriores para que utilice `precioFinal`.

## Pruebas

Importar [PrecioFinalPrueba.cls](../desarrollo/pruebas/PrecioFinalPrueba.cls) despues de las tres clases de vuelos y evaluar:

```smalltalk
PrecioFinalPrueba ejecutar.
```

Devuelve `9` si pasan los casos de nacional con/sin equipaje, internacional con/sin tasa, coleccion mezclada, cambios de equipaje/tasa/precio base, precio base cero y responsabilidad de subclase en `Vuelo`. Las pruebas crean objetos independientes; no recorren el menu ni validan todos los requisitos del integrador.

El 11/10/2026 se verificaron los nueve casos en una copia aislada de Dolphin Professional 7.0, con salida 0, y se repitieron cinco casos de creacion sin regresiones. La prueba de actualizacion importo las versiones anteriores y luego las nuevas: los nombres viejos se conservaron hasta retirarlos en esa copia, y los objetos existentes mantuvieron sus datos y referencias y respondieron a `precioFinal`. Se confirmo que crear un `Vuelo` base sigue permitido, pero calcular su precio produce `#precioFinal is the responsibility of the subclass`. No se modifico la imagen ni la sesion abierta del usuario.
