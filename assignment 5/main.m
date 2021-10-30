% Jonathon Pearson
% Assignment 5

clear;

% -----Problem I-----
%TODO: Solve Problem I

%Problem 1
wirebondIm = imread('Wirebond.tif');

erode1WirebondIm = imerode(wirebondIm, strel('square', 14));
erode2WirebondIm = imerode(wirebondIm, strel('square', 6));
erode3WirebondIm = imerode(wirebondIm, strel('square', 35));

% display images
figure();

%display erode1WirebondIm
subplot(2,1,1);
imshow(erode1WirebondIm);
title('14x14 Structured Element');

%display erode2WirebondIm
subplot(2,2,3);
imshow(erode2WirebondIm);
title('6x6 Structured Element');

%display erode3WirebondIm
subplot(2,2,4);
imshow(erode3WirebondIm);
title('35x35 Structured Element');


shapesIm = imread('Shapes.tif');

close1ShapesIm = imopen(shapesIm, strel('square', 20));
close2ShapesIm = imclose(shapesIm, strel('square', 20));
close3ShapesIm = imclose(close1ShapesIm, strel('square', 20));

% display images
figure();

%display close1ShapesIm
subplot(2,1,1);
imshow(close1ShapesIm);
title('Opened Image');

%display close2ShapesIm
subplot(2,2,3);
imshow(close2ShapesIm);
title('Closed Image');

%display close3ShapesIm
subplot(2,2,4);
imshow(close3ShapesIm);
title('Open-Closed Image');

%Problem 2
dowelsIm = imread('Dowels.tif');

elDisk = strel('disk', 5);
opClDowelsIm = imclose(imopen(dowelsIm, elDisk), elDisk);
clOpDowelsIm = imopen(imclose(dowelsIm, elDisk), elDisk);

% display images
figure();

%display opClDowelsIm
subplot(1,2,1);
imshow(opClDowelsIm);
title('Open-Closed Image');

%display clOpDowelsIm
subplot(1,2,2);
imshow(clOpDowelsIm);
title('Close-Opened Image');

opClSeriesDowelsIm = dowelsIm;
clOpSeriesDowelsIm = dowelsIm;
for i=2:5
    elDisk = strel('disk', i);
    opClSeriesDowelsIm = imclose(imopen(opClSeriesDowelsIm, elDisk), elDisk);
    clOpSeriesDowelsIm = imopen(imclose(clOpSeriesDowelsIm, elDisk), elDisk);
end

% display images
figure();

%display opClDowelsIm
subplot(1,2,1);
imshow(opClDowelsIm);
title('Opened-Close Series');

%display clOpDowelsIm
subplot(1,2,2);
imshow(clOpDowelsIm);
title('Close-Open Series');

disp("-----Finish Solving Problem II-----")
pause;

% -----Problem II-----
%TODO: Solve Problem II
disp("-----Finish Solving Problem II-----")
pause;

clear;
close all;


