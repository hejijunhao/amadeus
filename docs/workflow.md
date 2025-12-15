# Amadeus Workflow

Engineering documentation for the sheet music generation pipeline.

## File Ownership

| Path | Purpose | Editable? |
|------|---------|-----------|
| `lilypond/templates/house-style.ly` | Engraving rules, page layout, typography | **No** — visual identity is fixed |
| `lilypond/includes/globals.ly` | Default key, tempo, time signature | Yes, but changes affect all scores |
| `lilypond/scores/*.ly` | Musical content | **Yes** — primary editing target |
| `output/` | Generated files | Never — always regenerated |

## Creating a New Score

1. Create a new file in `lilypond/scores/`:

```lilypond
\version "2.24.0"
\include "house-style.ly"
\include "globals.ly"

\header {
  title = "Your Title"
  composer = "Composer Name"
}

% Your music here
```

2. Run `make build` to generate PDF and MIDI.

## Modifying Existing Scores

1. Edit the `.ly` file in `lilypond/scores/`
2. Run `make build` or `make single SCORE=filename` (without `.ly`)
3. Check output in `output/pdf/`

## What Claude Should Do

When generating or modifying music:

1. **Only touch files in `lilypond/scores/`**
2. **Always include both imports:**
   ```lilypond
   \include "house-style.ly"
   \include "globals.ly"
   ```
3. **Use `\relative` mode** for readable pitch entry
4. **Add comments** marking sections (bars, themes)
5. **Include `\layout { }` and `\midi { }`** in the `\score` block

## What Claude Should Never Do

- Modify `house-style.ly` (engraving rules are fixed)
- Modify `globals.ly` without explicit instruction
- Write files directly to `output/`
- Remove the `\version` declaration
- Use absolute pitches without good reason

## Build Commands

```bash
make build          # Build all scores
make single SCORE=x # Build one score (x.ly)
make clean          # Remove generated files
```

## Determinism

The pipeline is deterministic: identical `.ly` files produce byte-identical PDFs. This is guaranteed by:

- Fixed LilyPond version in source files
- No timestamps in output
- No randomness in engraving

## Debugging

If engraving fails:

1. Check the terminal output for line numbers
2. LilyPond errors reference the `.ly` file directly
3. Common issues:
   - Missing `\relative` context
   - Unbalanced braces `{ }`
   - Invalid note durations
   - Typos in variable names

## MIDI Output

MIDI files are generated automatically when `\midi { }` is present in the score. They appear in `output/midi/` with the same base filename as the score.
