# Mapa de los ocho enunciados

Fuente: [Trabajo Integrador - Enunciados 2026.pdf](../enunciado/Trabajo%20Integrador%20-%20Enunciados%202026.pdf), pp. 2–9. Este mapa ayuda a descomponer requisitos; el PDF conserva todos los atributos exigidos y es la referencia para implementarlos.

**Alcance confirmado para el grupo 17:** enunciado **1 — Aerolínea**, según el mensaje del tutor Gonzalo Baez compartido por el usuario el 03/10/2026. Los otros siete sistemas se conservan como referencia. Ver [hoja de ruta](hoja-de-ruta-grupal.md).

## 1. Aerolínea — p. 2

- Modelo propuesto: 
    * Aerolínea con vuelos; 
    * Vuelo nacional e internacional.
        **Cada vuelo  deberá  ser capaz  de  calcular  su  precio final según su tipo.**

- Comportamiento por tipo: 
    * Nacional = precio base más 10% si incluye equipaje; 
    * Internacional = precio base más tasa internacional.

- Operaciones Basicas por clases: 
    1. Aerolinea - Cargar aerolínea; 
    2. Aerolinea - Agregar vuelos respetando máximo **diario**; 
        **Validacion-Dura: El  sistema  debe  permitir  cargar  vuelos  siempre  que  no  se  supere  la  cantidad máxima  de  vuelos  diarios  definida  para  la  aerolínea.**
    3. Vuelos - Buscar por número único, modificar y eliminar.

- Procesos/Consultas a Procesar: 
    1. programados, 
    2. duración menor a 2 horas, 
    3. destino ingresado; 
    4. precio final promedio de disponibles y vuelos superiores al promedio; 
    5. vuelo de mayor duración; 
    6. facturación potencial de programados usando precio final.
    7. eliminar cancelados en conjunto; 
    8. diccionario de cantidad por estado.

- Notas: 
    -Bordes propuestos: 
        - duración de exactamente 2 horas no entra; 
        - dos días con cupos independientes; 
        - nacional con/sin equipaje.
        
- Consulta necesaria: significado de “disponibles” para promedio y población del listado superior al promedio.

## Cómo convertir este mapa en trabajo repartible

1. Confirmar el alcance y leer la página completa de cada sistema asignado.
2. Transcribir a la matriz de la hoja de ruta todos sus atributos y cada operación por separado.
3. Acordar los puntos ambiguos y registrar la respuesta docente.
4. Asignar responsable y revisor a cada fila.
5. Cubrir ambas variantes de objetos y sus umbrales en los casos de prueba.
6. Verificar cada resultado desde el menú y explicar qué iterador lo obtiene.

Los modelos, casos de borde y decisiones sugeridas son ayudas de planificación; todavía no hay implementación ni pruebas ejecutadas del integrador.
