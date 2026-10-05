# Mapa del enunciado asignado

Fuente: [Trabajo Integrador - Enunciados 2026.pdf](../enunciado/Trabajo%20Integrador%20-%20Enunciados%202026.pdf), pp. 2–9. Este mapa ayuda a descomponer requisitos; el PDF conserva todos los atributos exigidos y es la referencia para implementarlos.

**Alcance confirmado para el grupo 17:** enunciado **1 — Aerolínea**, según el mensaje del tutor Gonzalo Baez compartido por el usuario el 03/10/2026. Los otros siete sistemas quedan como referencia en el PDF. Ver [hoja de ruta](hoja-de-ruta-grupal.md).

## 1. Aerolínea — p. 2

### Modelo base

| Elemento | Responsabilidad |
| --- | --- |
| Aerolínea | Carga sus datos, administra la colección de vuelos y aplica el máximo diario. |
| Vuelo | Define los datos comunes y responde el mensaje para calcular su precio final. |
| Vuelo nacional | Calcula precio base más 10% cuando incluye equipaje. |
| Vuelo internacional | Calcula precio base más la tasa internacional. |

### Operaciones básicas

| Clase | Operación | Nota |
| --- | --- | --- |
| Aerolínea | Cargar aerolínea | Inicializa datos propios y la colección de vuelos. |
| Aerolínea | Agregar vuelo | **Validación dura:** no superar la cantidad máxima de vuelos diarios definida para la aerolínea. |
| Aerolínea | Buscar por número único | Base para consultar, modificar y eliminar vuelos. |

### Consultas y reportes

- Vuelos programados.
- Vuelos con duración menor a 2 horas.
- Vuelos con destino ingresado por el usuario.
- Precio final promedio de disponibles y vuelos superiores a ese promedio.
- Vuelo de mayor duración.
- Facturación potencial de programados usando precio final.

### Cierre y bordes

- Eliminar cancelados en conjunto.
- Armar un diccionario de cantidad por estado.
- Duración de exactamente 2 horas no entra en el filtro de duración menor.
- Dos días distintos deben manejar cupos independientes.
- Probar vuelo nacional con y sin equipaje.

### Consulta necesaria

- Definir qué significa “disponibles” para el promedio y qué población entra en el listado de vuelos superiores al promedio.

## Cómo convertir este mapa en trabajo repartible

1. Confirmar el alcance y leer la página completa de cada sistema asignado.
2. Transcribir a la matriz de la hoja de ruta todos sus atributos y cada operación por separado.
3. Acordar los puntos ambiguos y registrar la respuesta docente.
4. Asignar responsable y revisor a cada fila.
5. Cubrir ambas variantes de objetos y sus umbrales en los casos de prueba.
6. Verificar cada resultado desde el menú y explicar qué iterador lo obtiene.

Los modelos, casos de borde y decisiones sugeridas son ayudas de planificación; todavía no hay implementación ni pruebas ejecutadas del integrador.
