# Amadeus

A deterministic, code-first pipeline for generating high-quality sheet music PDFs using [LilyPond](https://lilypond.org/).

## Why LilyPond?

LilyPond produces publication-quality engraving from plain text input. Text is the source of truth—no binary formats, no proprietary lock-in, and version control works naturally.

## Quick Start

```bash
# Generate all PDFs and MIDI files
make build

# Clean output directory
make clean
```

Output appears in `output/pdf/` and `output/midi/`.

## Requirements

- [LilyPond](https://lilypond.org/download.html) installed and available in `$PATH`
- GNU Make

## Repository Structure

```
amadeus/
├─ lilypond/
│  ├─ templates/     # Engraving rules (house style)
│  ├─ scores/        # Musical content
│  └─ includes/      # Shared musical globals
├─ output/
│  ├─ pdf/           # Generated PDFs
│  └─ midi/          # Generated MIDI
└─ docs/             # Workflow documentation
```

## Principles

1. **Text is truth** — All source is human-readable `.ly` files
2. **Deterministic** — Same input always produces identical output
3. **Separation of concerns** — Visual style is decoupled from musical content
4. **Simplicity** — Understandable in 5 minutes, no magic

## Documentation

See [docs/workflow.md](docs/workflow.md) for the editing workflow and file conventions.
