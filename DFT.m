%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DFT / FFT Spectrum Analysis of a Multi-Frequency Signal
%
% Generates three sine waves (10 Hz, 100 Hz, 500 Hz), combines them, then
% computes and plots the single-sided amplitude spectrum via FFT.
%
% Parameters:  fs = 2000 Hz  |  Duration: 0–0.5 s  |  Signals: 10/100/500 Hz
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

%========================== DFT of the original signal ===================%
signal_fft = fft(Mixsignal);
%plot(signal_fft);

%========================= Plot the DFT ==================================%
% Signal length
L = length(Mixsignal);
% FFT magnitude
signal_magnitude = abs(signal_fft);

fs = 2000;
f  = fs*(0:(L/2))/L;
p2 = abs(signal_fft/L);
p1 = p2(1: L/2+1);
p1(2:end -1) = 2*p1(2:end-1);
plot(f,p1);
title('signal-sided Amplitude spectrum of x(t)');
xlabel('f(Hz)');
%=========================================================================%


