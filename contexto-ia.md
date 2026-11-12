# Contexto y punto de continuación

Actualizado: **12/11/2026**. Estado compartido; los avances personales se registran en `.ia-local/contexto-personal.md`. El pedido actual prevalece sobre este resumen.

## Enfoque actual

- El usuario informó que el integrador fue aprobado y que rinde la práctica el **13/11/2026**. Quiere estudiar y resolver ejercicios de POO/Smalltalk, funcional/Haskell y lógica/Prolog con material de la cátedra.
- La portada se reorganizó por los tres paradigmas. Cada espacio en `estudio/poo/`, `estudio/funcional/` y `estudio/logica/` tiene `inicio.md`, `teoria.md` y `practica.md`: teoría breve, recetas, ejemplos, consejos y enlaces a originales. Los helpers detallados de POO mantienen sus rutas.
- A pedido del usuario se agregó `resumen.md` en cada tema, con teoría y práctica basadas en los originales de la cátedra, referencias por bloque a páginas/diapositivas y ejemplos de Farmacia, funciones sobre listas y autos/vuelos. Se relevaron los originales para comprobar selectores, consignas y datos. Las recetas y correcciones se identifican como apoyo de estudio; no se ejecutaron los fragmentos. Acceso directo desde la portada y las guías de cada tema.
- El usuario eligió priorizar **2024 y 2025**. A los cuatro modelos iniciales se sumaron ocho del lote `Mas Parciales`: **doce modelos prioritarios**. Dos variantes distintas llevan fecha 05/11/2024 y S21; no se unifican por fecha. Se mantienen otros años de apoyo; no se confirmó el formato del examen actual.
- La carpeta externa `WhatsApp Unknown 2026-11-11 at 08.02.45` contiene las mismas once imágenes ya incorporadas: cinco prácticos (incluido 13/02/2026), dos fotos del mismo teórico del 30/10/2025 (S22) y cuatro fotos de ejercicios. No confundir la fecha del archivo de WhatsApp con la del examen. Clasificación en `parciales/indiceImagenes.md`; ruta de estudio en `parciales/guiaParciales.md` y portada.
- En los modelos se repiten colecciones, cambios, bajas y diccionarios en POO; listas de listas en funcional; relaciones, filtros y cálculos en lógica.
- El 12/11 se copiaron y revisaron las **26 fotos** de `E:\UTN\Paradigmas\Parciales\Mas Parciales`: 16 prácticas y 10 teóricas. `parciales/indiceMasParciales.md` distingue fechas, variantes, repeticiones y recortes. Hospital 03/12/2025 y teórico 30/10/2025 ya tenían otras vistas; Clínica 17/11/2023 noche tiene una vista completa y otra parcial. Un teórico no tiene fecha visible.
- Patrones actualizados en `parciales/patronPracticos.md` y `patronTeoricos.md`: la muestra ampliada **sí incluye trazas prácticas de herencia en 2024–2025**, promedios, dos conteos por sublista y dos entradas anidadas con posible salida escalar. Los modelos lógicos recientes priorizan relaciones y cálculos; el de 2013 sí pide listas en Prolog. Las trazas de Departamento 2023 contienen una jerarquía cíclica impresa y hay ejemplos funcionales ambiguos: no corregirlos inventando requisitos.
- Una nueva foto clara de Hospital 03/12/2025 permitió corregir la lectura: baja de cirugía con 0 días y aumento de terapia intensiva. Se conserva la corrección de 2022 (contar elementos mayores que 4), más las ambigüedades de Inmobiliaria 2024 y encabezados de Congreso 2025.
- La clase 7, p. 8 y práctica diap. 8, excluye ciertas funciones de alto orden del parcial. Dos modelos piden desarrollar las funciones utilizadas sin primitivas de Haskell. Su vigencia y alcance en el examen actual no están confirmados.
- Las guías contienen ejemplos didácticos y trazas razonadas; no se ejecutaron en conjunto en Dolphin, Haskell ni Prolog. La verificación real de Haskell del 12/11 corresponde solamente al archivo inicial indicado a continuación.
- Entorno Haskell de esta copia verificado el 12/11: extensión VS Code 2.8.3 y sintaxis 3.8.0; GHCup 0.2.6.2, GHC/GHCi 9.10.3, Cabal 3.16.1.0 y HLS 2.14.0.0 instalados en `E:\haskellTools`. Instalador terminó con salida 0 y PATH de usuario comprobado. Pasaron ocho evaluaciones reales de `practica/resoluciones/funcional/practicaInicial.hs`; HLS seleccionó GHC 9.10.3 y verificó 1 archivo, 0 fallos. Reabrir VS Code para que tome el entorno nuevo; no se inspeccionó visualmente su interfaz. Guía: `estudio/funcional/entornoVscode.md`. Evidencia local: `.ia-local/haskellInstall/resultadoGhci.txt` y `resultadoHls.txt`. No atribuir estas pruebas a todos los ejemplos de las guías.
- Próximo paso académico: como el usuario quiere comenzar por funcional, practicar conteos (Clínica 06/11/2024), pares/impares (Club 2025), promedios (Laboratorio 2025), condiciones sobre sublistas y transformaciones. Después resolver modelos completos e incluir trazas de herencia. No registrar aprendizaje ni dominio por haber preparado materiales.

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
