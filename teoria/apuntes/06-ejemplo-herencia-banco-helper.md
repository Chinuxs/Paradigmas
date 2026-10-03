# Helper — Ejemplo completo de herencia: Banco

Fuente: [Ejemplo completo de herencia.pdf](../material/Ejemplo%20completo%20de%20herencia.pdf), pp. 1–5. Apoyos: [herencia](06-herencia-helper.md) y [colecciones](05-colecciones-helper.md).

## Qué pide el ejemplo, p. 1

1. Crear el banco Del Chubut y cargar cajas de ahorro y cuentas corrientes.
2. Simular depósitos y extracciones de varios clientes.
3. Calcular el monto total depositado mediante los saldos.
4. Construir un diccionario de cantidad de cuentas por cliente.

La implementación representa al titular mediante su DNI ingresado como texto. No exige una clase Cliente adicional en este ejemplo.

## Responsabilidades

| Clase | Estado propio | Responsabilidad |
| --- | --- | --- |
| `Banco` | `nom conjCuentas` | Administrar y buscar cuentas |
| `CuentaBancaria` | `nroCuenta titular saldo` | Datos comunes, depósito y secuencia de extracción |
| `CajaAhorro` | `cantExtracciones` | Limitar extracciones y evitar saldo negativo |
| `CuentaCte` | `saldoEnRojo cheque` | Validar descubierto y condición del cheque |

La colección del banco contiene ambos subtipos mezclados. Para sumar saldos, la aplicación envía `verSaldo` a cada objeto. Para extraer, envía `extraer:` sin volver a decidir la clase de la cuenta.

## Orden de implementación propuesto

1. Unificar nombres de variables y selectores antes de copiar fragmentos.
2. Implementar inicialización y consultas de `CuentaBancaria`.
3. Implementar subtipos llamando a `super iniciarCB:con:`.
4. Implementar validaciones y cambios de estado de cada subtipo.
5. Implementar Banco y su búsqueda por número.
6. Probar con datos fijos; después agregar interacción mediante Prompter.
7. Resolver total y diccionario; verificar los resultados a mano.

Protocolo coherente propuesto: `agregaCuenta:`, `verNro`, `verTit`, `saldoEnRojo` y `keysDo:`. Elegir otros nombres es posible, pero definiciones y envíos deben coincidir.

## Fragmentos corregidos

Método de instancia de Banco (p. 1):

```smalltalk
buscarCuenta: unNro
    ^conjCuentas detect: [:cuenta | cuenta verNro = unNro]
        ifNone: [nil]
```

Método de instancia de CuentaBancaria (p. 2), con validación positiva propuesta adicional al ejemplo:

```smalltalk
extraer: unMonto
    unMonto <= 0 ifTrue: [^false].
    (self verifCtaHab and: [self verifOpVálida: unMonto])
        ifFalse: [^false].
    self realizarOp: unMonto.
    ^true
```

Esto propone un retorno booleano para que la aplicación informe el resultado. La validación de montos positivos debe aplicarse también al depósito si se adopta esta mejora.

Aplicación para total y diccionario (p. 5):

```smalltalk
| cuentas total titulares diccionario |
cuentas := ban todasCuentas.
total := 0.
cuentas do: [:cuenta | total := total + cuenta verSaldo].
titulares := cuentas collect: [:cuenta | cuenta verTit].
diccionario := Dictionary new.
titulares asSet do: [:dni |
    diccionario at: dni put: (titulares occurrencesOf: dni)].
diccionario keysDo: [:dni |
    Transcript show: dni; show: ' : ';
        show: (diccionario at: dni) printString; cr].
```

`ban` debe contener un Banco ya cargado. La suma reproduce la solución del PDF, incluidos saldos negativos; no reemplazarla por una suma de depósitos históricos o solo saldos positivos sin aclarar el criterio.

## Erratas por página

| Página | Problema | Corrección |
| --- | --- | --- |
| 1 | `OrderedCollectin`, `vernNro` | `OrderedCollection`, `verNro` |
| 2 | `modNom:otro` usa `nom:otroN` | Asignar `nom := otro` |
| 2 | `nrocuenta` cambia mayúscula | Usar `nroCuenta` |
| 2 | Validación sin argumento | `self verifOpVálida: unMonto` |
| 3–4 | `saldoEnrojo`, `saldoRojo` | Unificar con `saldoEnRojo` |
| 3–4 | Comillas tipográficas/dobles en el texto no | Usar `'no'` |
| 4 | `resp=P='s'` | Comparar `resp = 's'` |
| 4 | `agregarCuenta:` difiere de la definición | Usar el mismo selector acordado, aquí `agregaCuenta:` |
| 4 | Entradas de monto/tipo son texto | Convertir las numéricas y tratar entradas inválidas |
| 4 | Actualización de respuesta dentro del caso de cuenta encontrada | Preguntar cómo continuar también si no existe la cuenta; revisar cierres de bloques |
| 5 | `verTitu`, `keysdo:` | `verTit`, `keysDo:` |

Declarar temporales de Workspace y usar `-` y comillas de código normales. Los puntos suspensivos o comentarios de los PDFs no reemplazan inicializadores completos.

## Casos de control propuestos

- Caja de ahorro: saldo 100, extraer 100 deja 0; extraer 101 debe rechazarse.
- Contador en 4: una extracción válida lo lleva a 5; la siguiente debe rechazarse.
- Cuenta corriente: saldo 100 y descubierto 200; extraer 300 deja -200, extraer 301 debe rechazarse.
- Cuenta corriente con cheque que inhabilita: rechazo aunque haya saldo.
- Dos cuentas del DNI A y una del DNI B: diccionario A → 2, B → 1.
- Saldos 100, 200 y -50: total esperado 250.
- Banco vacío: total 0 y diccionario vacío.

## Repaso: cinco preguntas

1. ¿Dónde se guarda el contador de extracciones? **En cada CajaAhorro.**
2. ¿Qué comparte una cuenta corriente con una caja? **Datos y protocolo de CuentaBancaria.**
3. ¿Para qué sirve `asSet` al contar titulares? **Para recorrer una vez cada DNI distinto.**
4. ¿Qué retorna una búsqueda fallida? **`nil`.**
5. ¿Por qué la aplicación no pregunta el subtipo al extraer? **La cuenta concreta responde polimórficamente.**

Fragmentos corregidos para estudio, no un paquete listo para importar. No ejecutados en Dolphin.
