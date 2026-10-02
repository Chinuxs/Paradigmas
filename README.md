# Paradigmas de Programación

Material de la materia: teoría, práctica y trabajo integrador.

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
| Práctica 0: presentación | [Preparación y organización](practica/helpers/clase-00-organizacion-helper.md) |
| Práctica 1: POO | [Receta para modelar](practica/helpers/clase-01-modelado-helper.md) |
| Práctica 2: mensajes | [Receta de resolución y resultados de control](practica/helpers/clase-02-mensajes-helper.md) |
| Práctica 3: clases simples | [Remedio y Robot, paso a paso](practica/helpers/clase-03-clases-aplicaciones-helper.md) |

Orden sugerido: práctica 0 → teoría 1 + práctica 1 → teoría 2 + práctica 2 → teoría 3 + práctica 3. Intentar los ejercicios antes de consultar los resultados de control.

## Trabajo integrador grupal

- [Hoja de ruta grupal](trabajo-integrador/documentacion/hoja-de-ruta-grupal.md): requisitos, fechas, reparto para 3 o 4 integrantes, cronograma propuesto, matriz de seguimiento y preparación del coloquio.
- [Mapa de los ocho enunciados](trabajo-integrador/documentacion/mapa-de-enunciados.md): operaciones, reglas, casos límite y dudas por sistema.
- [Pautas originales 2026](trabajo-integrador/enunciado/Trabajo%20Integrador%20-%20Pautas%202026.pdf).
- [Enunciados originales 2026](trabajo-integrador/enunciado/Trabajo%20Integrador%20-%20Enunciados%202026.pdf).

**Pendientes importantes:** confirmar qué inciso(s) corresponde(n) al grupo y la fecha aplicable. Las pautas dicen **21/10/2026 - 23/10/2026**, mientras la práctica 0 menciona la **semana del 12/10**. No se encontró hora límite ni fecha de coloquio.

La práctica 1 remite a los ejercicios 1 y 2 del TP N.º 1, cuyo enunciado no está en el material recibido.

## Material incorporado

El 02/10/2026 se copiaron los 9 archivos desde `E:\UTN\Paradigmas`, conservando los originales y sus nombres:

- 3 PDFs de teoría en `teoria/material/`.
- 4 presentaciones de práctica en `practica/enunciados/`.
- 2 PDFs del integrador en `trabajo-integrador/enunciado/`.

Las presentaciones incluyen explicaciones y ejercicios; se conservaron completas. Los helpers son archivos Markdown que se pueden leer y editar desde el repositorio. `desarrollo/` y `entregables/` quedan preparados para el trabajo posterior del grupo.
