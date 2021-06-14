% Script for detecting the note.

function note = detectNote(P)
% Function: detectNote - Musical notes including the semitones (sharps / flats)
% Parameter: (P) - pitch from findPitch(F)
% Returns: note
    switch (P)
        case 1 
            note = "C";
        case 2
            note = "C#";
        case 3
            note = "D";
        case 4
            note = "D#";
        case 5
            note = "E";
        case 6
            note = "F";
        case 7
            note = "F#";
        case 8
            note = "G";
        case 9
            note = "G#";
        case 10
            note = "A";
        case 11
            note = "A#";
        case 12
            note = "B";
    end
end