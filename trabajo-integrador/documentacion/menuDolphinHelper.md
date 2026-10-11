# Menu inicial en Dolphin

Fuentes: [pautas 2026, p. 2](../enunciado/Trabajo%20Integrador%20-%20Pautas%202026.pdf), [enunciado de aerolinea, p. 2](../enunciado/Trabajo%20Integrador%20-%20Enunciados%202026.pdf), [clase Libro, pp. 4 y 9-10](../../teoria/material/3-%20POO-ClaseLibro.pdf) para la creacion e inicializacion explicita, y referencia local `E:\UTN\Paradigmas\TPIntegrador_Ejemplo\actualizado6.st`, lineas 82-98. La referencia local esta fuera del repo.

Esta primera version implementa cargar aerolinea, consultar sus datos y salir. Todavia no es el integrador completo: faltan integrar las operaciones de vuelos y las consultas del enunciado. La organizacion en una clase de aplicacion fue solicitada por el usuario; su aceptacion docente y acuerdo grupal siguen pendientes.

## Archivos y responsabilidades

| Archivo | Responsabilidad |
| --- | --- |
| [Aerolinea.cls](../desarrollo/Aerolinea.cls) | Datos de la aerolinea y coleccion de vuelos |
| [AplicacionAerolinea.cls](../desarrollo/AplicacionAerolinea.cls) | Dialogos, ciclo del menu y referencia a la aerolinea |
| [iniciarAplicacionAerolinea.st](../desarrollo/iniciarAplicacionAerolinea.st) | Una instruccion de arranque |

Los nombres nuevos usan `camelCase`; las clases y sus archivos `.cls` llevan inicial mayuscula, como `AplicacionAerolinea.cls`. Este cambio no modifica las clases del dominio ni `PruebaWS.st`.

## Importar y arrancar

1. Abrir la imagen de Dolphin Smalltalk 7 que utiliza el equipo.
2. Importar `Aerolinea.cls` con la herramienta de carga de clases de Dolphin.
3. Importar `AplicacionAerolinea.cls` con la misma herramienta. Si `Aerolinea` ya esta cargada con cambios propios, comprobar su version antes de volver a importarla.
4. Abrir `iniciarAplicacionAerolinea.st` en un Workspace.
5. Seleccionar su unica expresion y ejecutar **Evaluate it / Ctrl + E**:

```smalltalk
AplicacionAerolinea crear iniciar.
```

Los `.cls` contienen definiciones para importar; el `.st` de arranque contiene una expresion para evaluar. Guardar el Workspace conserva su texto.

Si ya se importo la version anterior de `AplicacionAerolinea`, eliminar su metodo de instancia `initialize` en el Browser antes de importar esta version. El archivo actualizado define `init`; no conserva un inicializador automatico propio. No eliminar la clase `Aerolinea` ni sus objetos.

## Recorrido y referencias

El menu ofrece **Cargar aerolinea**, **Ver datos de la aerolinea** y **Salir**. Cancelar o cerrar el selector de opciones tambien termina el menu.

La carga solicita nombre, anio de fundacion, pais de origen, codigo y maximo diario. Recorta espacios externos, rechaza texto vacio y solicita nuevamente entradas numericas invalidas. El anio debe ser un entero mayor o igual a 1 y el maximo un entero mayor o igual a 0; estas son validaciones de esta primera version, no limites adicionales confirmados por la catedra. Un maximo cero expresa que no admite vuelos.

Cancelar cualquier dato vuelve al menu sin crear una aerolinea parcial. La aerolinea se publica solo cuando la carga termina. Una vez cargada, elegir otra vez la carga informa que ya existe y conserva el objeto y sus vuelos.

El metodo de clase `crear` usa `^(super new) init`, siguiendo el esquema de `crearLibroIsbn:...` de la p. 9: crea una instancia y le envia explicitamente el inicializador de instancia. `init` prepara su estado y devuelve `self`; `iniciar` ejecuta el ciclo sin reinicializar la aerolinea. No se redefine `new` ni se utiliza un `initialize` propio. `cargarAerolinea` crea el objeto y `mostrarDatosAerolinea` consulta sus mensajes existentes. Las reglas de vuelos deben implementarse en las clases del dominio al integrar las proximas opciones.

Para inspeccionar o reabrir la misma aplicacion durante una sesion, usar una variable de Workspace sin declararla entre barras:

```smalltalk
aplicacion := AplicacionAerolinea crear.
aplicacion iniciar.
```

Despues de salir, evaluar solamente `aplicacion iniciar` conserva su aerolinea. No repetir `aplicacion init`: ese mensaje restablece el estado y descarta la referencia a la aerolinea cargada. Volver a evaluar la asignacion con `crear`, o el archivo de arranque completo, crea otra aplicacion. No se implemento persistencia entre sesiones.

## Verificacion

El 11/10/2026 se importaron `Aerolinea.cls`, `AplicacionAerolinea.cls` y la clase de pruebas en una copia aislada de la imagen local de **Dolphin Professional 7.0**. Las pruebas terminaron con codigo de salida 0 y diez casos completados. La imagen y la sesion abierta del usuario no se modificaron. Esta verificacion local no confirma la version que debe usar todo el grupo.

Se repitieron los diez casos con el metodo de clase `crear` y la inicializacion explicita `init`, nuevamente con salida 0. Tambien se comprobo que importar esta version sobre la anterior conserva el metodo viejo `initialize`; en la copia aislada se elimino antes de las pruebas, como indica el paso de actualizacion.

Las pruebas ejecutan el ciclo del menu con entradas programadas; no abren ni comprueban visualmente los dialogos. El recorrido manual sigue pendiente.

Esta adaptacion cambia solamente la inicializacion. La revision de `trimBlanks`, `allSatisfy:`, `String streamContents:` y `printString` frente a los recursos de la catedra sigue pendiente; no se afirma que toda la clase use exclusivamente mensajes de las fuentes originales.

Para ejecutar los casos programados, importar [AplicacionAerolineaPrueba.cls](../desarrollo/pruebas/AplicacionAerolineaPrueba.cls) despues de las dos clases anteriores y evaluar:

```smalltalk
AplicacionAerolineaPrueba ejecutar.
```

La clase de pruebas ejercita `crear` e `init`, verifica que `init` devuelve la misma instancia, reemplaza los dialogos por entradas programadas y comprueba cancelacion en los cinco campos, validacion, consulta antes de cargar, opcion invalida, maximo cero y conservacion de las referencias al reabrir el menu. Devuelve `10` si termina sin errores. No es necesaria para usar el menu.

Recorrido manual pendiente: consultar antes de cargar, cancelar a mitad de una carga, completar una carga, consultar sus datos, intentar cargar otra aerolinea y salir tanto por la opcion como por Cancelar.

Referencia de API: [ChoicePrompter de Dolphin 7.2](https://github.com/dolphinsmalltalk/Dolphin/blob/release/7.2/Core/Object%20Arts/Dolphin/MVP/Presenters/Prompters/ChoicePrompter.cls). `choices:caption:` devuelve la opcion elegida o `nil` al cancelar.
