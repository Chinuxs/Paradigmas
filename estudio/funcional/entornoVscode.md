# 💻 Haskell en VS Code · Primer uso

[← Tema](inicio.md) · [📖 Resumen](resumen.md) · [✏️ Práctica](practica.md)

VS Code sirve para editar; GHCi permite cargar el archivo y consultar sus funciones. La extensión Haskell usa HLS para ofrecer información de tipos, diagnósticos y autocompletado.

La configuración del entorno se basa en las herramientas oficiales de Haskell. El contenido de los ejercicios se basa en la documentación de la cátedra.

**Verificado el 12/11/2026:** el archivo inicial se cargó en GHCi 9.10.3 y pasaron ocho evaluaciones: las cinco de esta guía, suma vacía, lista exterior vacía y conteo de caracteres. El resultado esperado se contrastó automáticamente con la salida real.

HLS 2.14.0.0 seleccionó el servidor correspondiente a GHC 9.10.3 y completó la comprobación de tipos: **1 archivo correcto, 0 fallos**. La extensión Haskell instalada es 2.8.3, con sintaxis 3.8.0. Esta verificación fue por consola; al reabrir VS Code podrá tomar las herramientas instaladas en el PATH de usuario.

## 1. Comprobar las herramientas

Después de una instalación, cerrar y volver a abrir VS Code permite que tome el PATH actualizado. Abrir una terminal PowerShell desde **Terminal → Nueva terminal** y ejecutar:

```powershell
ghc --version
ghci --version
```

Los comandos deben mostrar sus versiones. Si no se reconocen, revisar que se haya reiniciado VS Code y que el directorio de GHCup esté en el PATH del usuario.

## 2. Abrir el archivo de práctica

Archivo preparado: [practicaInicial.hs](../../practica/resoluciones/funcional/practicaInicial.hs).

Desde la raíz del repositorio, en la terminal:

```powershell
ghci practica/resoluciones/funcional/practicaInicial.hs
```

Una vez cargado, escribir estas expresiones en GHCi:

```haskell
cuad 5
sumar [3,7]
contar [3,7]
veces [2,3,2] 2
longLis [[3,7],[2],[]]
```

Resultados esperados, en el mismo orden:

```text
25
10
2
2
[2,1,0]
```

## 3. Guardar, recargar y consultar

| Acción | Comando en GHCi |
| --- | --- |
| Consultar el tipo de una función | `:type sumar` |
| Cargar otro archivo | `:load ruta/al/archivo.hs` |
| Recargar después de guardar cambios | `:reload` |
| Salir de la consola | `:quit` |

**Flujo de estudio:** predecir el resultado en papel → escribir la función → guardar → recargar → probar → explicar cualquier diferencia.

No hace falta agregar `main` para consultar estas funciones en GHCi. El archivo tiene una cabecera de módulo para organizarlo; las definiciones se pueden usar directamente después de cargarlo.

## 📚 Fuentes

- [Práctica 7 de la cátedra](../../practica/enunciados/Clase%207%20-%20Practica.pptx), diap. 13–14 y 28–34: funciones, suma, conteos y longitudes por sublista. Se normalizan nombres y notación; `longLis` usa una auxiliar propia en lugar de `length`.
- [Instalación oficial de GHCup](https://www.haskell.org/ghcup/install/).
- [Primeros pasos y consola GHCi](https://www.haskell.org/ghcup/steps/).
- [Extensión Haskell para VS Code](https://marketplace.visualstudio.com/items?itemName=haskell.haskell).
