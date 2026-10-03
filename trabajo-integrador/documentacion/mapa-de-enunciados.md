# Mapa de los ocho enunciados

Fuente: [Trabajo Integrador - Enunciados 2026.pdf](../enunciado/Trabajo%20Integrador%20-%20Enunciados%202026.pdf), pp. 2–9. Este mapa ayuda a descomponer requisitos; el PDF conserva todos los atributos exigidos y es la referencia para implementarlos.

**Alcance confirmado para el grupo 17:** enunciado **1 — Aerolínea**, según el mensaje del tutor Gonzalo Baez compartido por el usuario el 03/10/2026. Los otros siete sistemas se conservan como referencia. Ver [hoja de ruta](hoja-de-ruta-grupal.md).

## 1. Aerolínea — p. 2

- Modelo propuesto: aerolínea con vuelos; vuelo nacional e internacional.
- Comportamiento por tipo: nacional = precio base más 10% si incluye equipaje; internacional = precio base más tasa internacional.
- Operaciones: cargar aerolínea; agregar vuelos respetando máximo **diario**; buscar por número único, modificar y eliminar.
- Consultas: programados, duración menor a 2 horas, destino ingresado; precio final promedio de disponibles y vuelos superiores al promedio; vuelo de mayor duración; facturación potencial de programados usando precio final.
- Cierre: eliminar cancelados en conjunto; diccionario de cantidad por estado.
- Bordes propuestos: duración de exactamente 2 horas no entra; dos días con cupos independientes; nacional con/sin equipaje.
- Consulta necesaria: significado de “disponibles” para promedio y población del listado superior al promedio.

## 2. Streaming — p. 3

- Modelo propuesto: plataforma con contenidos; película y serie.
- Maratón: película con duración **<= 120** y calificación **>= 7**; serie finalizada, **<= 3** temporadas y calificación **>= 7**.
- Operaciones: agregar sin superar suma de almacenamiento; buscar por código, modificar y eliminar.
- Consultas: calificación >= 7, género indicado, recomendables para maratón; tamaño promedio y contenidos superiores; contenido de mayor calificación.
- Cierre: eliminar no disponibles; diccionario de cantidad por género.
- Bordes propuestos: 120 minutos, 3 temporadas y nota 7 califican si se cumplen las demás condiciones; editar tamaño también debe respetar capacidad.
- Consulta útil: criterio para empate de mayor calificación y unicidad del código, que no se explicita como en otros incisos.

## 3. Concesionaria — p. 4

- Modelo propuesto: concesionaria con vehículos; automóvil y motocicleta.
- Seguro: automóvil = 3% del precio, más 1% del precio si año < 2015; motocicleta = 2%, más 1% del precio si cilindrada > 300 cc. Los adicionales son puntos porcentuales sobre el precio.
- Operaciones: agregar sin superar capacidad de exposición; consultar, modificar y eliminar por patente única.
- Consultas: año < 2015; kilometraje < 30.000; marca indicada; promedio de precios de disponibles y vehículos que superen **1,5 veces** ese promedio; disponible de menor precio; total de seguros de disponibles.
- Cierre: eliminar vendidos; diccionario de **disponibles** por marca.
- Bordes propuestos: año 2015 sin adicional; 300 cc sin adicional; 30.000 km fuera del filtro estricto.
- Consulta necesaria: población del filtro sobre 1,5 veces el promedio y cómo cuentan los estados para la capacidad. El porcentaje de comisión es un dato exigido, aunque el texto no pide un cálculo de comisión.

## 4. Parque de diversiones — p. 5

- Modelo propuesto: parque con atracciones; mecánica y acuática.
- Supervisión especial: mecánica con velocidad > 80 km/h; acuática con profundidad > 1,50 m **o** salvavidas obligatorio.
- Operaciones: agregar; buscar por código único, modificar y eliminar; listado completo.
- Consultas: altura mínima <= 1,30 m; operativas; supervisión especial; capacidad promedio por turno y atracciones superiores; porcentajes por cada uno de los tres estados.
- Cierre: eliminar fuera de servicio; diccionario por sector.
- Bordes propuestos: 80 km/h no activa supervisión por velocidad; 1,50 m sin salvavidas obligatorio tampoco; con salvavidas obligatorio sí.
- No inferir un cupo de atracciones a partir de la capacidad diaria de visitantes: son datos diferentes.

