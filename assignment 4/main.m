% Jonathon Pearson
% Assignment 4

clear;

% -----Problem I-----
%TODO: Solve Problem I
% Problem I - 1
sampleIm = imread('Sample.jpg');

cFSampleIm = fftshift(fft2(sampleIm));

%TODO: apply Guassian low-pass filter
gFilter = ones(size(sampleIm));
gFilteredSampleIm = uint8(real(ifft2(ifftshift(cFSampleIm))));

%TODO: apply butterworth hight-pass filter
bWFilter = ones(size(sampleIm));
bWFilteredSampleIm = uint8(real(ifft2(ifftshift(cFSampleIm))));

%display images
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
disp("-----Finish Solving Problem II-----")
pause;

% -----Problem III-----
%TODO: Solve Problem III
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


