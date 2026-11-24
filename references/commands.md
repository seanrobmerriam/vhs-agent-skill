# VHS command reference

Based on the [upstream VHS README](https://github.com/charmbracelet/vhs/blob/main/README.md). Check `vhs --help` for installed subcommands and flags. README features can arrive on the default branch before they appear in a release.

## CLI workflow

| Command | Use |
| --- | --- |
| `brew install vhs` | Install using Homebrew. See [upstream installation](https://github.com/charmbracelet/vhs#installation) for other platforms. |
| `vhs new demo.tape` | Create a starter tape. |
| `vhs validate demo.tape` | Parse without playing. A quoted glob such as `'demos/*.tape'` can check a group of tapes. |
| `vhs demo.tape` | Play the tape and write its declared outputs. |
| `vhs record > capture.tape` | Capture terminal actions. Run `exit` inside the session, then review and edit the generated tape before replaying it. |
| `vhs themes` | List built-in theme names. |
| `vhs publish demo.gif` | Upload a GIF to VHS hosting and print share links. Use when the user asks to publish. |

With Docker, use `docker run --rm -v "$PWD:/vhs" ghcr.io/charmbracelet/vhs demo.tape` from the directory containing the tape. Programs invoked by the tape must be available inside the container.

## Tape syntax

Use one instruction per line. Start comment lines with `#`.

| Instruction | Behavior |
| --- | --- |
| `Output demo.gif` | Write a render. Repeat for additional outputs. Extensions include `.gif`, `.mp4`, `.webm`, `.txt`, and `.ascii`. A path ending in `/` writes PNG frames. |
| `Require git` | Fail early when an external program is unavailable on PATH. |
| `Set Shell bash` | Pick the shell used to play the tape. |
| `Set Width 880`, `Set Height 400` | Set pixel dimensions. |
| `Set FontSize 20`, `Set Padding 20`, `Set CursorBlink false` | Tune the terminal appearance. |
| `Set Theme "Catppuccin Frappe"` | Select an installed VHS theme by name. |
| `Set TypingSpeed 35ms` | Set delay per typed character. |
| `Type "git status --short"`, then `Enter` | Type a shell command and submit it. Use VHS backtick delimiters for text containing both quote styles. |
| `Type@75ms "slow text"` | Override the typing speed for one instruction. |
| `Down 2`, `Tab@250ms 2`, `Ctrl+C` | Send terminal keys. The repeat count and interval apply to repeatable keys. |
| `Sleep 750ms` | Capture frames for a fixed interval. |
| `Wait+Screen@5s /READY/` | Wait up to five seconds for a screen match. Use `+Line` to inspect the last line. Bare `Wait` defaults to the last line, `/>$/`, and 15 seconds. |
| `Hide`, `Show` | Pause and resume frame capture while commands continue running. Clear setup output before resuming if it should stay out of the recording. |
| `Screenshot demo.png` | Save the current frame as a PNG. |
| `Copy "hello"`, then `Paste` | Stage and paste text into the terminal. Use `Enter` separately when needed. |
| `Env DEMO_MODE "1"` | Set an environment variable for the terminal session. |
| `Source config.tape` | Execute instructions from another tape. |

Place outputs and settings at the top, then requirements before playback actions. `TypingSpeed` can also change during playback. The current upstream README documents `Columns` and `Rows` as cell-based alternatives to `Width` and `Height`, respectively. Check support in the installed release before using them and use only one setting per axis.

## Troubleshooting and CI

- If a wait fires during typing or immediately after Enter, check whether the shell echoed the match text. Use an output marker whose complete text appears only in the program's output. Check terminal wrapping and choose a scope that can see the marker after the prompt returns.
- If rendering fails before the tape starts, check `command -v vhs ttyd ffmpeg`, then inspect the reported browser or encoder error. If a program fails in the capture, check the configured shell, working directory, environment, and PATH.
- For golden captures, keep VHS, shell, CLI versions, fixtures, and terminal dimensions consistent. Compare actual output to a reviewed baseline with a command such as `diff -u fixtures/status.ascii status.ascii`. Inspect the captured output before updating the baseline.
- For repository automation, see the [official VHS GitHub Action](https://github.com/charmbracelet/vhs-action). For additional tape patterns, see the [upstream examples](https://github.com/charmbracelet/vhs/tree/main/examples).
