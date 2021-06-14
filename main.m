% Script to run the program.

% Authors: AGULTO, Juliana Marie B. & NORONA, Yeohan Lorenzo M.
% Course: CEDISP1 S11
% Date: 2021, May

clear all
clc

% Source (Audio file): https://www.mediafire.com/file/zd1mqtazulgv28a/mp3_Notes.rar/file
isRun = true;

while isRun
    
    isFileName = true;

    disp('Instruction: ');
    disp('   Enter file name with its file extension.');
    disp('   Type `exit.` to close the program.');
    disp('- - - - - - - - - - - MUSIC NOTE DETECTOR - - - - - - - - - - -');
    while isFileName  
      filename = input('File name: ', 's'); % File name of the audio
      filepath = strcat('mp3_Notes/', filename);  % Adds the file path of the mp3 Notes to the filename
      checkRun = strcmp(filename, 'exit.');  % Compares the String of the filename with `exit.`

      if exist(filepath, 'file') && ~exist(filepath, 'dir') && checkRun == 0 % To check if file name exist in the folder and file name is not `exit.`
        isFileName = false;
        %---
        [y,Fs] = audioread(filepath); % read audio file
        sound(y, Fs);   % simple playback of the audio file
        [~,n] = size(y); % get the number of columns (channels of audio)
        
        %-- To plot the audio file --
        subplot(3,1,1), plot(0:1/Fs:(length(y(:,1))*1/Fs)-1/Fs, y(:,1)), xlabel('Seconds'), ylabel('Amplitude'), title("Signal of the audio file");

        if n == 2 % This program only works for monophonic / not stereo channels 
            y = y(:, 2); % Converts to mono channel (remove 2nd column / channel) 
        end

        F = ff(y, Fs); % Gets the fundamental frequency
        pitch = findPitch(F); % Find the Pitch
        note = detectNote(pitch); % Find the respective note 
        octave = oct(F,4); % Find the octave interval
        disp("   Note Detected: " + note); 
        disp("   Octave Scale: " + octave);
      elseif checkRun == 1  % To check if the user input is `exit`
          isRun = false;
          isFileName = false;
      else
        disp('Sorry, file name not found.');
      end
    end
    disp('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
    fprintf('\n\n'); % New line
end