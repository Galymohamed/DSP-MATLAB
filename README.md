# DSP-MATLAB

A collection of Digital Signal Processing (DSP) scripts implemented in MATLAB, covering signal generation, FIR/IIR filter design, frequency analysis, and embedded-ready coefficient export.

---

## Scripts

| File | Description |
|------|-------------|
| `sinewave_generator.m` | Generates and plots individual sine waves at 10, 100, and 500 Hz |
| `signalsMixer.m` | Combines multiple sine waves into a composite signal and visualizes all components |
| `lowpass_filter.m` | Designs a 101-tap low-pass FIR filter (fc = 70 Hz) and filters a mixed signal |
| `highpass_filter.m` | Designs a 101-tap high-pass FIR filter (fc = 400 Hz) and isolates the 500 Hz component |
| `accelGyro_FIR.m` | Designs a low-pass FIR filter (fc = 10 Hz, Hamming window) for IMU sensor data |
| `DFT.m` | Computes and plots the single-sided FFT amplitude spectrum of a mixed signal |
| `IIR_sos_coeffs_generator.m` | Exports IIR SOS filter coefficients as a C header file for ARM CMSIS-DSP |

---

## Requirements

- MATLAB (R2018a or later)
- Signal Processing Toolbox

---

## Usage

Each script is standalone. Open the desired `.m` file in MATLAB and run it directly. Output files (filter kernels, signal samples) are saved as `.txt` CSV files in the working directory.

---

## Author

**Mohamed GALY**

---

## License

MIT License — see [LICENSE](LICENSE) for details.
