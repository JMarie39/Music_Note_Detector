% Script for the Harmonic Product Spectrum.

% This code was adapted from "MATLAB code for Harmonic Product Spectrum" by Ederwander
%     Title: MATLAB code for Harmonic Product Spectrum
%     Author: ederwander
%     Date: 2013, November 5
%     Code version: 3.0  
%     Availability: https://stackoverflow.com/questions/19765486/matlab-code-for-harmonic-product-spectrum
%     License: CC BY-SA 3.0 (Free to Share & Adapt) 

function HPS = hps(y, Fs) 
% Function: hps
% Parameter: (y) - sample data, (Fs) - sample rate
% Return: HPS
    ds_1 = downsample(y, 1);  % downsample by 1 
    ds_2 = downsample(y, 2);  % downsample by 2 
    ds_3 = downsample(y, 3);  % downsample by 3 
    ds_4 = downsample(y, 4);  % downsample by 4 
    ds_5 = downsample(y, 5);  % downsample by 5 
    
    N = length(ds_5); % get the lowest length since error will produce for a length higher than HPS
    y = []; % array for containing the multiplication of the downsamples
    % get the length of the smallest downsample, to prevent indexing errors
    for x = 1 : N
        y(x) =  ds_1(x) * ds_2(x) * ds_3(x)* ds_4(x) * ds_5(x);
    end
    % loop multiplying the downsamples 
        % ignore row, get the peaks in the second parameter
    [~, n] = findpeaks(y, 'SortStr', 'descend'); % insert ~ in the first param to ignore row

    % Peak sorting by descendance, largest values first to get the first few
    % peak values
    Maximum = n(1); % get the first as a harmonic or f0 
    
    subplot(3,1,3), plot(y), xlabel('Seconds'), ylabel('Amplitude'), title("Harmonic Product Spectrum");
    
    HPS = ( (Maximum*Fs) / 8192 );  % calculate the frequency Max Value * Sampling Rate / Signal Length
end