%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Low-Pass FIR Filter for Accelerometer / Gyroscope Data
%
% Designs a low-pass FIR filter using a Hamming window to suppress
% high-frequency noise while preserving low-frequency motion signals.
%
% Filter Specs:  fs = 1000 Hz  |  fc = 10 Hz  |  Order: 25  |  Window: Hamming
%
% Output:  accelGyro_firKernel.txt
%
% Author: Mohamed GALY
% Date: 2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fs = 1000;  % Sampling frequency in Hz
fc = 10;    % Cutoff frequency in Hz
N = 25;     % Filter order (number of taps)

% Design a Low-Pass FIR filter using a Hamming window
h = fir1(N, fc/(fs/2), 'low', hamming(N+1));

% Plot Impulse Response
figure;
stem(h);
title('Low-Pass FIR Filter Impulse Response');
xlabel('Sample Index');
ylabel('Amplitude');

% Plot Frequency Response
%fvtool(h, 'Fs', fs);

% Save filter kernel (fc = 10 Hz) to CSV
csvwrite('accelGyro_firKernel.txt', h);
