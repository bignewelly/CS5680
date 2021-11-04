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
ballIm = imread('Ball.tif');

%problem 1
[labeledBallIm, ballNum] = FindComponentLabels(ballIm, [1 1 1; 1 1 1; 1 1 1]);

% display images
figure();

%display labeledBallIm
imshow(labeledBallIm, []);
title('Labeled Ball.tif');

disp('Total connected objects:');
disp(ballNum);

%problem 2
mlLabeledBallIm = bwlabel(ballIm, 8);
ballConn = bwconncomp(ballIm, 8);
 
% display images
figure();

%display mlLabeledBallIm
imshow(mlLabeledBallIm, []);
title('Matlab Labeled Ball.tif');

disp('Total connected objects according to MATLAB:');
disp(ballConn.NumObjects);

%problem 3
borderBallNum = ballNum;
noBorderLabeledBallIm = labeledBallIm;

[M, N] = size(noBorderLabeledBallIm);

%remove border values on the top and bottom
for m = 1:M
    conObj = [];

    if noBorderLabeledBallIm(m, 1)
        noBorderLabeledBallIm(noBorderLabeledBallIm == noBorderLabeledBallIm(m, 1)) = 0;
        borderBallNum = borderBallNum - 1;
    end
    if noBorderLabeledBallIm(m, N)
        noBorderLabeledBallIm(noBorderLabeledBallIm == noBorderLabeledBallIm(m, N)) = 0;
        borderBallNum = borderBallNum - 1;
    end
end

%remove border values on the left and right
for n = 1:N
    if noBorderLabeledBallIm(1, n)
        noBorderLabeledBallIm(noBorderLabeledBallIm == noBorderLabeledBallIm(1, n)) = 0;
        borderBallNum = borderBallNum - 1;
    end
    if noBorderLabeledBallIm(M, n)
        noBorderLabeledBallIm(noBorderLabeledBallIm == noBorderLabeledBallIm(M, n)) = 0;
        borderBallNum = borderBallNum - 1;
    end
end
 
% display images

figure();

%display ballIm
subplot(1,2,1);
imshow(logical(ballIm));
title('Ball.tif');

%display noBorderLabeledBallIm
subplot(1,2,2);
imshow(logical(noBorderLabeledBallIm));
title('Ball.tif With border objects removed');

disp('Total connected objects not on the border:');
disp(borderBallNum);

%problem 4
mLNoBorderLabeledBallIm = imclearborder(ballIm, 8);
borderBallConn = bwconncomp(mLNoBorderLabeledBallIm, 8);

% display images
figure();

%display noBorderLabeledBallIm
subplot(1,2,1);
imshow(logical(noBorderLabeledBallIm));
title('Ball.tiff With Border Objects Removed');

%display noBorderLabeledBallIm
subplot(1,2,2);
imshow(logical(mLNoBorderLabeledBallIm));
title('Matlab Call');

disp('Total connected objects not on the border according to MATLAB:');
disp(borderBallConn.NumObjects);

%problem 5
histBallIm = CalHist(uint8(noBorderLabeledBallIm), false);

% Get minimum value with a slight threshold
min = min(histBallIm(histBallIm > 0),[],'all') * 1.1;
smallestParticles = find(histBallIm <= min & histBallIm > 0);

visNoBorderLabeledBallIm = ismember(uint8(noBorderLabeledBallIm), smallestParticles - 1);

% display images
figure();

%display ballIm
subplot(1,2,1);
imshow(ballIm);
title('Ball.tif');

%display noBorderLabeledBallIm
subplot(1,2,2);
imshow(logical(visNoBorderLabeledBallIm));
title('Non-overlapping  connected  particles not on the border');

disp('Total non-overlapping connected particles not on the border:');
disp(numel(smallestParticles));

disp("-----Finish Solving Problem II-----")
pause;

clear;
close all;


