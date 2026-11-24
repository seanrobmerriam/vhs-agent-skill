---
name: vhs
description: Create, edit, validate, and render Charm VHS .tape files for reproducible terminal and CLI demos, GIFs, videos, screenshots, and visual regression fixtures.
---

# VHS

VHS plays a tape in a real shell and captures the terminal. Review the commands sent to the shell and the output paths before running a tape, including any files it loads with `Source`.

1. Check `vhs --version` and `vhs --help`. Local renders require `ttyd` and `ffmpeg` on PATH, plus any programs used by the demo. Use the project's intended working directory so the shell commands can find their fixtures and binaries.
2. Start from a bundled example below, adapt an existing tape, or scaffold one with `vhs new demo.tape`. Set the output, terminal size, and shell near the top. Declare essential external programs with `Require`.
3. Add `Type` and `Enter` for each shell command. Use `Wait` for asynchronous output and `Sleep` for pacing. Give the final result enough screen time to read.
4. Run `vhs validate demo.tape` if the installed CLI offers it, then `vhs demo.tape`. Validation parses the tape without playing it. Check the resulting files and inspect the captured terminal for the expected output, timing, and clipping. A successful render alone does not verify the shell commands succeeded.

## Included examples

Copy the relevant tape into the intended working directory and run it there. The examples use Bash and write outputs to that directory.

- [hello.tape](assets/examples/hello.tape) renders a short GIF from a shell built-in.
- [ready.tape](assets/examples/ready.tape) waits for delayed output, takes a PNG screenshot, and renders an MP4.
- [golden.tape](assets/examples/golden.tape) produces a plain-text terminal capture for comparison in CI.

Use the [command reference](references/commands.md) for syntax, installation, recording, troubleshooting, and CI.
