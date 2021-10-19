% Jonathon Pearson
% Assignment 4

clear;

% -----Problem I-----
sampleIm = imread('Sample.jpg');

cFSampleIm = fftshift(fft2(sampleIm));

gFilter = zeros(size(sampleIm));
bWFilter = zeros(size(sampleIm));

%get Gaussian low-pass filter
[M, N] = size(sampleIm);
D0sqrd = 25*75;
D0sqrd2 = 50^2;
e = exp(1);
for u = 1:M
    for v = 1: N
        % Get the distance from origin
        Dsqrd = (u - (M/2 + 1))^2 + (v - (N/2 + 1))^2;
        
        % Set Gaussian filter
        gFilter(u,v) = e^(-Dsqrd/(2*D0sqrd));
        
        % Set butterworth filter
        bWFilter(u,v) = 1/(1 +(D0sqrd2/Dsqrd)^2);
        
    end
end

% Problem I - 1
% apply Guassian low-pass filter
gFilteredSampleIm = uint8(real(ifft2(ifftshift(cFSampleIm .* gFilter))));

% display images
figure();

%display sampleIm on the top
subplot(2,1,1);
imshow(sampleIm);
title('Original Sample Image');

%display gFilter in bottom left
subplot(2,2,3);
imshow(gFilter);
title('Gaussian Filter');

%display gFilteredSampleIm in bottom right
subplot(2,2,4);
imshow(gFilteredSampleIm);
title('Filtered Image');

% Problem I - 2
% apply butterworth hight-pass filter
bWFilteredSampleIm = uint8(real(ifft2(ifftshift(cFSampleIm .* bWFilter))));

%display images
figure();

%display sampleIm on the top
subplot(2,1,1);
imshow(sampleIm);
title('Original Sample Image');

%display bWFilter in bottom left
subplot(2,2,3);
imshow(bWFilter);
title('Butterworth Filter');

%display gFilteredSampleIm in bottom right
subplot(2,2,4);
imshow(bWFilteredSampleIm);
title('Filtered Image');

disp("-----Finish Solving Problem I-----")
pause;

% -----Problem II-----
%TODO: Solve Problem II

% -----Problem II-1-----
capitolIm = imread('Capitol.jpg');
cFCapitolIm = fftshift(fft2(capitolIm));

% get magnitude and phase of frequency domain
fMagSampleIm = abs(cFSampleIm);
fPhaseSampleIm = angle(cFSampleIm);

% get maginitude and phase
%call abs
fMagCapitolIm = abs(cFCapitolIm);
%call angle
fPhaseCapitolIm = angle(cFCapitolIm);

realMagSampleIM = real(log(fMagSampleIm));
realPhaseSampleIm = real(fPhaseSampleIm);
realMagCapitolIm = real(log(fMagCapitolIm));
realPhaseCapitolIm = real(fPhaseCapitolIm);

scaledFMagSampleIm =uint8(double(realMagSampleIM - min(realMagSampleIM, [], 'all'))./double(max(realMagSampleIM, [], 'all') - min(realMagSampleIM, [], 'all')).*255);
scaledFPhaseSampleIm =uint8(double(realPhaseSampleIm - min(realPhaseSampleIm, [], 'all'))./double(max(realPhaseSampleIm, [], 'all') - min(realPhaseSampleIm, [], 'all')).*255);
scaledFMagCapitolIm =uint8(double(realMagCapitolIm - min(realMagCapitolIm, [], 'all'))./double(max(realMagCapitolIm, [], 'all') - min(realMagCapitolIm, [], 'all')).*255);
scaledFPhaseCapitolIm =uint8(double(realPhaseCapitolIm - min(realPhaseCapitolIm, [], 'all'))./double(max(realPhaseCapitolIm, [], 'all') - min(realPhaseCapitolIm, [], 'all')).*255);

%display images
figure();

%display scaledFMagSampleIm on the top left
subplot(2,2,1);
imshow(scaledFMagSampleIm);
title('Maginitude of Sample.jpg');

%display scaledFPhaseSampleIm in top right
subplot(2,2,2);
imshow(scaledFPhaseSampleIm);
title('Phase of Sample.jpg');

%display scaledFMagCapitolIm on the top left
subplot(2,2,3);
imshow(scaledFMagCapitolIm);
title('Maginitude of Capitol.jpg');

%display scaledFPhaseCapitolIm in top right
subplot(2,2,4);
imshow(scaledFPhaseCapitolIm);
title('Phase of Capitol.jpg');

% -----Problem II-2-----
% reconstruct images with switched magnitudes
magSwitchCapitolIm = uint8(real(ifft2(ifftshift(fMagSampleIm .* exp(fPhaseCapitolIm.*1i)))));
magSwitchSampleIm = uint8(real(ifft2(ifftshift(fMagCapitolIm .* exp(fPhaseSampleIm.*1i)))));

%display images
figure();

%display magSwitchCapitolIm on the left
subplot(1,2,1);
imshow(magSwitchCapitolIm);
title('New Capitol Image');

%display magSwitchSampleIm in top right
subplot(1,2,2);
imshow(magSwitchSampleIm);
title('New Sample Image');

disp("-----Finish Solving Problem II-----")
pause;
% -----Problem III-----
%TODO: Solve Problem III
boyNoisyIm = imread('boy_noisy.gif');



disp("-----Finish Solving Problem III-----")
pause;

% -----Problem IV-----
%TODO: Solve Problem IV
disp("-----Finish Solving Problem IV-----")
pause;

% -----Problem V-----
%TODO: Solve Problem V
disp("-----Finish Solving Problem V-----")
pause;

clear;
close all;


