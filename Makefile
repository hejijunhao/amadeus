# Amadeus Makefile
# Generates PDF and MIDI from LilyPond scores

LILYPOND := lilypond
SCORES_DIR := lilypond/scores
OUTPUT_PDF := output/pdf
OUTPUT_MIDI := output/midi

# Find all .ly files in scores directory
SCORES := $(wildcard $(SCORES_DIR)/*.ly)

# Default target
.PHONY: build
build: $(SCORES)
	@mkdir -p $(OUTPUT_PDF) $(OUTPUT_MIDI)
	@for score in $(SCORES); do \
		echo "Engraving: $$score"; \
		$(LILYPOND) \
			--output=$(OUTPUT_PDF)/$$(basename $$score .ly) \
			--include=lilypond/templates \
			--include=lilypond/includes \
			$$score; \
		if [ -f "$(OUTPUT_PDF)/$$(basename $$score .ly).midi" ]; then \
			mv "$(OUTPUT_PDF)/$$(basename $$score .ly).midi" $(OUTPUT_MIDI)/; \
		fi; \
	done
	@echo "Done. Output in $(OUTPUT_PDF)/ and $(OUTPUT_MIDI)/"

# Remove all generated files
.PHONY: clean
clean:
	rm -rf output/pdf/* output/midi/*
	@echo "Cleaned output directories"

# Build a single score (usage: make single SCORE=example-score)
.PHONY: single
single:
	@mkdir -p $(OUTPUT_PDF) $(OUTPUT_MIDI)
	$(LILYPOND) \
		--output=$(OUTPUT_PDF)/$(SCORE) \
		--include=lilypond/templates \
		--include=lilypond/includes \
		$(SCORES_DIR)/$(SCORE).ly
	@if [ -f "$(OUTPUT_PDF)/$(SCORE).midi" ]; then \
		mv "$(OUTPUT_PDF)/$(SCORE).midi" $(OUTPUT_MIDI)/; \
	fi

.PHONY: help
help:
	@echo "Amadeus - Sheet Music Pipeline"
	@echo ""
	@echo "Targets:"
	@echo "  build   - Generate PDF and MIDI for all scores"
	@echo "  clean   - Remove all generated files"
	@echo "  single  - Build one score (SCORE=name without .ly)"
	@echo "  help    - Show this message"
