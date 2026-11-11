# 📖 POO · Lo que necesitás entender

[← Tema](inicio.md) · [Siguiente: resolver ejercicios →](practica.md)

⚡ [Resumen de teoría y práctica](resumen.md)

## 1. Objetos, clases e instancias

Un **objeto** reúne datos y operaciones. Un empleado particular tiene nombre y sueldo; puede responder cuánto cobra y recibir un cambio de sueldo.

| Concepto | En un ejemplo de empleados |
| --- | --- |
| Clase | `Empleado`: define datos y comportamiento. |
| Instancia | Un empleado concreto creado a partir de esa clase. |
| Estado | Los valores actuales de nombre, área y sueldo. |
| Comportamiento | Consultar el área o modificar el sueldo. |
| Mensaje | `emp verSueldo`: el pedido enviado al objeto. |
| Método | El código que atiende ese pedido. |

**Abstracción:** elegir qué representar para el problema. **Encapsulamiento:** trabajar con el objeto a través de sus mensajes.

## 2. La clase y sus objetos reciben mensajes distintos

```smalltalk
emp := Empleado crearNombre: 'Ana' sueldo: 1000.
emp modSueldo: 1100.
```

Los selectores del ejemplo son didácticos y deben implementarse para poder usarlo.

| Mensaje | Se envía a | Dónde se implementa |
| --- | --- | --- |
| `crearNombre:sueldo:` | La clase `Empleado` | Lado de clase. |
| Inicializar nombre y sueldo | El empleado nuevo | Lado de instancia. |
| `verSueldo`, `modSueldo:` | Un empleado existente | Lado de instancia. |

Una **variable de instancia** guarda datos propios de cada objeto. Una **variable de clase** es compartida en el ámbito de la clase. Una temporal solo sirve dentro del método o fragmento donde se declara.

## 3. Leer Smalltalk

```smalltalk
| sueldoNuevo |
sueldoNuevo := emp verSueldo * 1.1.
emp modSueldo: sueldoNuevo.
```

`:=` asigna; `=` compara; `^` retorna desde un método. Las cadenas llevan comillas simples y los comentarios, dobles. Los bloques se escriben entre `[...]`.

**Orden de evaluación:** paréntesis → unarios → binarios de izquierda a derecha → palabras clave.

| Tipo | Ejemplo | Argumentos |
| --- | --- | --- |
| Unario | `emp verSueldo` | Ninguno. |
| Binario | `1000 * 1.1` | Uno; el selector usa símbolos. |
| Palabra clave | `emp modSueldo: 1100` | Uno o más; cada parte termina en `:`. |

**Truco:** `4 + 2 * 5` da `30`. Para obtener `14`, escribí `4 + (2 * 5)`.

## 4. Una empresa tiene empleados

`Empresa` mantiene una colección de objetos `Empleado`. Es una relación «tiene», no una herencia.

```text
Empresa ── empleados ──> Empleado
                         nombre, área, sueldo...
```

La colección se inicializa, por ejemplo, con `OrderedCollection new`. Sin inicializarla, el atributo queda en `nil`.

| Necesito… | Uso… | Obtengo… |
| --- | --- | --- |
| Hacer algo con cada empleado | `do:` | El efecto de las acciones. |
| Conservar los que cumplen | `select:` | Otra colección. |
| Excluir los que cumplen | `reject:` | Otra colección. |
| Obtener un dato de cada uno | `collect:` | Una colección de resultados. |
| Encontrar el primero | `detect:ifNone:` | Un objeto o la alternativa elegida. |

**Ojo:** `select:` conserva referencias a los objetos. Cambiar el sueldo de un empleado seleccionado cambia ese mismo empleado en la empresa.

## 5. Diccionario: clave y valor

Para contar empleados por área:

```text
'Sistemas' → 3
'Ventas'   → 2
```

La clave es el área y el valor es la cantidad. Se cuentan empleados; no se suman sus sueldos. `at:put:` guarda el valor asociado a una clave.

## 6. Herencia y polimorfismo

Un `EmpleadoPermanente` **es un** `Empleado`; una `Empresa` **tiene** empleados.

La superclase reúne lo común. Una subclase agrega datos o redefine métodos. **Polimorfismo:** enviar `sueldo` a empleados de distintos tipos y dejar que cada uno calcule su resultado.

| Envío dentro de un método | Dónde empieza a buscar el método |
| --- | --- |
| `self mensaje` | Clase real del objeto receptor. |
| `super mensaje` | Superclase de la clase donde está escrito ese envío. |

El receptor sigue siendo el mismo objeto. Una **clase abstracta** expresa un concepto que no se pretende instanciar directamente.

## ✅ Comprobá que lo entendiste

- [ ] Distingo un mensaje de su método.
- [ ] Sé qué pertenece a la clase y qué pertenece a una instancia.
- [ ] Diferencio «es un» de «tiene».
- [ ] Puedo elegir entre recorrer, filtrar, transformar y buscar.
- [ ] Puedo explicar qué cuenta un diccionario por categoría.

## 📚 Fuentes

- [Introducción a POO](../../teoria/material/1-POO-Introducci%C3%B3n.pdf), pp. 3–24.
- [Mensajes y control](../../teoria/material/2-POO-Mensajes-EstControl.pdf), pp. 3–22.
- [Libro](../../teoria/material/3-%20POO-ClaseLibro.pdf), pp. 3–15; [Biblioteca](../../teoria/material/4-POO-ClaseBiblioteca.pdf), pp. 3–13.
- [Colecciones](../../teoria/material/5-POO-Colecciones.pdf), pp. 5–15; [herencia](../../teoria/material/6-POO-Herencia.pdf), pp. 3–17.

Síntesis de estudio basada en los apuntes del repo. Los fragmentos nuevos no se ejecutaron en Dolphin.
