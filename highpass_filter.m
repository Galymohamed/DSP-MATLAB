%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% High-Pass FIR Filter Design and Signal Filtering
%
% Generates three sine waves (10 Hz, 100 Hz, 500 Hz), mixes them, then
% applies a high-pass FIR filter (via convolution) to isolate the 500 Hz
% component and remove low-frequency content.
%
% Filter Specs:  fs = 2000 Hz  |  fc = 400 Hz  |  Order: 100  |  Type: High-Pass FIR
%
% Author: Mohamed GALY
% Date: 2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%============================= HouseKeeping ==============================%
clc;        % clear command window
close all;  % close all figures
clear;      % clear variables in the workspace
workspace;  % make sure workspace is open
%=========================================================================%

%============================= Format Setting ============================%
format long g   % 15 significant digits, fixed-point or scientific
format compact  % reduce vertical spacing in output
fontsize = 2;   % figure font size scale
%=========================================================================%

%========================== Generating-signal ============================%
% Time vector: 0 to 0.5 s at fs = 2000 Hz → 1001 samples
t = 0 : 1/2000 : 0.5;
%=========================================================================%

%========================== Define the wave parameters ===================%
%================================== Signal-1 =============================%
f1 = 10;    % 10 Hz
T1 = 1/f1;  % period
amp1 = 1;   % amplitude

%================================== Signal-2 =============================%
f2 = 100;   % 100 Hz
T2 = 1/f2;  % period
amp2 = 1;   % amplitude

%================================== Signal-3 =============================%
f3 = 500;   % 500 Hz
T3 = 1/f3;  % period
amp3 = 1;   % amplitude
%=========================================================================%

%========================== Create the signals ===========================%
signal1 = amp1 * sin(2*pi*t/T1); % 10 Hz
signal2 = amp3 * sin(2*pi*t/T2); % 100 Hz
signal3 = amp2 * sin(2*pi*t/T3); % 500 Hz
%=========================================================================%

%========================== Mixing the signals ===========================%
Mixsignal = signal1+ signal2+ signal3;
%=========================================================================%

%========================== NOOP PLOT ====================================%
%plot(t,signal1)
%plot(t,signal2)
%plot(t,signal3)
%plot(t,Mixsignal)
%=========================================================================%

%========= Creating a 101-tap High-Pass FIR filter (fc = 400 Hz) ========%
fc = 400;  % cutoff frequency [Hz]
fs = 2000; % sampling frequency [Hz]
h = fir1(100, fc/fs, 'high'); % FIR impulse response (101 taps)
L = length(h);
%plot(h);
%freqz(h);
%=========================================================================%

%============================ Filter the signal ==========================%
filterSig = conv(h,Mixsignal);
plot(filterSig);
%=========================================================================%

%=========================================================================%
%plot input signal vs filtered signal
subplot(3,1,1);
plot(Mixsignal,'r.-','LineWidth',1,'MarkerSize',1);
title('Input Signal');

subplot(3,1,2);
plot(signal3,'b.-','LineWidth',1,'MarkerSize',1);
title('Original 500Hz Signal');

subplot(3,1,3);
plot(filterSig,'g.-','LineWidth',1,'MarkerSize',1);
title('Filtered Signal');
%=========================================================================%

% Save filter kernel (fc = 400 Hz) to CSV
csvwrite('Highpass_Filter_fc_400Hz.txt', h);
