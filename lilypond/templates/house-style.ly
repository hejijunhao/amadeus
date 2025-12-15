%% house-style.ly
%% Amadeus engraving rules and visual identity
%% This file contains NO music — only layout and typography.

\version "2.24.0"

%% ============================================================
%% PAGE LAYOUT
%% ============================================================

\paper {
  #(set-paper-size "a4")

  %% Margins (in mm)
  top-margin = 15
  bottom-margin = 15
  left-margin = 20
  right-margin = 20

  %% Space between systems
  system-system-spacing.basic-distance = #14
  system-system-spacing.minimum-distance = #10
  system-system-spacing.padding = #2

  %% Space before first system (after title)
  markup-system-spacing.basic-distance = #18

  %% Ragged bottom: don't stretch to fill page
  ragged-bottom = ##t
  ragged-last-bottom = ##t
}

%% ============================================================
%% STAFF SIZE
%% ============================================================

#(set-global-staff-size 18)

%% ============================================================
%% HEADER / TITLE LAYOUT
%% ============================================================

\header {
  %% Remove default tagline
  tagline = ##f
}

\paper {
  %% Title block formatting
  bookTitleMarkup = \markup {
    \column {
      \vspace #1
      \fill-line {
        \fontsize #5 \bold \fromproperty #'header:title
      }
      \vspace #0.5
      \fill-line {
        \fromproperty #'header:subtitle
      }
      \vspace #1
      \fill-line {
        \fromproperty #'header:poet
        \fromproperty #'header:composer
      }
      \vspace #0.3
      \fill-line {
        \null
        \fontsize #-2 \italic \fromproperty #'header:opus
      }
    }
  }
}

%% ============================================================
%% BAR NUMBERS
%% ============================================================

\layout {
  \context {
    \Score
    %% Bar numbers at start of each line
    barNumberVisibility = #first-bar-number-invisible-save-broken-bars
    \override BarNumber.break-visibility = #end-of-line-invisible
    \override BarNumber.font-size = #-1
    \override BarNumber.padding = #2
  }
}

%% ============================================================
%% REHEARSAL MARKS
%% ============================================================

\layout {
  \context {
    \Score
    \override RehearsalMark.font-size = #0
    \override RehearsalMark.self-alignment-X = #LEFT
    \override RehearsalMark.padding = #2
  }
}

%% ============================================================
%% DYNAMICS
%% ============================================================

\layout {
  \context {
    \Voice
    \override DynamicTextSpanner.style = #'none
  }
  \context {
    \Score
    \override DynamicText.font-size = #-1
  }
}

%% ============================================================
%% SLURS AND TIES
%% ============================================================

\layout {
  \context {
    \Voice
    \override Slur.height-limit = #3
    \override Tie.height-limit = #2
  }
}

%% ============================================================
%% FONTS
%% ============================================================

\paper {
  %% Use default LilyPond fonts (Century Schoolbook family)
  %% These are professional and included with LilyPond
  property-defaults.fonts.serif = "Century Schoolbook L"
  property-defaults.fonts.sans = "sans-serif"
}
