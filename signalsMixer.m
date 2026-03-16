%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Multi-Frequency Sine Wave Mixing and Visualization
%
% Generates three sine waves (10 Hz, 100 Hz, 500 Hz), combines them into
% a composite signal, and plots all four waveforms using subplots.
%
% Parameters:  fs = 2000 Hz  |  Duration: 0–0.5 s  |  Total: 1001 samples
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

%=========================== PRO PLOT ====================================%
figure; % Create a new figure window

% Row 1: 10 Hz
subplot(4,1,1)
plot(t,signal1,'b.-','LineWidth',1,'MarkerSize',1);
title('10 Hz signal');
% Row 2: 100 Hz
subplot(4,1,2)
plot(t,signal2,'b.-','LineWidth',1,'MarkerSize',1);
title('100 Hz signal');
% Row 3: 500 Hz
subplot(4,1,3)
plot(t,signal3,'b.-','LineWidth',1,'MarkerSize',1);
title('500 Hz signal');
% Row 4: combined
subplot(4,1,4)
plot(t,Mixsignal,'g.-','LineWidth',1,'MarkerSize',1);
title('Combined signal');
%=========================================================================%