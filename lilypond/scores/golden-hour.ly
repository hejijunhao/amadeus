%% golden-hour.ly
%% Melancholic melodic house piano loop
%% Style: Ben Böhmer / melodic house
%% Foundation: D – B – G – F# – D
%% Melody: D/C#/E interplay, resolving to F#

\version "2.24.0"

\include "house-style.ly"
\include "globals.ly"

\header {
  title = "Golden Hour"
  subtitle = "Piano Loop"
  composer = "Amadeus"
  opus = "Melodic House"
}

%% ============================================================
%% MUSICAL CONTENT
%% ============================================================

%% Right hand - melancholic melody (D/C#/E tension, F# resolution)
upper = \relative c'' {
  \clef treble
  \key d \major
  \time 4/4
  \tempo "Melancholic" 4 = 122

  %% Bar 1: D foundation - melody enters on D
  r2 d4.\p( e8 |

  %% Bar 2: B foundation - C# tension
  cis2 d4 e) |

  %% Bar 3: G foundation - E lingers
  e2.( d4 |

  %% Bar 4: F# foundation - pull toward resolution
  cis4 d e cis) |

  %% Bar 5: D return - restate
  d2\mp( e4. d8 |

  %% Bar 6: B foundation - deeper C#
  cis2. d4) |

  %% Bar 7: G - E yearning
  e2( d4 cis |

  %% Bar 8: F# - resolve to F#
  d4 e fis2)\p |

  \bar ":|."
}

%% Left hand - intimate piano chords (D – B – G – F#), half time
lower = \relative c {
  \clef bass
  \key d \major
  \time 4/4

  %% Bars 1-2: D major - open voicing, root position
  <d, a' d fis>1\p( |
  <d a' d fis>1) |

  %% Bars 3-4: Bm - the descent
  <b fis' b d>1( |
  <b fis' b d>1) |

  %% Bars 5-6: G major - warmth
  <g d' g b>1( |
  <g d' g b>1) |

  %% Bars 7-8: F#m - unresolved
  <fis cis' fis a>1( |
  <fis cis' fis a>1) |

  \bar ":|."
}

%% ============================================================
%% SCORE ASSEMBLY
%% ============================================================

\score {
  \new PianoStaff \with {
    instrumentName = "Piano"
  } <<
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
  >>

  \layout { }

  \midi {
    \tempo 4 = 122
  }
}
