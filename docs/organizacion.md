# 🗂️ Cómo se organiza este repositorio

[← Portada](../README.md)

## Estudiar por tema

```text
estudio/
  poo/                 Objetos y Smalltalk
  funcional/           Funciones y listas en Haskell
  logica/              Hechos, reglas y consultas en Prolog
```

Cada espacio tiene `inicio.md` para orientarse, `resumen.md` para repasar teoría y práctica, `teoria.md` para entender con más detalle y `practica.md` para resolver con ejemplos y consejos. Las fuentes se enlazan desde el tema correspondiente.

## Consultar el material completo

| Carpeta | Contenido |
| --- | --- |
| `teoria/material/` | PDFs y presentaciones originales de teoría. |
| `teoria/apuntes/` | Helpers detallados de POO, con referencias y correcciones. |
| `practica/enunciados/` | Presentaciones y ejercicios originales de práctica. |
| `practica/helpers/` | Recetas detalladas de las prácticas de POO. |
| `practica/resoluciones/` | Espacio para soluciones organizadas por guía o tema. |
| `parciales/` | Modelos anteriores y apoyo recibido; [entrar](../parciales/guiaParciales.md). |
| `trabajo-integrador/` | Sistema de Aerolínea aprobado; [entrar](../trabajo-integrador/guiaIntegrador.md). |

Las guías son explicaciones de estudio. Una propuesta de solución no equivale a un requisito de la cátedra ni a código ejecutado; cada guía indica fuentes y alcance de sus comprobaciones.

## Agregar archivos

- Usar `camelCase`, sin espacios ni tildes, para nombres nuevos: `repasoListas.md`.
- Mantener nombres existentes y nombres originales recibidos, incluidos sus espacios y tildes.
- Las clases Smalltalk y sus `.cls` conservan inicial mayúscula: `Aerolinea.cls`.
- Guardar código del integrador en `desarrollo/`, decisiones en `documentacion/` y entregas en `entregables/` dentro del integrador.
- En una nueva guía de práctica, usar el mismo nombre para su enunciado y carpeta de resolución cuando corresponda.
- Los `.gitkeep` solo conservan carpetas vacías; se pueden retirar cuando tengan contenido.

## Fuentes y antecedentes

El 02 y 03/10/2026 se incorporó el material inicial de POO e integrador: 16 fuentes y 14 helpers. El 11/11 se sumaron funcional, lógica, prácticas 6–8 y parciales históricos. La portada pasó a organizar el estudio por los tres paradigmas.

Los dos originales de teoría numerados 4 son distintos: UML y Biblioteca. Los enunciados independientes del TP N.º 1 y TP3 no están entre los archivos recibidos; las presentaciones de práctica remiten a ellos.

La carpeta externa de recepción de esta copia es `E:\UTN\Paradigmas`. Los archivos se incorporan al repo conservando los originales; el repo no se sincroniza automáticamente con esa carpeta.

## Trabajar con un asistente

[AGENTS.md](../AGENTS.md) fija las pautas; [contexto-ia.md](../contexto-ia.md) guarda el estado compartido. El seguimiento personal, si existe, se guarda en `.ia-local/contexto-personal.md` y no se comparte por Git.

Para empezar una sesión:

> Leé AGENTS.md y contexto-ia.md. Si existe .ia-local/contexto-personal.md, leelo también. Quiero estudiar [tema] y practicar [ejercicio]. Explicame paso a paso y, en repaso activo, haceme una pregunta por vez.

Más detalles en [uso de IA](uso-de-ia.md).
