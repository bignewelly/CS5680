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

disp("-----Finish Solving Problem 1-----")
pause;

% -----Problem 2-----
disp("-----Finish Solving Problem 2-----")
pause;

% -----Problem 3-----
disp("-----Finish Solving Problem 3-----")
pause;

clear;
close all;


