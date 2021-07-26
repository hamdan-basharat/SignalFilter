%Tony Fan 200003466
%Hamdan Basharat 400124515
%3A03 Assignment 4
clear;
clc;
close all;

EEG = load ('EEGdata_assignment4.mat');
BFV = load ('BVFdata_assignment4.mat');

%sampling frequencies
EEG_Fs = 200;
BFV_Fs = 100;

%Signal arrays
EEGa4 = EEG.EEGa4;
BFVdu = BFV.BFVdu;

%---------------------Plotting EEG and BFV time signals-------------------%
figure
%set(handles.figure1,'Name','eurhdfgj');
plot([(0:length(EEGa4)-1)/EEG_Fs],EEGa4);
title('Time-domain signal')
ylabel('EEGa4(t)')
xlabel('t(s)')

figure
plot([(0:length(BFVdu)-1)/BFV_Fs],BFVdu);
title('Time-domain signal')
ylabel('BFVdu(t)')
xlabel('t(s)')
%-------------Plotting Magnitude and Phase Spectrum-----------------------%
%calculating DFT and spectral values for EEG and BFV
[mEEG,pEEG,fEEG] = fourier_dt(EEGa4,EEG_Fs,'half');
[mBFV,pBFV,fBFV] = fourier_dt(BFVdu,BFV_Fs,'half');

%Plotting EEG magnitude and phase spectrum
figure
subplot(2,1,1)
plot(fEEG,mEEG);
ylabel('|EEGa4(f)|')
title('Magnitude Spectrum of EEGdata')
subplot(2,1,2)
plot(fEEG,pEEG);
ylabel('\angle EEGa4(f)')
xlabel('f(Hz)')
title('Phase Spectrum of EEGdata')

%Plotting BFV magnitude and phase spectrum
figure
subplot(2,1,1)
plot(fBFV,mBFV);
ylabel('|BFVdu(f)|')
title('Magnitude Spectrum of BVFdata')
subplot(2,1,2)
plot(fBFV,pBFV);
ylabel('\angle BFVdu(f)')
xlabel('f(Hz)')
title('Phase Spectrum of BFVdata')

%-----------------Filter-------------------%
