%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sinusoidal Signal Generation and Visualization
%
% Generates three sine waves (10 Hz, 100 Hz, 500 Hz) and plots each
% individually using subplots.
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
