# Paradigmas de Programación

Material de la materia: teoría, práctica y trabajo integrador.

## Trabajar en equipo con IA

Las instrucciones comunes están en [AGENTS.md](AGENTS.md) y el estado del trabajo en [contexto-ia.md](contexto-ia.md). Se comparten junto al código mediante Git. Consultá la [guía para usar distintos asistentes](docs/uso-de-ia.md) al preparar tu copia local.

### Prompt para empezar

Copiá este mensaje en tu asistente con el repo abierto. Si usás un chat sin acceso a archivos locales, adjuntá `AGENTS.md` y `contexto-ia.md`.

> Me sumo al equipo de este proyecto. Leé AGENTS.md y contexto-ia.md, seguí las pautas y resumime qué estamos construyendo, en qué estado está y qué queda pendiente. Consultá los archivos disponibles antes de pedirme información. Quiero trabajar en: [tu tarea, o «ayudame a elegir una tarea pendiente»].

## Estructura

```text
teoria/
  apuntes/                 Resúmenes y notas de clase
  material/                Diapositivas, bibliografía y PDFs
practica/
  enunciados/              Guías y consignas de ejercicios
  helpers/                 Recetas, tips y controles por clase práctica
  resoluciones/            Soluciones organizadas por guía o tema
trabajo-integrador/
  enunciado/               Consigna, pautas y criterios de evaluación
  desarrollo/             Código y archivos de trabajo
  documentacion/          Informe, diagramas y decisiones del equipo
  entregables/             Versiones preparadas para entregar
```

## Cómo organizar los archivos

- Usar nombres en minúsculas, sin espacios ni tildes: `unidad-01-introduccion.md`.
- En práctica, usar el mismo nombre para la guía y su resolución: `enunciados/guia-01.pdf` y `resoluciones/guia-01/`.
- Si hay varias entregas del integrador, crear `entregables/entrega-01/`, `entregables/entrega-02/`, etc.
- Mantener el trabajo en curso en `desarrollo/` y preparar en `entregables/` los archivos que pida cada entrega.
- Agregar carpetas por unidad o paradigma a medida que se necesiten.

Los archivos `.gitkeep` permiten guardar carpetas vacías en Git. Se pueden eliminar cuando esas carpetas tengan contenido.

## Guías para estudiar y practicar

Cada helper enlaza su archivo fuente e indica páginas o diapositivas. Incluye explicaciones propias y señala erratas del material. Los ejemplos de código todavía no se ejecutaron en Dolphin.

| Material | Helper |
| --- | --- |
| Teoría 1: introducción a POO | [Conceptos, modelado y repaso](teoria/apuntes/01-poo-introduccion-helper.md) |
| Teoría 2: mensajes y control | [Sintaxis, precedencia y estructuras](teoria/apuntes/02-smalltalk-mensajes-control-helper.md) |
| Teoría 3: clase Libro | [Clases, protocolos y actividad de puntos](teoria/apuntes/03-clase-libro-helper.md) |
| Teoría 4: UML | [Diagramas de clases, secuencias y herramientas](teoria/apuntes/04-uml-helper.md) |
| Teoría 4: clase Biblioteca | [Clases compuestas, búsquedas y bajas](teoria/apuntes/04-clase-biblioteca-helper.md) |
| Teoría 5: colecciones | [Colecciones, iteradores y diccionarios](teoria/apuntes/05-colecciones-helper.md) |
| Teoría 6: herencia | [Polimorfismo, self y super](teoria/apuntes/06-herencia-helper.md) |
| Ejemplo completo de herencia | [Banco: integración y correcciones](teoria/apuntes/06-ejemplo-herencia-banco-helper.md) |
| Práctica 0: presentación | [Preparación y organización](practica/helpers/clase-00-organizacion-helper.md) |
| Práctica 1: POO | [Receta para modelar](practica/helpers/clase-01-modelado-helper.md) |
| Práctica 2: mensajes | [Receta de resolución y resultados de control](practica/helpers/clase-02-mensajes-helper.md) |
| Práctica 3: clases simples | [Remedio y Robot, paso a paso](practica/helpers/clase-03-clases-aplicaciones-helper.md) |
| Práctica 4: clases compuestas | [Farmacia, iteradores y diccionario](practica/helpers/clase-04-colecciones-farmacia-helper.md) |
| Práctica 5: colecciones y herencia | [Bajas, trazas y modelo de Facultad](practica/helpers/clase-05-herencia-helper.md) |

