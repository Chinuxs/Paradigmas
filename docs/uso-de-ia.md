# Contexto de IA para el equipo

## Preparar la copia local

1. Cloná el repositorio o actualizá tu rama con los cambios compartidos del equipo, preservando cambios locales pendientes.
2. Abrí la raíz del repo en tu asistente. Las rutas del contexto son relativas: cada integrante puede guardarlo en una carpeta diferente.
3. Iniciá una conversación y pedile que resuma el estado del integrador, los pendientes y las fuentes que leyó. Comprobá que coincida con `contexto-ia.md`.
4. Indicá la tarea concreta sobre la que vas a trabajar. El alcance asignado por la cátedra todavía debe confirmarse si continúa pendiente en los documentos.

## Archivos de entrada

| Asistente | Entrada preparada |
| --- | --- |
| Codex y herramientas que reconocen AGENTS.md | `AGENTS.md` |
| Claude Code | `CLAUDE.md` → instrucciones y contexto comunes |
| Gemini CLI | `GEMINI.md` → instrucciones y contexto comunes |
| GitHub Copilot, en funciones que admiten instrucciones del repo | `.github/copilot-instructions.md` → instrucciones y contexto comunes |
| Otro asistente con acceso a archivos | Usar el mensaje de inicio de abajo |
| Chat web sin acceso al repo | Adjuntar los archivos comunes y los documentos pertinentes a la tarea |

La carga depende de la aplicación, su configuración y sus permisos, no solo del modelo elegido. Los adaptadores son instrucciones para leer los archivos compartidos; no otorgan acceso al disco ni garantizan que cualquier aplicación los cargue. Si no los reconoce, usá este mensaje:

> Leé AGENTS.md y contexto-ia.md en la raíz de este repo. Si existe .ia-local/contexto-personal.md, leelo para mi contexto individual. Seguí las indicaciones del proyecto, resumí brevemente el estado y los pendientes y después ayudame con: [tarea]. Consultá los archivos relevantes antes de pedirme información que ya esté registrada. Si no podés acceder a algún archivo, indicá cuál.

En un chat web, adjuntá también las fuentes necesarias: mencionar una ruta no permite que el modelo lea el archivo. Al terminar, pedile los cambios al contexto para incorporarlos al repo.

## Qué se comparte y qué queda local

- `AGENTS.md`: pautas estables del proyecto y de colaboración.
- `contexto-ia.md`: estado compartido, decisiones confirmadas, dudas y próximo paso. Los detalles del integrador siguen en `trabajo-integrador/documentacion/`.
- `.ia-local/contexto-personal.md`: preferencias y repaso individual, excluidos de Git. Cada integrante puede crearlo con su nombre o alias, preferencias, temas practicados y próximo paso personal. Es opcional.
- Los adaptadores solo apuntan a la fuente común. Actualizá las reglas en `AGENTS.md` para evitar versiones distintas por asistente.

## Al terminar una tarea

1. Revisá los cambios que produjo la IA, incluido el contexto. Registrá requisitos cubiertos, pruebas realmente ejecutadas y pendientes; diferenciá propuestas de acuerdos del equipo.
2. Compartí los archivos del trabajo y el contexto mediante el flujo de commits y revisión que acuerde el grupo. Crear los archivos localmente no los publica: los demás los reciben cuando se integran y actualizan sus ramas.
3. Si dos integrantes modificaron el contexto, combiná los avances y resolvé contradicciones con el equipo. No reemplaces todo el archivo por la versión de una sola conversación.
4. Iniciá una nueva conversación o pedí releer los archivos después de actualizar el repo. Una conversación abierta puede conservar contexto anterior.

El contexto compartido no sincroniza chats ni instala Dolphin, modelos o extensiones. Cada integrante necesita su propio entorno y acceso al asistente que elija.

## Referencias de los mecanismos

- [Codex: AGENTS.md](https://learn.chatgpt.com/docs/agent-configuration/agents-md).
- [Claude Code: CLAUDE.md](https://support.claude.com/en/articles/14553240-give-claude-context-claude-md-and-better-prompts).
- [Gemini CLI: GEMINI.md](https://geminicli.com/docs/cli/gemini-md/).
- [GitHub Copilot: instrucciones del repositorio](https://docs.github.com/en/copilot/how-tos/copilot-on-github/customize-copilot/add-custom-instructions/add-repository-instructions).

Archivos preparados y revisados en este repo; la carga en Claude Code, Gemini CLI y Copilot queda por comprobar en el entorno de cada integrante.
