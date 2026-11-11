# Contexto y punto de continuación

Actualizado: **11/11/2026**. Estado compartido; los avances personales se registran en `.ia-local/contexto-personal.md`. El pedido actual prevalece sobre este resumen.

## Enfoque actual

- El usuario informó que el integrador fue aprobado y que rinde la práctica el **13/11/2026**. Quiere estudiar y resolver ejercicios de POO/Smalltalk, funcional/Haskell y lógica/Prolog con material de la cátedra.
- La portada se reorganizó por los tres paradigmas. Cada espacio en `estudio/poo/`, `estudio/funcional/` y `estudio/logica/` tiene `inicio.md`, `teoria.md` y `practica.md`: teoría breve, recetas, ejemplos, consejos y enlaces a originales. Los helpers detallados de POO mantienen sus rutas.
- A pedido del usuario se agregó `resumen.md` en cada tema, con teoría y práctica basadas en los originales de la cátedra, referencias por bloque a páginas/diapositivas y ejemplos de Farmacia, funciones sobre listas y autos/vuelos. Se relevaron los originales para comprobar selectores, consignas y datos. Las recetas y correcciones se identifican como apoyo de estudio; no se ejecutaron los fragmentos. Acceso directo desde la portada y las guías de cada tema.
- `parciales/guiaParciales.md` organiza los modelos de 2022 a febrero de 2026 por tema y habilidad; `indiceImagenes.md` identifica las once imágenes adicionales. El usuario considera 2023 posiblemente parecido al suyo; el formato actual no está confirmado.
- En los modelos se repiten colecciones, cambios, bajas y diccionarios en POO; listas de listas en funcional; relaciones, filtros y cálculos en lógica.
- La clase 7, p. 8 y práctica diap. 8, excluye ciertas funciones de alto orden del parcial. Dos modelos piden desarrollar las funciones utilizadas sin primitivas de Haskell. Su vigencia y alcance en el examen actual no están confirmados.
- Las nuevas guías contienen ejemplos didácticos y trazas razonadas; no se ejecutaron en Dolphin, Haskell ni Prolog durante esta reorganización.
- Próximo paso: comenzar el estudio guiado del tema que elija el usuario y practicar de forma gradual. No registrar aprendizaje ni dominio por haber creado una guía.

## Organización y fuentes

- Fuentes originales en `teoria/material/` y `practica/enunciados/`; modelos en `parciales/`. El integrador tiene su propio acceso en [guiaIntegrador.md](trabajo-integrador/guiaIntegrador.md).
- La carpeta externa de recepción es `E:\UTN\Paradigmas`; el usuario seguirá agregando modelos en `E:\UTN\Paradigmas\Parciales`. Revisar también subcarpetas, comparar e incorporar cuando lo solicite; no hay sincronización automática.
- Faltan los enunciados independientes del TP N.º 1 y TP3 a los que remiten las prácticas. No inventarlos.
- [Organización del repo](docs/organizacion.md), [uso de IA](docs/uso-de-ia.md) y `AGENTS.md` contienen las pautas. Mantener nombres originales y usar camelCase para archivos nuevos.

## Integrador y preservación del trabajo

- Grupo 17, enunciado 1 Aerolínea, tutor Gonzalo Baez. Aprobación informada por el usuario el 11/11.
- Versión integrada al 26/10: cuatro clases de datos, `precioFinal` polimórfico y gestión en `AplicacionAerolinea.st` del Workspace, con `Date` y `Time` separados.
- Antecedentes, decisiones docentes e historial de verificaciones trasladados a [contextoIntegrador.md](trabajo-integrador/documentacion/contextoIntegrador.md). Evidencia de la ronda de 24 comprobaciones y 35 recorridos en [pruebasDateTime.md](trabajo-integrador/documentacion/pruebasDateTime.md).
- El 11/11 el usuario autorizó commit y push de todos los cambios al remoto. Se incluyen la reorganización, resúmenes, fuentes y parciales, junto con el cambio local previo de `trabajo-integrador/desarrollo/AplicacionAerolinea.st`, conservado tal como estaba. `.ia-local/` permanece ignorado por Git.
- Al revisar el diff para publicar se detectó un pendiente concreto en ese cambio previo: en el bloque `mayorDuracion`, `aerolinea verTodos   : [:vuelo |` carece de `do:`. No se corrigió ni se ejecutó el integrador en esta sesión; las pruebas históricas no verifican este cambio local.