Orden sugerido: práctica 0 → teoría 1 + práctica 1 → teoría 2 + práctica 2 → teoría 3 + práctica 3 → UML y Biblioteca → colecciones + práctica 4 → herencia + práctica 5 → ejemplo completo de Banco. Intentar los ejercicios antes de consultar los resultados de control.

Los dos PDFs de teoría numerados 4 se conservan con sus nombres originales; tienen helpers separados. Sobre UML, el material revisado no recomienda una herramienta específica: ver [alcance y fuentes de esa revisión](teoria/apuntes/04-uml-helper.md#qué-estudiar-y-qué-herramienta-pide-la-cátedra).

## Trabajo integrador grupal

- [Hoja de ruta grupal](trabajo-integrador/documentacion/hoja-de-ruta-grupal.md): grupo 17, sus tres integrantes, tutor, fechas, reparto propuesto, matriz de seguimiento y preparación del coloquio.
- [Mapa de los ocho enunciados](trabajo-integrador/documentacion/mapa-de-enunciados.md): operaciones, reglas, casos límite y dudas por sistema.
- [Pautas originales 2026](trabajo-integrador/enunciado/Trabajo%20Integrador%20-%20Pautas%202026.pdf).
- [Enunciados originales 2026](trabajo-integrador/enunciado/Trabajo%20Integrador%20-%20Enunciados%202026.pdf).

**Confirmado por el usuario:** grupo **17**, enunciado **1 — Aerolínea**, tutor **Gonzalo Baez**; rigen las fechas de las pautas, **21/10/2026 y 23/10/2026**. Integrantes: Gabriel Matias Piccin, César Augusto Romero y Jorge Murga. Quedan pendientes la distribución de esas fechas para el grupo, el horario, canal/formato de entrega, versión de Dolphin y fecha del coloquio.

La práctica 1 remite a los ejercicios 1 y 2 del TP N.º 1 y la práctica 4 remite al TP3. Sus enunciados independientes no están en el material recibido; los helpers no inventan esas consignas.

## Material incorporado

El 02/10/2026 se copiaron los 9 archivos desde `E:\UTN\Paradigmas`, conservando los originales y sus nombres:

- 3 PDFs de teoría en `teoria/material/`.
- 4 presentaciones de práctica en `practica/enunciados/`.
- 2 PDFs del integrador en `trabajo-integrador/enunciado/`.

El **03/10/2026** se incorporaron otros **7 archivos** desde la misma carpeta, conservando originales y nombres:

- 5 PDFs de teoría: `4-POO-UML.pdf`, `4-POO-ClaseBiblioteca.pdf`, `5-POO-Colecciones.pdf`, `6-POO-Herencia.pdf` y `Ejemplo completo de herencia.pdf`.
- 2 presentaciones de práctica: `Clase 4.pptx` y `Clase 5  - Practica.pptx`.
- Se agregó un helper por archivo, con referencias a páginas/diapositivas, recetas, controles, preguntas y correcciones. Hay **16 fuentes originales y 14 helpers** en total.

Las presentaciones incluyen explicaciones y ejercicios; se conservaron completas. Los helpers son archivos Markdown que se pueden leer y editar desde el repositorio. `desarrollo/` y `entregables/` quedan preparados para el trabajo posterior del grupo.
