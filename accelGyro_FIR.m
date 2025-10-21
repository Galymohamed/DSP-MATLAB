% A Low-Pass FIR Filter for Accelerometer and Gyroscope Data %
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

% Save the lowpass filter kernel (with cutoff frequency of 5 Hz) 
% to a CSV file. 
% The filter kernel is stored in 'LowpassFilter_fc_5Hz_5000Sample.txt'.
csvwrite('accelGyro_firKernel.txt', h);
