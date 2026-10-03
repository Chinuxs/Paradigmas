# Helper 6 — Herencia, polimorfismo, self y super

Fuente: [6-POO-Herencia.pdf](../material/6-POO-Herencia.pdf), pp. 3–33. Complementos: [práctica 5](../../practica/helpers/clase-05-herencia-helper.md) y [ejemplo de Banco](06-ejemplo-herencia-banco-helper.md).

## Qué relación expresa la herencia, pp. 3–9

Una subclase especializa un concepto: un `Alumno` es una `Persona`. Un organigrama de jefes y empleados no demuestra por sí solo esa relación.

- **Generalizar:** llevar características comunes a una superclase.
- **Especializar:** añadir características o comportamiento a una subclase.
- **Heredar estructura:** las instancias de la subclase incluyen los atributos heredados; no volver a declararlos.
- **Redefinir comportamiento:** implementar en la subclase un selector que ya existe en la superclase.

Smalltalk usa herencia simple. El material llama «parcial» a la herencia de comportamiento porque permite redefinir métodos. Eso no significa borrar el método de la superclase: sigue existiendo y un envío con `super` puede alcanzarlo.

Una clase abstracta representa un concepto que no se pretende instanciar directamente. Esa intención de diseño y el mecanismo concreto que impide o detecta su uso dependen de la implementación; no asumir que el nombre de la clase basta para impedir `new`.

## Regla precisa de self y super, pp. 10–13

Ambos envían mensajes al **mismo objeto receptor**. Cambia dónde comienza la búsqueda del método:

| Envío | Inicio de búsqueda |
| --- | --- |
| `self mensaje` | Clase real del receptor |
| `super mensaje` | Superclase de la clase que define el método donde está escrito ese envío |

`super` no crea otro objeto ni cambia al receptor por uno de la superclase. Si un método heredado contiene `self`, ese `self` sigue siendo el objeto original.

### Receta para resolver una traza

1. Anotar la clase real del objeto: por ejemplo, `C`.
2. Buscar el método del mensaje inicial.
3. En cada envío con `self`, volver a empezar desde `C`.
4. En cada envío con `super`, mirar **en qué clase está escrito ese método** y subir desde allí.
5. Resolver los retornos y operaciones respetando precedencia.

### Resultados de control del PDF

En pp. 11–13, `unObjeto := C new`:

- `unObjeto m7`: llega a `m6`, que envía `self m2`; `C>>m2` retorna **8**.
- `unObjeto m1`: llega a `B>>m4`. Allí `self m2` vale 8 y `super m3` empieza en `A`, porque `m4` está definido en `B`. El `m3` de A calcula 8 + 8. Resultado: **24**.

En la actividad de pp. 32–33, las definiciones cambian. `C>>m3` calcula `super m2 + self m1`. El `m2` de B calcula 5 + (5 + 7); luego se suma 5. Resultado: **22**. No mezclar estas constantes con las de la práctica 5, cuyos resultados son 9 y 27.

## Inicializar Persona, Alumno y Docente, pp. 14–17

`Persona` conserva `nomyape dni`; `Alumno` agrega `legajo prom`; `Docente` agrega `cargo`. Cada inicializador de subclase llama al inicializador común:

```smalltalk
"Metodo de instancia de Alumno"
initAlu: nom con: doc con: leg con: pro
    super initPer: nom con: doc.
    legajo := leg.
    prom := pro.
    ^self
```

El método de clase crea una instancia de la clase receptora y luego la inicializa. Un `super new` escrito en ese método cambia la búsqueda de `new`, no implica crear una instancia de `Persona` cuando el receptor es `Alumno`.

## Tres diseños para extraer dinero, pp. 18–31

| Variante del material | Distribución del comportamiento |
| --- | --- |
| 1, pp. 20–22 | Cada subtipo implementa su extracción; la base deja una operación a completar |
| 2, pp. 23–26 | Cada subtipo valida y usa `super extraer:` para descontar el saldo |
| 3, pp. 27–31 | La base implementa la secuencia y envía mensajes a `self` para pasos que varían |

La tercera muestra que un método común puede producir comportamientos distintos según el receptor. Versión corregida del método de la p. 30, manteniendo los selectores del material:

```smalltalk
extraer: unMonto
    ^(self verifCtaHab and: [self verifOpVálida: unMonto])
        ifTrue: [self realizarOp: unMonto]
```

`and:` evita evaluar la segunda condición cuando la primera falla. Este fragmento mantiene el alcance didáctico del PDF; para una aplicación, definir además validación de montos y un resultado claro de éxito o rechazo.

## Erratas y controles

- P. 3: «Las subclases generalizan a las subclases» debe referirse a las **superclases** que agrupan comportamiento común.
- Pp. 20 y 25: revisar paréntesis; `saldo ::=` debe ser `saldo :=`.
- P. 21: `self implemented by Subclass` no debe copiarse como si fuera un selector Smalltalk válido. Buscar en la imagen el mecanismo para métodos que debe implementar la subclase.
- Pp. 21, 25 y 29: usar un valor coherente para `cheque`, por ejemplo `'no'` como texto, con comillas simples; las dobles delimitan comentarios.
- P. 29: unificar `saldoRojo` con el atributo declarado `saldoEnRojo`.
- P. 30: falta el argumento en `self verifOpVálida: unMonto`.
- Probar saldo exacto, descubierto exacto, quinta extracción permitida y sexta rechazada según el ejemplo. No inventar un reinicio diario del contador: el material no lo establece aquí.

## Repaso: cinco preguntas

1. ¿Qué debe cumplirse para usar herencia? **La relación de especialización «es un».**
2. ¿`super` cambia el receptor? **No; cambia el inicio de búsqueda.**
3. ¿Qué hace `self` dentro de un método heredado? **Envía al objeto original buscando desde su clase real.**
4. ¿Redefinir elimina el método de la superclase? **No.**
5. ¿Por qué una colección puede tratar cuentas distintas con `extraer:`? **Comparten el mensaje y cada receptor resuelve el comportamiento correspondiente.**

Resultados obtenidos por seguimiento manual del material. No se ejecutaron en Dolphin.
