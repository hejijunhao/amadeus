# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build Commands

```bash
make build              # Generate PDF + MIDI for all scores
make single SCORE=name  # Build one score (without .ly extension)
make clean              # Remove all generated files
```

Output: `output/pdf/` and `output/midi/`

## Architecture

Amadeus is a LilyPond-based sheet music generation pipeline with strict separation of concerns:

```
lilypond/
├─ templates/house-style.ly  # Engraving rules (DO NOT MODIFY)
├─ includes/globals.ly       # Shared musical defaults (rarely modify)
└─ scores/*.ly               # Musical content (PRIMARY EDIT TARGET)
```

**Include chain**: Every score imports `house-style.ly` (layout/typography) and `globals.ly` (key/tempo/time), then defines its own musical content.

## File Ownership Rules

| File | Editable |
|------|----------|
| `lilypond/scores/*.ly` | **Yes** — primary workspace |
| `lilypond/includes/globals.ly` | Only with explicit permission |
| `lilypond/templates/house-style.ly` | **Never** — visual identity is frozen |
| `output/*` | Never — always regenerated |

## Creating a New Score

```lilypond
\version "2.24.0"
\include "house-style.ly"
\include "globals.ly"

\header {
  title = "Title"
  composer = "Composer"
}

upper = \relative c'' {
  \clef treble
  \global
  % music here
}

\score {
  \new Staff \upper
  \layout { }
  \midi { }
}
```

## LilyPond Conventions

- Use `\relative` mode for readable pitch entry
- Apply `\global` at the start of each voice to inherit key/tempo/time
- Include `\layout { }` and `\midi { }` in every `\score` block
- Add section comments: `%% Bars 1-4: Theme`
- Keep `\version "2.24.0"` declaration

## Globals Available

From `globals.ly`:
- `\global` — applies time (4/4), key (C major), tempo (Moderato ♩=100)
- `\globalTime`, `\globalKey`, `\globalTempo` — individual components
- `midiPiano`, `midiStrings`, `midiOrgan` — MIDI instrument names
