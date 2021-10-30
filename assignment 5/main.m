% Jonathon Pearson
% Assignment 5

clear;

% -----Problem I-----
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

% problem 3
smallSquaresIm = imread('SmallSquares.tif');

posStrEl = [0 1 0; 0 1 1; 0 0 0];
negStrEl = [1 0 0; 1 0 0; 1 1 1];

postiveMatch = imerode(smallSquaresIm, posStrEl);
negativeMatch = imerode(~smallSquaresIm, negStrEl);

filteredImage = postiveMatch & negativeMatch;

% display images
figure();

%display filteredImage
imshow(filteredImage);
title('Filtered SmallSquares.tif');

disp('Number of forground pixels in filtered image:');
disp(numel(find(filteredImage)));


disp("-----Finish Solving Problem I-----")
pause;

% -----Problem II-----
%TODO: Solve Problem II
ballIm = imread('Ball.tif');

%problem 1
[labeledBallIm, ballNum] = FindComponentLabels(ballIm, [0 1 0; 1 1 1; 0 1 0]);

% display images
figure();

%display labeledBallIm
imshow(labeledBallIm, []);
title('Labeled Ball.tif');

disp('Total connected objects:');
disp(ballNum);
%problem 2
mlLabeledBallIm = bwlabel(ballIm, 4);
ballConn = bwconncomp(ballIm, 4);
 
% display images
figure();

%display mlLabeledBallIm
imshow(mlLabeledBallIm, []);
title('Matlab Labeled Ball.tif');

disp('Total connected objects:');
disp(ballConn.NumObjects);
%problem 3

%problem 4

%problem 5

disp("-----Finish Solving Problem II-----")
pause;

clear;
close all;


