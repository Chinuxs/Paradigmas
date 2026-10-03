# Helper 1 — Introducción a POO

Fuente: [1-POO-Introducción.pdf](../material/1-POO-Introducci%C3%B3n.pdf), pp. 3–24. Las explicaciones y ejercicios de repaso de este helper son apoyo de estudio.

## Qué tenés que poder explicar

| Concepto | Idea central | Ejemplo |
| --- | --- | --- |
| Paradigma | Forma de representar un problema y construir su solución | Objetos que colaboran; funciones que se evalúan; hechos y reglas |
| Objeto | Entidad con estado y comportamiento | Un libro particular con título y estado de préstamo |
| Clase | Define características y comportamiento de sus instancias | `Libro` |
| Instancia | Objeto particular de una clase | Dos libros son dos instancias, con estados propios |
| Estado | Datos relevantes del objeto | Título, autor, estado |
| Comportamiento | Operaciones que el objeto entiende | Consultar título, registrar préstamo |
| Mensaje | Pedido enviado a un receptor | `libro verTitulo` |
| Método | Implementación que atiende el mensaje | Código que devuelve el título |

## Los cuatro pilares, con sentido

- **Abstracción:** elegir los datos y operaciones que necesita el problema. Para préstamos interesa quién tiene el libro; posiblemente no interese el color de la tapa.
- **Encapsulamiento:** reunir estado y comportamiento, y acceder al objeto mediante su protocolo. La aplicación pide `verTitulo`; el objeto resuelve cómo obtenerlo.
- **Herencia:** una subclase especializa una superclase. La relación debe poder leerse «es un»: un árbol es una planta.
- **Polimorfismo:** distintos receptores entienden el mismo mensaje y lo resuelven de forma propia. `extraer:` puede tener reglas diferentes en dos tipos de cuenta.

**Binding dinámico:** el método se selecciona en ejecución según el receptor. La búsqueda comienza en su clase y continúa por las superclases si hace falta. Esa búsqueda pertenece al mecanismo de ejecución del lenguaje; la referencia al S.O. en p. 19 es una simplificación.

**Composición:** relacionar objetos para construir uno más complejo. Un vivero tiene plantas; el vivero no es una planta. No todas las relaciones de un problema son herencia.

## Receta para modelar la actividad del vivero

Actividad original: p. 24, con Vivero, Planta, Empleado, Árbol, Propietario, Arbusto y Cliente.

1. Separá entidades, posibles atributos y acciones. Un sustantivo es un candidato a clase, no una obligación.
2. Probá cada herencia con «es un». `Arbol` y `Arbusto` pueden especializar `Planta`.
3. Relacioná `Vivero` con sus plantas y personas mediante asociaciones.
4. Si proponés una clase adicional `Persona`, justificá qué comparten empleado, propietario y cliente. Considerá que una misma persona puede cumplir varios roles.
5. Anotá dos atributos y dos responsabilidades por clase, solo si son relevantes para el sistema que estás suponiendo.
6. Dibujá el modelo y explicá cada relación en voz alta. El enunciado no define un único modelo completo.

## Aclaración sobre tipado

La p. 23 generaliza que los lenguajes OO son «no tipados». Para estudiar, distinguí: Smalltalk tiene tipado dinámico; los objetos tienen clase y las variables referencian objetos. POO también existe en lenguajes con tipado estático. En los ejemplos, `x class` pregunta por la clase del objeto referenciado por `x`.

## Repaso activo

Respondé sin mirar y después controlá:

1. ¿Dos instancias comparten necesariamente los mismos valores? **No; comparten la definición, pero tienen estado propio.**
2. ¿Mensaje y método son lo mismo? **El mensaje es el pedido; el método es su implementación.**
3. ¿Una biblioteca hereda de libro? **No se justifica: contiene libros.**
4. ¿Por qué dos objetos pueden responder diferente a `extraer:`? **Por polimorfismo; se elige el método según el receptor.**
5. ¿Qué información descartarías al modelar un alumno para registrar notas? **La que no afecta ese objetivo, por ejemplo talle de calzado.**

Terminaste el repaso cuando podés dibujar una jerarquía, diferenciarla de una asociación y seguir un mensaje desde el receptor hasta su método.

### Bonus track — Para reforzar

Retomá estas preguntas otro día, sin mirar las respuestas:

1. ¿Elegir las notas de un alumno y descartar su talle es abstracción o herencia? ¿Por qué? **Abstracción: elegimos qué representar según el problema. La herencia relaciona una subclase con una superclase mediante «es un».**
2. ¿Smalltalk es «no tipado» porque usa binding dinámico? **No: tiene tipado dinámico; sus objetos tienen clase y durante la ejecución se comprueba si entienden los mensajes recibidos. El binding dinámico selecciona el método según el receptor.**
3. Si `x` referencia un libro, ¿qué devuelve `x class`? ¿Obliga a que `x` siempre referencie libros? **Devuelve la clase del objeto referenciado en ese momento. No impide que después `x` referencie un objeto de otra clase.**
4. ¿Los atributos y métodos que una clase define para sus objetos se llaman «variables de clase» y «métodos de clase»? **No: las variables de instancia guardan el estado propio de cada objeto y los métodos de instancia responden a mensajes enviados a esos objetos. Las variables de clase son compartidas; los métodos de clase responden a mensajes enviados a la clase misma.**
