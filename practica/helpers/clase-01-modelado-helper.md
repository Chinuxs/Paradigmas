# Helper práctico 1 — Pasar del enunciado a objetos

Fuente: [Clase 1 - Practica.pptx](../enunciados/Clase%201%20-%20Practica.pptx), diapositivas 5–18. Apoyo: [teoría 1](../../teoria/apuntes/01-poo-introduccion-helper.md).

## Qué pide el material

Repasar clase, objeto, instancia, abstracción, encapsulamiento, herencia, polimorfismo y binding dinámico. La diapositiva 18 indica resolver los **ejercicios 1 y 2 del TP N.º 1**. Ese TP no está entre los archivos encontrados: esta guía ofrece el método para abordarlos, sin inventar sus consignas.

## Receta de modelado

1. **Anotar el objetivo:** qué debería poder hacer quien usa el sistema.
2. **Subrayar entidades:** posibles objetos del dominio.
3. **Elegir el estado:** datos necesarios para cumplir el objetivo.
4. **Extraer acciones:** qué consultas o cambios debe resolver cada objeto.
5. **Asignar responsabilidades:** acercar el comportamiento al objeto que tiene la información.
6. **Agrupar en clases:** objetos con estructura y comportamiento comunes.
7. **Dibujar relaciones:** herencia para «es un»; asociación/composición para «conoce/tiene».
8. **Simular un caso:** crear dos instancias, enviar mensajes y seguir qué objeto responde.

Plantilla para completar por clase:

| Clase candidata | Atributos | Mensajes que entiende | Relación con otras clases | Motivo de existir |
| --- | --- | --- | --- | --- |
| Por completar | Por completar | Por completar | Por completar | Qué requisito resuelve |

## Ejemplo propio para practicar

Supongamos una biblioteca que registra préstamos. `Libro` puede conocer su título y estado; una biblioteca mantiene una colección de libros. La biblioteca **tiene** libros. Dos ejemplares son instancias diferentes aunque compartan título.

Para practicar polimorfismo, usá el ejemplo de la diapositiva 15: diferentes clases de docente responden al mensaje de cálculo de sueldo según sus reglas. En Smalltalk un mensaje unario se escribe `docente sueldo`, sin los paréntesis del dibujo conceptual.

## Preguntas que destraban

- ¿Estoy agregando un dato porque existe en la realidad o porque el sistema lo necesita?
- ¿La subclase realmente es un caso de la superclase?
- ¿Estoy duplicando una operación que podría ser común?
- ¿Qué objeto debería recibir el mensaje y qué debe devolver?
- ¿La aplicación depende de cómo se guardan los datos o de los mensajes disponibles?

## Errores habituales

- Hacer una clase por cada palabra del texto sin justificarla.
- Confundir la clase `Alumno` con una instancia particular.
- Suponer que todos los objetos de la clase tienen iguales valores.
- Usar herencia solo para ahorrar líneas, sin relación «es un».
- Memorizar polimorfismo y binding como sinónimos: uno describe respuestas diferentes al mismo mensaje; el otro, la selección del método en ejecución.

## Control antes de darlo por terminado

- [ ] Cada clase cubre una necesidad del enunciado.
- [ ] Cada atributo tiene un propósito.
- [ ] Puedo dar dos ejemplos concretos de instancias.
- [ ] Puedo seguir una interacción completa entre objetos.
- [ ] Otra persona entiende el diagrama y puede cuestionar las relaciones.

Pendiente: incorporar el TP N.º 1 para convertir esta receta en ayuda específica de sus ejercicios 1 y 2.
