% Script for finding the pitch.

function pitch = findPitch(F)
% Function: findPitch - find the pitch [numbers correspond to the cases in function note()]
% Parameter: (F) - frequency, from the (f0) - HPS
% Returns: pitch
    if (F >= 261.63 &&  F < 277.18)
        pitch = 1;
    elseif (F >= 277.18 && F < 293.66)
        pitch = 2;
    elseif (F >= 293.66 && F < 311.13)
        pitch = 3;       
    elseif (F >= 311.13 && F < 329.63)
        pitch = 4;
    elseif (F >= 329.63 && F < 349.23)
        pitch = 5;        
    elseif (F >= 349.23 && F < 369.99)
        pitch = 6;      
    elseif (F >= 369.99 && F < 392.00)
        pitch = 7;     
    elseif (F >= 392.00 && F < 415.30)
        pitch = 8;            
    elseif (F >= 415.30 && F < 440.00)
        pitch = 9;           
    elseif (F >= 440.00 && F < 466.16)
        pitch = 10;         
    elseif (F >= 466.16 && F < 493.88)
        pitch = 11;       
    elseif (F >= 493.88 && F < 523.25)
        pitch = 12;    
    else
        if (F < 261.63) % if frequency is lower than the default octave 4, 
            F = F * 2; % recursively call the function while doubling since
            pitch = findPitch(F); % its double is the same note, just higher octave
        else 
            F = F / 2; % recursively call the function while halving since
            pitch = findPitch(F); % its half is the same note, just lower octave
        end
    end
end