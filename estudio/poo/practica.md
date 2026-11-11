# ✏️ POO · Cómo resolver un ejercicio

[← Tema](inicio.md) · [📖 Repasar teoría](teoria.md) · [📝 Parciales](../../parciales/guiaParciales.md)

⚡ [Resumen de teoría y práctica](resumen.md)

> **Receta:** ubicar los objetos → revisar el protocolo → crear y cargar → resolver cada inciso → comprobar.

## 1. Marcá los datos y las acciones

Ejemplo guía: [parcial 2023, ejercicio 1](../../parciales/Parcial_2023.png).

| Parte | Qué identificar |
| --- | --- |
| Empresa | Clase compuesta; administra empleados. |
| Empleado | Legajo, nombre y apellido, DNI, área y sueldo. |
| Método pedido | Qué devuelve y en qué clase se implementa. |
| Aplicación | Carga, aumento, baja y diccionario. |

Si las clases se dan por hechas, usá su protocolo. Si falta un selector en la consigna, explicitá el nombre que estás suponiendo.

## 2. Resolvé el método solicitado

Si se pide recuperar el empleado de la posición `i`, la responsabilidad pertenece a `Empresa`:

```smalltalk
recuperarEmpleado: i
    ^empleados at: i
```

Supone un índice válido. `at:` recupera por **posición** desde 1; buscar por legajo requiere comparar legajos. El nombre abreviado de un método en una foto no basta para decidir su parámetro: revisá el protocolo.

## 3. Creá una sola empresa y cargá los objetos

1. Crear la empresa fuera del ciclo de carga.
2. Pedir los datos de un empleado y convertir las entradas numéricas.
3. Crear el empleado con el constructor correspondiente.
4. Agregarlo mediante el mensaje de la empresa.
5. Repetir con la condición de fin que elijas o pida la consigna.

**Truco:** escribir primero la carga de un objeto con datos conocidos permite revisar el protocolo antes de sumar el ingreso por teclado.

## 4. Elegí un patrón para cada inciso

En los siguientes fragmentos, `empresa` ya existe y los accesores deben coincidir con los de las clases del ejercicio. Son adaptaciones didácticas.

### 💰 Modificar los que cumplen

```smalltalk
empresa verEmpleados do: [:emp |
    emp verArea = 'Sistemas' ifTrue: [
        emp modSueldo: emp verSueldo * 1.1.
        Transcript show: emp verNombre;
            show: ' : '; show: emp verSueldo displayString; cr]].
```

Un aumento de 10% multiplica por `1.1`. Para un porcentaje `p`, usar `precio * (1 + (p / 100))`; un descuento usa `1 - (p / 100)`.

**Revisá el orden:** si piden mostrar el sueldo nuevo, mostrarlo después de modificarlo.

### 🗑️ Mostrar y eliminar varios

```smalltalk
| candidatos |
candidatos := empresa verEmpleados
    select: [:emp | emp verArea = 'compras'].
candidatos do: [:emp |
    "Mostrar aqui todos los datos pedidos, antes de la baja"
    empresa eliminarEmpleado: emp].
```

Se recorre la selección al eliminar de la empresa. **Completar la impresión:** este fragmento muestra el mecanismo de baja, no resuelve por sí solo el inciso que pide todos los datos.

La alternativa por índice está explicada en [práctica 5](../../practica/helpers/clase-05-herencia-helper.md): al borrar, no avanzar el índice porque el siguiente objeto ocupa esa posición.

### 📊 Contar por categoría

```smalltalk
| areas cantidades |
areas := empresa verEmpleados collect: [:emp | emp verArea].
cantidades := Dictionary new.
areas asSet do: [:area |
    cantidades at: area put: (areas occurrencesOf: area)].
```

`collect:` obtiene las áreas; `asSet` permite recorrer cada área una vez; `occurrencesOf:` cuenta en la colección que **sí conserva repeticiones**.

Si el inciso pide retornar el diccionario desde un método, termina con `^cantidades`. En un Workspace podés evaluarlo o imprimirlo. Usá la población que indique la consigna: si se cuenta después de las bajas, los eliminados ya no participan.

## 💡 Errores que se pueden evitar

| Error | Cómo detectarlo |
| --- | --- |
| Crear la empresa dentro del ciclo | Al final solo quedan los últimos datos. |
| Borrar en el mismo `do:` que recorre la colección original | Pueden saltarse elementos o fallar el recorrido. |
| Usar `collect:` para filtrar | Aparecen resultados del bloque, no solo objetos que cumplen. |
| Enviar mensajes al resultado `nil` de una búsqueda | Comprobar `notNil` primero. |
| Contar sobre el conjunto de áreas únicas | Cada categoría termina contando una sola vez. |
| Cambiar `<` por `<=` | Se incluyen casos que el enunciado excluye. |

## ✅ Comprobación en papel

Propuesta para la condición de baja `'compras'`:

| Datos de entrada | Resultado esperado |
| --- | --- |
| Sueldo 1000, área Sistemas | Sueldo nuevo 1100. |
| Dos empleados consecutivos de compras | Ambos eliminados. |
| Áreas Ventas, Ventas, Sistemas | Diccionario: Ventas → 2; Sistemas → 1. |
| Empresa vacía | Los recorridos no procesan empleados. |

**Tu turno:** resolvé el ejercicio 1 de 2023 completo, incluida la carga y las impresiones. Después probá Congreso o Feria en la [guía de parciales](../../parciales/guiaParciales.md).

## 📚 Fuentes

[Biblioteca](../../teoria/material/4-POO-ClaseBiblioteca.pdf), pp. 3–13; [práctica 4](../../practica/enunciados/Clase%204.pptx), diap. 9–26; [práctica 5](../../practica/enunciados/Clase%205%20%20-%20Practica.pptx), diap. 4–12. Nombres y ejemplos adaptados para estudiar; no ejecutados en Dolphin.
