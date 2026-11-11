# ✈️ Trabajo integrador · Aerolínea

[← Portada de estudio](../README.md)

> **Estado:** aprobado, según informó el usuario el 11/11/2026.

Grupo 17 · Enunciado 1 · Tutor: Gonzalo Baez. Los datos del equipo y el seguimiento original están en la [hoja de ruta](documentacion/hoja-de-ruta-grupal.md).

## 🚀 Versión registrada

La versión integrada al 26/10/2026 usa cuatro clases y un Workspace. `Aerolinea` conserva datos y accesores; la gestión y la interfaz viven en bloques del Workspace. Los vuelos guardan `Date` y `Time` separados, y calculan su precio final por polimorfismo.

| Archivo | Responsabilidad |
| --- | --- |
| [Vuelo](desarrollo/Vuelo.cls) | Datos comunes y protocolo de vuelos. |
| [VueloNacional](desarrollo/VueloNacional.cls) | Datos particulares y precio nacional. |
| [VueloInternacional](desarrollo/VueloInternacional.cls) | Datos particulares y precio internacional. |
| [Aerolinea](desarrollo/Aerolinea.cls) | Datos de la aerolínea y colección de vuelos. |
| [AplicacionAerolinea.st](desarrollo/AplicacionAerolinea.st) | Interfaz y lógica ejecutadas en el Workspace. |

Para ejecutar, importar las cuatro clases en el orden de la tabla y evaluar el script completo en un Workspace. Usar una imagen limpia o una copia de respaldo: reimportar no convierte automáticamente los vuelos con fechas textuales ni retira métodos anteriores.

## 📚 Consignas, diseño y uso

| Necesito consultar… | Documento |
| --- | --- |
| Requisitos originales | [Enunciados](enunciado/Trabajo%20Integrador%20-%20Enunciados%202026.pdf), Aerolínea en p. 2; [pautas](enunciado/Trabajo%20Integrador%20-%20Pautas%202026.pdf). |
| Equipo y seguimiento | [Hoja de ruta grupal](documentacion/hoja-de-ruta-grupal.md). |
| Comparación de enunciados | [Mapa de los ocho sistemas](documentacion/mapa-de-enunciados.md). |
| Relaciones entre clases | [Diagrama](documentacion/diagramaClases.md). |
| Importación y menú | [Guía de Dolphin](documentacion/menuDolphinHelper.md). |
| Precio polimórfico | [Guía de precio final](documentacion/precioFinalHelper.md). |
| Decisiones y antecedentes técnicos | [Contexto del integrador](documentacion/contextoIntegrador.md). |

## 🧪 Validación registrada

La ronda del 26/10 sobre la versión integrada registró **24 comprobaciones de validadores y 35 recorridos del Workspace** en una copia temporal de Dolphin. Su alcance está en [pruebasDateTime.md](documentacion/pruebasDateTime.md).

La prueba correspondiente es [WorkspaceDateTimePrueba.cls](desarrollo/pruebas/WorkspaceDateTimePrueba.cls); ver también el [README de pruebas](desarrollo/pruebas/README.md). Los resultados históricos de otras arquitecturas no validan cambios posteriores.

<details>
<summary>🗃️ Revisiones y diseños anteriores</summary>

- [Validación de menú y diálogos](documentacion/validacionMenuDolphin.md).
- [Carga, consultas y bajas](documentacion/consultasAerolineaHelper.md).
- [Revisión de AplicacionAerolinea](documentacion/revisionAplicacionAerolinea.md).
- [Revisión conjunta de Aerolinea](documentacion/revisionAerolinea.md).
- [Listado histórico de métodos](desarrollo/aerolineaMetodos.txt).

Estos documentos pueden describir criterios o código reemplazados. `desarrollo/legado/` conserva la clase de aplicación anterior y sus pruebas: no se importa para ejecutar la versión de Workspace.

</details>

## 🗂️ Organización

`enunciado/` guarda los originales; `desarrollo/`, el código; `documentacion/`, las decisiones y evidencias; `entregables/`, las versiones preparadas para entregar.
