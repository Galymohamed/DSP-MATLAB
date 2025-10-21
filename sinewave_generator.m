%=========================================================================%
% The formula for a sine wave is :
% 
% y = A sin (ωt + φ)
% 
% Where:
% y is the instantaneous value of the wave
% A is the amplitude of the wave
% ω is the angular frequency of the wave, which is equal to 2π times
%   the frequency f of the wave, i.e., ω = 2πf
% t is the time
% φ is the phase angle of the wave, which represents the offset of the wave 
%   from a reference position at t = 0.
%=========================================================================%
%============================= HouseKeeping ==============================%
clc;        % clear command window
close all;  % close all figures
clear;      % clear variables in the workspace
workspace;  % make sure workspace is open
%=========================================================================%
%============================= Format Setting ============================%
% format long g ensures precise numerical results, format compact reduces
%        blank lines between the outputs for a cleaner display.
format long g   % Display numbers with up to 15 significant digits,
                % in fixed-point or scientific notation.
format compact  % Reduce vertical spacing in the command window output
                % for a more compact display.
% set the font size
fontsize = 2;
%=========================================================================%

%========================== Generating-signal ============================%
% 0: The starting value of the sequence.
% 1/2000: The step size (increment) between consecutive values in the 
% sequence. i.e : t = [0, 0.0005, 0.001, 0.0015, ..., 0.4995, 0.5]
% 0.5 End The sequence stops at or just before 0.5.
% Generate a time vector from 0 to 0.5 with a step size of 1/2000.
% Total number of elements = (End - Start) / Step size + 1
                         % = (0.5 - 0) / (1/2000) + 1 = 1001 elements.
% 1/2000 sample: 2000 times sample in 1 second (2KHz sampling rates)
t = 0 : 1/2000 : 0.5;
%=========================================================================%

%========================== Define the wave parameters ===================%
%================================== Signal-1 =============================%
f1 = 10; % 10hz
T1 = 1/f1; % period of the signal 1/freq1
amp1 = 1; % define the amplitude of the signal

%================================== Signal-2 =============================%
f2 = 100; % 100hz
T2 = 1/f2; % period of the signal 1/freq2
amp2 = 1; % define the amplitude of the signal

%================================== Signal-3 =============================%
f3 = 500; % 100hz
T3 = 1/f3; % period of the signal 1/freq3
amp3 = 1; % define the amplitude of the signal
%=========================================================================%

%========================== Create the signals ===========================%
%Create signal 1 
signal1 = amp1 * sin(2*pi*t/T1);
%Create signal 2 
signal2 = amp3 * sin(2*pi*t/T2);
%Create signal 3
signal3 = amp2 * sin(2*pi*t/T3);
%=========================================================================%

%========================== Plot the signal ==============================%

%========================== NOOP PLOT ====================================%
%PLOT Signals%
% plot(t,signal1)
% plot(t,signal2)
% plot(t,signal3)
%=========================================================================%

%=========================== PRO PLOT ====================================%
figure; % Create a new figure window

% First subplot: Signal 1
subplot(3, 1, 1); % Divide the figure into a 3x1 grid, use the 1st section
plot(t, signal1, 'r-', 'LineWidth', 1.5); % Plot signal1 in red
grid on; % Add grid
title('10Hz signal', 'FontSize', 14); % Title for the first plot
xlabel('Time (seconds)', 'FontSize', 12);
ylabel('Amplitude', 'FontSize', 12);

% Second subplot: Signal 2
subplot(3, 1, 2); % Use the 2nd section of the grid
plot(t, signal2, 'g-', 'LineWidth', 1.5); % Plot signal2 in green
grid on; % Add grid
title('100Hz signal', 'FontSize', 14); % Title for the second plot
xlabel('Time (seconds)', 'FontSize', 12);
ylabel('Amplitude', 'FontSize', 12);

% Third subplot: Signal 3
subplot(3, 1, 3); % Use the 3rd section of the grid
plot(t, signal3, 'b-', 'LineWidth', 1.5); % Plot signal3 in blue
grid on; % Add grid
title('500Hz signal', 'FontSize', 14); % Title for the third plot
xlabel('Time (seconds)', 'FontSize', 12);
ylabel('Amplitude', 'FontSize', 12);

% Adjust layout for better spacing
sgtitle('Signals', 'FontSize', 16); % Overall title for the figure
%=========================================================================%
