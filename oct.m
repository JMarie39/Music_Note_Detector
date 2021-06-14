% Script for detecting the octave.

function octave = oct(F, O)
% Function: oct - Musical notes including the semitones (sharps / flats)
% Parameters: (F) - frequency, (O) -  default 4 in its first call as the default interval or center
% Returns: octave
    if (F < 261.63) % just like pitch func, recursively call the function, )
        F = F*2; % except octave is (4-N), for N increases every call after its first call
        O = O-1;
        octave = oct(F, O);
    elseif (F >= 523.25) % the B4 covers the first half of the midpoint between C5 and itself
        F = F/2;  
        O = O+1;  % just like pitch func, recursively call the function, )
        octave = oct(F, O);  % except octave is (4-N), for N increases every call after its first call
    else 
        octave = O;  
    end
end