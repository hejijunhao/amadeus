%% golden-hour.ly
%% Nostalgic melodic house piano loop
%% Style: Ben Böhmer / melodic house
%% Progression: D - G - Bm - B - F#m - D

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

%% Right hand - flowing melody with suspensions
upper = \relative c'' {
  \clef treble
  \key d \major
  \time 4/4
  \tempo "Nostalgic" 4 = 122

  %% Bar 1: D major - opening statement
  r4 fis8\p( e d4 a' |

  %% Bar 2: G major - ascending hope
  g4. fis8 e4 d) |

  %% Bar 3: Bm - gentle descent
  d4(\mp cis8 b~ b4 fis' |

  %% Bar 4: B major - the bittersweet turn
  fis4. e8 dis4 b) |

  %% Bar 5: F#m - introspection
  cis4.\mf( d8 e4 fis |

  %% Bar 6: F#m cont. - longing
  e4 d cis a) |

  %% Bar 7: D - return home
  d4(\mp e8 fis~ fis4 a |

  %% Bar 8: D - resolve to loop
  g4. fis8 e4 d)\p |

  \bar ":|."
}

%% Left hand - arpeggiated pattern (melodic house style)
lower = \relative c {
  \clef bass
  \key d \major
  \time 4/4

  %% Bar 1: D major arpeggio
  d8\p( a' d fis a, d fis a, |

  %% Bar 2: G major arpeggio
  g,8 d' g b d, g b d,) |

  %% Bar 3: Bm arpeggio
  b8( fis' b d fis, b d fis, |

  %% Bar 4: B major arpeggio - the lift
  b,8 fis' b dis fis, b dis fis,) |

  %% Bar 5: F#m arpeggio
  fis,8( cis' fis a cis, fis a cis, |

  %% Bar 6: F#m cont.
  fis,8 cis' fis a cis, fis a cis,) |

  %% Bar 7: D - home
  d,8( a' d fis a, d fis a, |

  %% Bar 8: D - loop point
  d,8 a' d fis a, d fis a,) |

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
