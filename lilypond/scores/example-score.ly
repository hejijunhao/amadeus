%% example-score.ly
%% A simple piano piece demonstrating the Amadeus template system

\version "2.24.0"

%% Import house style (engraving rules)
\include "house-style.ly"

%% Import global settings
\include "globals.ly"

%% ============================================================
%% METADATA
%% ============================================================

\header {
  title = "Morning Light"
  subtitle = "for Piano"
  composer = "Amadeus Example"
  opus = "Template Score"
}

%% ============================================================
%% MUSICAL CONTENT
%% ============================================================

%% Right hand (treble)
upper = \relative c'' {
  \clef treble
  \global

  %% Bars 1-4: Opening theme
  e4\p( d c d |
  e4 e e2) |
  d4( d d2) |
  e4( g g2) |

  %% Bars 5-8: Theme repeated with variation
  e4\mp( d c d |
  e4 e e d) |
  d4( d e d |
  c1)\< |

  %% Bars 9-12: Development
  e4\mf( f g a |
  g4 f e d) |
  c4( d e f |
  e2 d) |

  %% Bars 13-16: Return and close
  e4\p( d c d |
  e4 e e2) |
  d4( e d2 |
  c1)\pp\fermata |

  \bar "|."
}

%% Left hand (bass)
lower = \relative c {
  \clef bass
  \global

  %% Bars 1-4
  c2( g' |
  c,2 g') |
  g,2( d' |
  c2 g') |

  %% Bars 5-8
  c,2( g' |
  c,2 g') |
  g,2( g' |
  a2 g) |

  %% Bars 9-12
  a2( e |
  f2 g) |
  a2( g |
  f2 g) |

  %% Bars 13-16
  c,2( g' |
  c,2 g') |
  g,2( g' |
  c,1)\fermata |

  \bar "|."
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
    \tempo 4 = 100
  }
}