## 5. Museo — p. 6

- Modelo propuesto: museo con obras; pintura y escultura.
- Cuidados especiales: pintura con alguna dimensión > 2 m; escultura con peso > 200 kg.
- Operaciones: cargar; consultar, modificar y eliminar por código único; listado completo.
- Consultas: año < 1950; valor < 500.000; cuidados especiales; sala ingresada; promedio de obras en exhibición y obras superiores; obra de mayor valor; antigüedad calculada por cada obra desde su año de creación.
- Cierre: eliminar retiradas; diccionario por sala y mostrarlo.
- Bordes propuestos: exactamente 2 m o 200 kg no activa cuidado; 1950 y 500.000 quedan fuera de los filtros estrictos.
- Consulta necesaria: población del listado superior al promedio. Para antigüedad, usar el año de referencia de ejecución y acordar tratamiento de años futuros.

## 6. Festival de música — p. 7

- Modelo propuesto: festival con espectáculos; solista y banda.
- Costo: solista = caché × 1,10; banda = caché × (1 + 0,02 × cantidad de integrantes).
- Operaciones: agregar sin superar presupuesto sumando **costos totales**, buscar por código único, modificar y eliminar.
- Consultas: confirmados, género ingresado, duración < 45 minutos; promedio de costos totales de confirmados y espectáculos superiores; espectáculo de mayor costo total; presupuesto disponible.
- Cierre: eliminar cancelados; diccionario de programados por escenario.
- Bordes propuestos: banda de 5 integrantes → caché × 1,10; exactamente 45 minutos fuera del filtro; presupuesto exacto permitido.
- Consultas necesarias: significado de “programados”, tratamiento presupuestario de cancelados antes de eliminarlos y población del filtro superior al promedio.

## 7. Centro deportivo — p. 8

- Modelo propuesto: centro con deportistas; amateur y profesional.
- Cuota: amateur = 100% de cuota base del centro; profesional = 60%.
- Operaciones: agregar sin superar capacidad; buscar por número de socio único, modificar y eliminar.
- Consultas: activos, menores de 18, disciplina ingresada; promedio de horas semanales y quienes lo superen; persona con más horas; porcentajes profesional/amateur; recaudación de **activos** consultando la cuota de cada uno.
- Cierre: eliminar inactivos; diccionario de **activos** por disciplina.
- Bordes propuestos: 18 años fuera del filtro de menores; base 1.000 → amateur 1.000 y profesional 600; inactivos no aportan recaudación.
- Decisión de diseño: cómo recibe cada deportista la cuota base, evitando duplicarla de forma inconsistente. Registrar cómo se resuelven empates y población de porcentajes.

## 8. Mensajería — p. 9

- Modelo propuesto: empresa con envíos; estándar y express.
- Precio final: estándar = precio base del envío; express Normal = base × 1,15; express Alta = base × 1,25.
- Operaciones: agregar respetando máximo **diario**; consultar, modificar y eliminar por código único.
- Consultas: pendientes; peso > 20 kg; destino; precio final promedio de activos y envíos superiores; activo de mayor peso; facturación total de activos con precios finales.
- Operación de express: calcular días restantes hasta la fecha límite garantizada.
- Cierre: eliminar cancelados; diccionario de registrados por estado.
- Bordes propuestos: exactamente 20 kg fuera del filtro; fecha límite hoy → 0 días bajo una diferencia de fechas por día; probar fecha vencida y acordar cómo mostrarla.
- Consultas necesarias: definición de “activos”, población superior al promedio y relación entre costo base de la empresa y precio base del envío. La fórmula explícita usa el precio base del envío.

## Cómo convertir este mapa en trabajo repartible

1. Confirmar el alcance y leer la página completa de cada sistema asignado.
2. Transcribir a la matriz de la hoja de ruta todos sus atributos y cada operación por separado.
3. Acordar los puntos ambiguos y registrar la respuesta docente.
4. Asignar responsable y revisor a cada fila.
5. Cubrir ambas variantes de objetos y sus umbrales en los casos de prueba.
6. Verificar cada resultado desde el menú y explicar qué iterador lo obtiene.

Los modelos, casos de borde y decisiones sugeridas son ayudas de planificación; todavía no hay implementación ni pruebas ejecutadas del integrador.
