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
uD0sqrd = 75^2;
vD0sqrd = 25^2;
D0sqrd2 = 50^2;
e = exp(1);
for u = 1:M
    for v = 1: N
        % Get the distance from origin
        Dsqrd = (u - (M/2 + 1))^2 + (v - (N/2 + 1))^2;
        
        % Set Gaussian filter
        gFilter(u,v) = exp(-(((u - (M/2 + 1))^2)/(2*uD0sqrd) + ((v - (N/2 + 1))^2)/(2*vD0sqrd)));
        
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
% -----Problem II-1-----
capitolIm = imread('Capitol.jpg');
cFCapitolIm = fftshift(fft2(capitolIm));

% get magnitude and phase of frequency domain
fMagSampleIm = abs(cFSampleIm);
fPhaseSampleIm = angle(cFSampleIm);

% get maginitude and phase
fMagCapitolIm = abs(cFCapitolIm);
fPhaseCapitolIm = angle(cFCapitolIm);

%display images
figure();

%display scaledFMagSampleIm on the top left
subplot(2,2,1);
imshow(log(fMagSampleIm), []);
title('Maginitude of Sample.jpg');

%display scaledFPhaseSampleIm in top right
subplot(2,2,2);
imshow(fPhaseSampleIm, []);
title('Phase of Sample.jpg');

%display scaledFMagCapitolIm on the top left
subplot(2,2,3);
imshow(log(fMagCapitolIm), []);
title('Maginitude of Capitol.jpg');

%display scaledFPhaseCapitolIm in top right
subplot(2,2,4);
imshow(fPhaseCapitolIm, []);
title('Phase of Capitol.jpg');

% -----Problem II-2-----
% reconstruct images with switched magnitudes
magSwitchCapitolIm = ifft2(ifftshift(fMagSampleIm .* exp(fPhaseCapitolIm.*1i)));
magSwitchSampleIm = ifft2(ifftshift(fMagCapitolIm .* exp(fPhaseSampleIm.*1i)));

%display images
figure();

%display magSwitchCapitolIm on the left
subplot(1,2,1);
imshow(real(magSwitchCapitolIm), []);
title('New Capitol Image');

%display magSwitchSampleIm in top right
subplot(1,2,2);
imshow(real(magSwitchSampleIm), []);
title('New Sample Image');

disp("-----Finish Solving Problem II-----")
pause;
% -----Problem III-----
%TODO: Solve Problem III
boyNoisyIm = imread('boy_noisy.gif');

denoised4BoyNoisyIm = Denoise(boyNoisyIm, 4);

%display images
figure();

%display boyNoisyIm on the left
subplot(1,2,1);
imshow(boyNoisyIm);
title('Original Boy Image');

%display magSwitchSampleIm in top right
subplot(1,2,2);
imshow(real(denoised4BoyNoisyIm), []);
title('Denoised Image');

denoised2BoyNoisyIm = Denoise(boyNoisyIm, 2);
denoised3BoyNoisyIm = Denoise(boyNoisyIm, 3);
denoised5BoyNoisyIm = Denoise(boyNoisyIm, 5);
denoised6BoyNoisyIm = Denoise(boyNoisyIm, 6);

%display images
figure();

%display denoised2BoyNoisyIm on the top left
subplot(2,2,1);
imshow(real(denoised2BoyNoisyIm), []);
title('Removed top 2');

%display denoised3BoyNoisyIm in top right
subplot(2,2,2);
imshow(real(denoised3BoyNoisyIm), []);
title('Removed top 3');

%display denoised5BoyNoisyIm on the bottom left
subplot(2,2,3);
imshow(real(denoised5BoyNoisyIm), []);
title('Removed top 5');

%display denoised6BoyNoisyIm in top right
subplot(2,2,4);
imshow(real(denoised6BoyNoisyIm), []);
title('Removed top 6');

disp('It seems that as we remove more of the higher magnitude values,');
disp('the picture looses some of its contrast. The image that we removed');
disp('the two highest magnitudes removed the noise, but left plenty of');
disp('contrast.  As we go higher the contrast is removed in places and');
disp('causes a wave affect.');

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


