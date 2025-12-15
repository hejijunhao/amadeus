%% globals.ly
%% Shared musical parameters for all scores
%% Override these in individual scores as needed

\version "2.24.0"

%% ============================================================
%% DEFAULT MUSICAL PARAMETERS
%% ============================================================

%% Default time signature
globalTime = {
  \time 4/4
}

%% Default key signature
globalKey = {
  \key c \major
}

%% Default tempo
globalTempo = {
  \tempo "Moderato" 4 = 100
}

%% ============================================================
%% COMBINED GLOBAL SETTINGS
%% ============================================================

%% Use this in scores to apply all defaults at once
global = {
  \globalTime
  \globalKey
  \globalTempo
}

%% ============================================================
%% COMMON ARTICULATION SHORTCUTS
%% ============================================================

%% Breath mark shortcut
breathmark = { \breathe }

%% Fermata shortcut
fermataBar = { \bar "|." }

%% ============================================================
%% MIDI SETTINGS
%% ============================================================

%% Standard MIDI instrument assignments
midiPiano = "acoustic grand"
midiStrings = "string ensemble 1"
midiOrgan = "church organ"
