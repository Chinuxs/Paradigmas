# 🧩 POO · Resumen de teoría y práctica

[← Tema](inicio.md) · [📖 Ampliar teoría](teoria.md) · [✏️ Resolución paso a paso](practica.md)

> **Idea central:** un programa es un conjunto de objetos que colaboran enviándose mensajes.
>
> Síntesis del material de la cátedra. Los pasos de resolución son ayudas de estudio; las referencias aparecen en cada bloque.

## 📖 Teoría que conviene recordar

### Objetos y clases

| Concepto | Explicación corta |
| --- | --- |
| Objeto | Tiene estado y comportamiento. |
| Clase | Define los atributos y métodos de sus instancias. |
| Instancia | Un objeto particular de una clase. |
| Estado | Valores actuales de los atributos. |
| Mensaje | Pedido enviado a un objeto receptor. |
| Método | Implementación que atiende ese pedido. |
| Protocolo | Mensajes que entiende una clase o sus objetos. |

**Abstracción:** seleccionar lo relevante del problema. **Encapsulamiento:** consultar o modificar un objeto mediante los mensajes de su interfaz.

**Clase frente a instancia:** la clase recibe el mensaje de creación; el objeto nuevo recibe el inicializador y después sus consultas y modificaciones. Los atributos de instancia pertenecen a cada objeto; las variables de clase son compartidas.

📎 [Introducción](../../teoria/material/1-POO-Introducci%C3%B3n.pdf), pp. 8–20; [Libro](../../teoria/material/3-%20POO-ClaseLibro.pdf), pp. 3–10.

### Leer Smalltalk

| Notación | Para qué sirve |
| --- | --- |
| `:=` / `=` / `^` | Asignar / comparar / retornar desde un método. |
| `| suma i |` | Declarar temporales. |
| `'texto'` / `"comentario"` | Cadena / comentario. |
| `[ ... ]` / `[:x | ... ]` | Bloque / bloque con argumento. |
| `.` / `;` | Separar sentencias / enviar otro mensaje al mismo receptor de la cascada. |

**Precedencia:** paréntesis → unarios → binarios de izquierda a derecha → palabras clave. Por eso `4 + 2 * 5` da `30`.

📎 [Mensajes y control](../../teoria/material/2-POO-Mensajes-EstControl.pdf), pp. 3–22.

### Colecciones: elegir la operación

| Necesidad | Mensaje |
| --- | --- |
| Recorrer y actuar | `do:` |
| Conservar / excluir los que cumplen | `select:` / `reject:` |
| Transformar cada elemento | `collect:` |
| Buscar el primero o responder si falta | `detect:ifNone:` |
| Cantidad / vacío / pertenencia | `size` / `isEmpty` / `includes:` |

`Array` tiene tamaño fijo; `OrderedCollection` puede crecer; `SortedCollection` mantiene un criterio de orden; `Set` evita repetidos; `Bag` conserva repeticiones sin orden posicional; `Dictionary` asocia claves con valores.

📎 [Colecciones](../../teoria/material/5-POO-Colecciones.pdf), pp. 5–14.

### Relaciones, herencia y UML

- **«Es un»:** herencia. `Alumno` es una `Persona`; hereda y puede especializar su comportamiento.
- **«Tiene»:** asociación entre objetos. `Biblioteca` administra libros.
- **Polimorfismo:** un mismo mensaje se resuelve de forma propia según el receptor.
- **Binding dinámico:** en ejecución se elige el método buscando desde la clase del receptor y, si hace falta, en sus superclases.
- **`self`:** busca desde la clase real del receptor. **`super`:** desde la superclase de la clase donde está escrito el envío. El receptor sigue siendo el mismo.
- **UML:** el diagrama de clases muestra estructura; el de secuencia, mensajes a lo largo del tiempo. La herencia apunta a la superclase; `0..*` significa cero o varios.

**Cuidado:** tener una colección de objetos no alcanza para justificar composición UML; hay que considerar la pertenencia y el ciclo de vida de las partes.

**Aclaración de la introducción, p. 23:** Smalltalk tiene tipado dinámico; los objetos tienen clase y las temporales se declaran. No confundirlo con ausencia de tipos ni con el mecanismo de elección de métodos.

📎 [Herencia](../../teoria/material/6-POO-Herencia.pdf), pp. 3–17; [UML](../../teoria/material/4-POO-UML.pdf), pp. 5–11 y 16–17.

## ✏️ Práctica: receta con Farmacia

La cátedra pide crear una farmacia, cargar remedios, aumentar precios según stock, eliminar Bagó, modificar Lotrial y contar por laboratorio.

1. **Ubicar clases y protocolo:** `Farmacia` administra `conjRem`; cada `Remedio` conoce sus datos.
2. **Crear e inicializar:** la farmacia se crea una vez; su colección comienza como `OrderedCollection new`.
3. **Cargar:** pedir datos, convertir precio y stock, crear cada remedio y enviar `agregar:`.
4. **Modificar:** recorrer y comprobar la condición antes de cambiar el precio.
5. **Eliminar:** usar el recorrido por índice del material, sin avanzar cuando se borra.
6. **Contar:** obtener laboratorios, recorrer los distintos y contar sus apariciones.

Ejemplo del aumento, con `f` y `stockMinimo` ya cargados:

```smalltalk
| rem |
1 to: f tamanio do: [:i |
    rem := f recuperar: i.
    rem verStock < stockMinimo ifTrue: [
        rem modPrecio: rem verPrecio * 1.2]].
```

`rem` es una temporal de la aplicación; `f` y el umbral deben existir antes de evaluar el fragmento.

| Operación | Regla para recordarla |
| --- | --- |
| Aumento del 20% | Multiplicar el precio por `1.2`. |
| Baja por índice | Si elimino, el siguiente ocupa esa posición; si no elimino, avanzo. |
| Diccionario | `collect:` obtiene laboratorios → `asSet` evita recorrerlos repetidos → `occurrencesOf:` cuenta en la colección original de laboratorios. |

📎 [Práctica 4](../../practica/enunciados/Clase%204.pptx), diap. 9–17; [práctica 5](../../practica/enunciados/Clase%205%20%20-%20Practica.pptx), diap. 4–12. Fragmento adaptado, no ejecutado en Dolphin.

### Integración con herencia

En Empresa, `Permanente` y `Temporario` especializan `Empleado`. El método común `sueldo` combina básico y salario familiar; cada subtipo calcula su básico. La aplicación puede pedir el sueldo sin repetir su fórmula para cada clase.

📎 [Práctica 6](../../practica/enunciados/Clase%206%20-%20Practica.pptx), diap. 4–5 y 15–19. Las diapositivas tienen erratas: el `^super init...` de las subclases retorna antes de inicializar sus propios atributos; usar la llamada a `super` sin ese retorno anticipado y completar la inicialización. Escribir `0.10` como decimal y agrupar las cuentas con paréntesis explícitos.

## ✅ Repaso antes de resolver

- [ ] Sé qué mensaje va a la clase y cuál a una instancia.
- [ ] Distingo recuperar por posición de buscar por un atributo.
- [ ] No borro de la colección original dentro de su mismo `do:`.
- [ ] Puedo explicar la clave y el valor del diccionario.
- [ ] Respeto la condición exacta: stock igual al umbral no cumple `<`.

**Ejercicio de la cátedra para retomar:** Farmacia, práctica 5, diap. 4. Para un recorrido más completo, abrí la [guía detallada](../../practica/helpers/clase-05-herencia-helper.md).
