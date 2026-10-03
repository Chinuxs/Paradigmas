# Helper 4 — UML: clases y secuencias

Fuente: [4-POO-UML.pdf](../material/4-POO-UML.pdf), pp. 2–21. Las recetas y controles de este helper son ayudas de estudio; los ejercicios originales están en el PDF.

## Qué estudiar y qué herramienta pide la cátedra

El material indica que se usarán **diagramas de clases y de secuencia** (p. 4). No nombra ni recomienda una aplicación específica para dibujarlos. Las [pautas del integrador, p. 2](../../trabajo-integrador/enunciado/Trabajo%20Integrador%20-%20Pautas%202026.pdf) exigen un **diagrama de clases** acompañando la entrega, sin especificar herramienta ni formato del archivo.

Esta conclusión corresponde al material disponible revisado el 03/10/2026; no permite inferir indicaciones dadas oralmente. Tampoco convierte el diagrama de secuencia en un entregable obligatorio del integrador.

## Leer un diagrama de clases, pp. 5–11

Cada caja tiene nombre, atributos y operaciones. Las operaciones describen mensajes disponibles; el cuerpo de los métodos se escribe en el código.

| Relación | Cómo reconocerla | Pregunta de control |
| --- | --- | --- |
| Asociación | Línea entre clases; puede indicar roles y multiplicidades | ¿Qué objetos se vinculan? |
| Agregación | Rombo vacío del lado del todo | ¿Las partes tienen existencia independiente? |
| Composición | Rombo lleno del lado del todo | ¿La parte pertenece al compuesto y su ciclo de vida depende de él? |
| Herencia/generalización | Triángulo vacío apuntando a la superclase | ¿Cada instancia de la subclase es también un caso de la superclase? |

No toda relación «tiene» justifica composición. Explicá el vínculo antes de elegir el rombo. La frase de la p. 10 sobre acceder solo a través del compuesto es una simplificación del material: el rombo por sí solo no impide que el programa tenga otras referencias al objeto.

### Multiplicidad, p. 8

Se lee en el extremo de la clase que se está contando. En el ejemplo, un cliente puede tener `0..*` cuentas y cada cuenta tiene `1` titular.

- `1`: exactamente uno.
- `0..1`: opcional, como máximo uno.
- `*` o `0..*`: cero o varios.
- `1..*`: al menos uno.
- `m..n`: entre esos límites.

Una colección vacía es compatible con `0..*`, pero contradice `1..*` si el modelo exige esa multiplicidad en ese momento.

## Receta para los ejercicios de clases

1. Leer la consigna y listar objetos, datos y operaciones.
2. Ubicar datos comunes en una superclase cuando exista relación «es un».
3. Dibujar asociaciones y escribir una oración en cada sentido para verificar multiplicidades.
4. Incorporar las operaciones solicitadas; marcar qué comportamiento cambia según el subtipo.
5. Simular dos instancias y comprobar que el diagrama permite las situaciones del enunciado.

**Banco, pp. 12–13:** `Cuenta` concentra número y saldo; `CajaAhorro` y `CuentaCorriente` especializan la extracción. `Cliente` aporta sus datos y se relaciona con las cuentas. La p. 12 habla de tener una caja de ahorro o una cuenta corriente, mientras la solución muestra varias cuentas por cliente: registrar esa diferencia si se usa el ejercicio como base.

**Comercio, pp. 14–15:** ubicar pedidos, productos, clientes personales/corporativos y empleados. Un pedido corresponde a un cliente; un cliente puede hacer varios pedidos. El representante del cliente corporativo es opcional. No inventar una fórmula de calificación corporativa: la consigna solo fija «bajo» para el cliente personal. El diagrama de solución incorpora atributos adicionales; distinguirlos de los enumerados en el texto.

## Secuencias: seguir mensajes, pp. 16–21

El diagrama de clases muestra estructura; el de secuencia muestra una interacción concreta entre objetos. El tiempo avanza de arriba hacia abajo. Cada participante tiene una línea de vida; las flechas indican mensajes, con argumentos cuando hacen falta. El material también presenta condiciones entre corchetes, iteraciones y retornos opcionales.

Para la transferencia bancaria:

1. La aplicación solicita al banco transferir monto, origen y destino.
2. El banco pide a su colección buscar ambas cuentas.
3. Si falta alguna, informa el error sin cambiar saldos.
4. Comprueba que la operación sea válida.
5. Extrae de origen y deposita en destino; luego informa el resultado.

Control propuesto: representar **dos objetos cuenta**, aunque ambos pertenezcan a la misma clase. La condición `saldo >= monto` de la p. 21 simplifica el problema: si se incorpora descubierto, la validación debe respetar el comportamiento de la cuenta concreta.

## Repaso: cinco preguntas

1. ¿A dónde apunta el triángulo de herencia? **A la superclase.**
2. ¿Dónde se coloca el rombo? **Del lado del todo.**
3. ¿Qué expresa `0..1`? **Una relación opcional con un máximo de un objeto.**
4. ¿Una línea de vida representa necesariamente una clase? **Representa un participante; en estos ejercicios, un objeto.**
5. ¿Qué controla la coherencia entre diagramas? **Que cada receptor pueda responder al mensaje que recibe y que existan los vínculos necesarios.**

## Antes de entregar un diagrama

- [ ] Nombres y operaciones coinciden con el código.
- [ ] Herencia y asociaciones tienen una justificación.
- [ ] Multiplicidades se pueden explicar en ambos sentidos.
- [ ] Se distingue una instancia de una clase.
- [ ] Los casos inválidos no dejan cambios parciales.
- [ ] El formato de entrega se acordó con el tutor.
