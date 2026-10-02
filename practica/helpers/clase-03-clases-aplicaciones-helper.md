# Helper práctico 3 — Remedio y Robot

Fuente: [Clase 3 - Practica - sin resolucion.pptx](../enunciados/Clase%203%20-%20Practica%20-%20sin%20resolucion.pptx), diapositivas 5–21. Apoyo: [teoría 3](../../teoria/apuntes/03-clase-libro-helper.md).

## Herramientas para observar lo que pasa

- `Transcript show: unValor displayString; cr` muestra un valor y cambia de línea.
- `unObjeto inspect` permite revisar el objeto.
- `Prompter prompt: 'Dato'` pide texto; antes de operar con números hay que convertir y validar.
- `MessageBox confirm: 'Continuar?'` devuelve una respuesta booleana.
- `^` expresa retorno dentro de un método. No es un mensaje enviado al objeto.

Usar los selectores exactos: `inspect`, `size` y `notNil`; la diapositiva 8 presenta mayúsculas y `notNill` que no deben copiarse literalmente.

## Ejercicio Remedio: separar modelo y aplicación

Estado: `nombre precio stock laborat`. Método de clase: `crear:con:con:con:`. Inicializador de instancia: `iniciar:pre:stock:laborat:`. Consultas y modificaciones: las indicadas en diapositivas 10–11.

### Receta

1. Implementá y comprobá la clase con valores conocidos, antes de pedirlos por pantalla.
2. Creá dos instancias independientes.
3. Compará `verPrecio` para elegir el remedio más económico.
4. Mostrá su nombre y su stock mediante consultas.
5. Compará `verStock` para elegir el de menor stock. Puede ser otro remedio.
6. La consigna dice «incremento del 20% al remedio con menor stock», sin precisar el atributo. **Como interpretación de trabajo, aumentar el precio**; confirmar con la cátedra.
7. Guardá el precio anterior, calculá `precioAnterior * 1.20`, enviá `modPrecio:` y mostrá antes/después en Transcript.
8. Definí cómo resolver empates y documentalo. Una propuesta es avisar que hay empate y pedir cuál modificar.

### Erratas de implementación, diapositivas 15–18

| Problema en el material | Corrección conceptual |
| --- | --- |
| Creación recibe `nom`, `unPre`, `unSt`, `unLab`, pero envía otros nombres | Usar los argumentos declarados: `^self new iniciar: nom pre: unPre stock: unSt laborat: unLab` |
| `verStock` devuelve precio | Debe devolver `^stock` |
| `verPrecio` devuelve stock | Debe devolver `^precio` |
| Modificadores de precio y stock intercambiados | `modStock: otroSt` asigna `stock := otroSt`; `modPrecio: otroPre` asigna `precio := otroPre` |
| `laborat:otroLab` | La asignación debe ser `laborat := otroLab` |

Creá la clase con el Browser y verificá los nombres que genera el entorno, evitando copiar literalmente la cabecera tipográfica del PPTX.

### Casos de control

| Datos iniciales | Qué comprobar, bajo la interpretación de aumentar precio |
| --- | --- |
| A: precio 100, stock 20; B: precio 200, stock 5 | Se informa A con stock 20; B pasa a precio 240 |
| A: precio 100, stock 2; B: precio 200, stock 5 | Se informa A; su precio pasa a 120 |
| Precios iguales | Aplicar la política de empate |
| Stocks iguales | No elegir por accidente por la rama de un `if` |

Primero identificá al más económico con los valores originales; luego realizá el aumento que pide la consigna.

## Ejercicio Robot: trazar antes de programar

La diapositiva 21 especifica `crearRobot:`: crea en `(1,1)`, orientado al norte. También especifica `mover`, `derecha`, `izquierda`, `posx`, `posy`, `posx:posy:`. Los mensajes de movimiento y posición corresponden al robot, aunque la diapositiva los agrupe bajo el encabezado de métodos de clase.

### Receta

1. Crear `Rolo`: `Robot crearRobot: 'Rolo'`.
2. Posicionarlo con `posx: 20 posy: 30`.
3. Adoptar para la traza la convención norte = aumentar `y`, este = aumentar `x`; contrastarla con la implementación disponible.
4. Recorrer 5 cuadras hacia el norte; girar a la derecha.
5. Recorrer 10 al este; girar a la derecha.
6. Recorrer 5 al sur; girar a la derecha.
7. Recorrer 10 al oeste; girar a la derecha para recuperar orientación norte.
8. Usar `1 to: cantidad do: [:i | robot mover]` para cada lado; consultar posición al terminarlo.

| Etapa | Coordenada esperada bajo esa convención |
| --- | --- |
| Inicio del recorrido | `(20,30)` |
| Primer lado | `(20,35)` |
| Segundo lado | `(30,35)` |
| Tercer lado | `(30,30)` |
| Cuarto lado | `(20,30)` |

Son **30 movimientos** de perímetro y 4 giros. Posicionar directamente con el mensaje dado no exige caminar desde `(1,1)`. Todas las esquinas quedan dentro de la grilla de 50 × 50.

## Comprobación en pareja

Una persona escribe los envíos y otra sigue posición/orientación o precio/stock en una tabla. Intercambiar tareas y explicar por qué cada mensaje va a la clase o a una instancia. El PPTX aporta la especificación de Robot, pero no se encontró una implementación ejecutable entre los archivos recibidos.

Esta guía contiene recetas y controles; no se ejecutaron los fragmentos en Dolphin.
