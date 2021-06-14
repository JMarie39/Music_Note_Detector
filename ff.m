% Script for the Fundamental Frequency.

% This code was adapted from "MATLAB code for Harmonic Product Spectrum" by Ederwander
%     Title: MATLAB code for Harmonic Product Spectrum
%     Author: ederwander
%     Date: 2013, November 5
%     Code version: 3.0  
%     Availability: https://stackoverflow.com/questions/19765486/matlab-code-for-harmonic-product-spectrum
%     License: CC BY-SA 3.0 (Free to Share & Adapt) 

function fundamental_frequency = ff(y, Fs)
% Function: ff - Gets the fundamental frequency
% Parameters: (y) - sample data, (Fs) - sample rate
% Return: fundamental_frequency
    N = 8192; % CHOSEN SIGNAL LENGTH
    window = y(1:N); % window the signal 
    W = length(window); % get the length
    window = window .* hann(W); % apply hanning to window 
    newFourier = fft(window, N); % Fast Fourier Transform of the Window
    newFourier = newFourier(1 : size(newFourier, 1) / 2); % Half the DFT
    newFourier = abs(newFourier); % absolute value
    fundamental_frequency = hps(newFourier, Fs); % call function for Harmonic Product Spectrum 
    
    %-- Plot --
    subplot(3,1,2), plot(newFourier), xlabel('Seconds'), ylabel('Amplitude'), title("New Fourier");
end 