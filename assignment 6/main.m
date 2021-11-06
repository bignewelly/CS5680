% Jonathon Pearson
% Assignment 6

clear;

% -----Problem 1-----
ballIm = imread('ball.bmp');

% get HSV
hsvBallIm = rgb2hsv(ballIm);

% get hue
hueBallIm = squeeze(hsvBallIm(:, :, 1));
blackIds = find(hueBallIm <= 0.1 | hueBallIm >= 0.9);

binaryBallIm = zeros(size(ballIm));
binaryBallIm(blackIds) = 1;

closedBallIm = imopen(binaryBallIm, strel('disk',4,0));
closedBallIm = imclose(closedBallIm, strel('disk',7,0));

% display images
figure();

%display hue of hsvBallIm
subplot(2,1,1);
imshow(hueBallIm, []);
title('Hue of ball.bmp');

%display closedBallIm
subplot(2,2,3);
imshow(binaryBallIm, []);
title('Display Closed ball.');

%display closedBallIm
subplot(2,2,4);
imshow(closedBallIm, []);
title('Display Closed ball.');

% get the center
[M, N] = size(closedBallIm);
smallestM = M;
largestM = 0;
smallestN = N;
largestN = 0;
for m=1:M
    firstn = find(closedBallIm(m, :) > 0, 1, 'first');
    lastn = find(closedBallIm(m, :) > 0, 1, 'last');
    
    if firstn < smallestN
        smallestN = firstn;
    end
    if lastn > largestN
        largestN = lastn;
    end
        
end

for n=1:N
    firstm = find(closedBallIm(:, n) > 0, 1, 'first');
    lastm = find(closedBallIm(:, n) > 0, 1, 'last');
    
    if firstm < smallestM
        smallestM = firstm;
    end
    if lastm > largestM
        largestM = lastm;
    end 
end

centerM = uint16((smallestM + largestM)/2);
centerN = uint16((smallestN + largestN)/2);

% change center to blue
crossSize = 4;
crossedBallIm = ballIm;
crossedBallIm(centerM - crossSize: centerM + crossSize, centerN, 1:2) = 0;
crossedBallIm(centerM, centerN - crossSize: centerN + crossSize, 1:2) = 0;
crossedBallIm(centerM - crossSize: centerM + crossSize, centerN, 3) = 255;
crossedBallIm(centerM, centerN - crossSize: centerN + crossSize, 3) = 255;

% display images
figure();

%display hue of crossedBallIm
imshow(crossedBallIm, []);
title('Marked Ball Center');


% -----Problem 2-----
% get saturation
satBallIm = squeeze(hsvBallIm(:, :, 2));

% get value
valBallIm = squeeze(hsvBallIm(:, :, 3));
blackIds = find(hueBallIm <= 0.1 | hueBallIm >= 0.9);

% display images
figure();

%display saturation of ballIm
subplot(1,2,1);
imshow(satBallIm, []);
title('Saturation of Ball image');

%display sampleIm on the top
subplot(1,2,2);
imshow(valBallIm, []);
title('Value of Ball image');

disp("-----Finish Solving Problem 1-----")
pause;

% -----Problem 2-----
elephant1Im = imread('Elephant1.jpg');
elephant2Im = imread('Elephant2.jpg');
horse1Im = imread('Horse1.jpg');
horse2Im = imread('Horse2.jpg');

nHSVHistElephant1Im = CalNormalizedHSVHist(rgb2hsv(elephant1Im), 4, 4, 4);
nHSVHistElephant2Im = CalNormalizedHSVHist(rgb2hsv(elephant2Im), 4, 4, 4);
nHSVHistHorse1Im = CalNormalizedHSVHist(rgb2hsv(horse1Im), 4, 4, 4);
nHSVHistHorse2Im = CalNormalizedHSVHist(rgb2hsv(horse2Im), 4, 4, 4);

figure();

%display nHSVHistElephant1Im on the top left
subplot(2,2,1);
bar(nHSVHistElephant1Im);
title('Elephant1 Histogram');
xlabel('Intensity Value');
ylabel('Pixel Count');

%display nHSVHistElephant2Im histogram on top right
subplot(2,2,2);
bar(nHSVHistElephant2Im);
title('Elephant2 Histogram');
xlabel('Intensity Value');
ylabel('Pixel Count');

%display nHSVHistHorse1Im on the bottom left
subplot(2,2,3);
bar(nHSVHistHorse1Im);
title('Horse1 Histogram');
xlabel('Intensity Value');
ylabel('Pixel Count');

%display nHSVHistHorse2Im histogram on bottom right
subplot(2,2,4);
bar(nHSVHistHorse2Im);
title('Horse2 Histogram');
xlabel('Intensity Value');
ylabel('Pixel Count');

%Problem 2.2
% store each of the images and there histograms in a matrix and call them
% our database
histDB = [nHSVHistElephant1Im; nHSVHistElephant2Im; nHSVHistHorse1Im; nHSVHistHorse2Im];

% query from Elephant1
elephant1Results = QueryImageDatabase(nHSVHistElephant1Im, histDB);
DisplayResults(elephant1Results);

% query from Elephant2
elephant2Results = QueryImageDatabase(nHSVHistElephant2Im, histDB);
DisplayResults(elephant2Results);

% query from Horse1
horse1Results = QueryImageDatabase(nHSVHistHorse1Im, histDB);
DisplayResults(horse1Results);

% query from Horse2
horse2Results = QueryImageDatabase(nHSVHistHorse2Im, histDB);
DisplayResults(horse2Results);

% query from Elephant1
elephant1Results = QueryImageDatabase(nHSVHistElephant1Im, histDB);
disp("-----Finish Solving Problem 2-----")
pause;

% -----Problem 3-----
disp("-----Finish Solving Problem 3-----")
pause;

clear;
close all;


