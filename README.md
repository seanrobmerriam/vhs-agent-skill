# VHS agent skill

Use this skill to create and review [Charm VHS](https://github.com/charmbracelet/vhs) tapes for terminal demos and repeatable CLI captures. A `.tape` file defines what VHS types, when it presses keys, and what it saves.

## Install the skill

Extract the ZIP and place the entire `vhs/` folder in your agent's skills directory. For a personal Codex installation, the default is `~/.codex/skills/`. Keep the folder intact so the links from [SKILL.md](SKILL.md) to the command reference and examples work.

In Codex, try asking:

> Use $vhs to create a short GIF showing my CLI's help output. Save the tape alongside the GIF.

## Run an example

Local rendering requires `vhs`, `ttyd`, and `ffmpeg` on your PATH. The bundled tapes use Bash. On macOS with Homebrew, run `brew install vhs`. See the [VHS installation guide](https://github.com/charmbracelet/vhs#installation) for other platforms.

From inside the extracted `vhs/` folder, run:

```sh
vhs validate assets/examples/hello.tape
vhs assets/examples/hello.tape
```

Open `hello.gif` in your current directory. If your version of VHS lacks the `validate` command, review the tape and run the second command. Review any tape before rendering it because VHS runs its commands in a shell.

| Tape | What it produces |
| --- | --- |
| [hello.tape](assets/examples/hello.tape) | `hello.gif`, a basic terminal demo |
| [ready.tape](assets/examples/ready.tape) | `ready.mp4` and `ready.png`, captured after a delayed status message |
| [golden.tape](assets/examples/golden.tape) | `status.ascii`, a terminal capture you can compare against a baseline in CI |

Start with the closest example and change its `Output` and `Type` lines for your project. The [command reference](references/commands.md) covers tape syntax, recording, and troubleshooting. The examples were tested with VHS 0.12.1.
