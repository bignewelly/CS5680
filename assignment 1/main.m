% Jonathon Pearson
% Assignment 1

clear;

% -----Problem 1-----
% load image
pepperIm = imread('peppers.bmp');

figure();

imshow(pepperIm);
title('RGB Original Image');

disp("-----Finish Solving Problem 1-----")
pause


% -----Problem 2-----
%get all of our matrices 
pepperGrayIm = rgb2gray(pepperIm);
pepperGrayImT = pepperGrayIm.';

pepperGrayImH(1:256, :) = pepperGrayIm(257:512, :);
pepperGrayImH(257:512, :) = pepperGrayIm(1:256, :);

pepperGrayImF = fliplr(pepperGrayIm);

%display images
figure();

%display pepperGrayIm in top left
subplot(2,2,1);
imshow(pepperGrayIm);
title('pepperGrayIm');

%display pepperGrayImT in top right
subplot(2,2,2);
imshow(pepperGrayImT);
title('pepperGrayImT');

%display pepperGrayImH in bottom left
subplot(2,2,3);
imshow(pepperGrayImH);
title('pepperGrayImH');

%display pepperGrayImF in bottom right
subplot(2,2,4);
imshow(pepperGrayImF);
title('pepperGrayImF');


disp("-----Finish Solving Problem 2-----")
pause



% -----Problem 3-----
%TODO: Solve problem 3
pGmax = max(pepperGrayIm, [], 'all');
pGmin = min(pepperGrayIm, [], 'all');
pGmean = mean(pepperGrayIm, 'all');
pGmed = median(pepperGrayIm, 'all');

[maxValue, minValue, meanValue, medianValue] = FindInfo(pepperGrayIm);

if pGmax == maxValue
    disp('maxValue returned expected result.');
else
    disp('maxValue did not return expected result.');
end

disp('Expected:');
disp(pGmax);
disp('Actual:');
disp(maxValue);
   


if pGmin == minValue
    disp('minValue returned expected result.');
else
    disp('minValue did not return expected result.');
end

disp('Expected:');
disp(pGmin);    
disp('Actual:');
disp(minValue);

if pGmean == meanValue
    disp('meanValue returned expected result.');
else
    disp('meanValue did not return expected result.');
end

disp('Expected:');
disp(pGmean);    
disp('Actual:');
disp(meanValue);

if pGmed == medianValue
    disp('medianValue returned expected result.');
else
    disp('medianValue did not return expected result.');
end

disp('Expected:');
disp(pGmed);
disp('Actual:');
disp(medianValue);

disp("-----Finish Solving Problem 3-----")
pause


% -----Problem 4-----
if maxValue > 0
    pepperGrayImN = double(pepperGrayIm)./double(maxValue);
else
    pepperGrayImN = double(pepperGrayIm);
end

figure();

imshow(pepperGrayImN);
title('Normalized Grayscale Image');

pepperGrayImP = pepperGrayImN;

[row, col] = size(pepperGrayImP);
rHalf = fix(row/2);
cHalf = fix(col/2);

% update 2nd quarter
pepperGrayImP(1:rHalf, cHalf + 1:col) = pepperGrayImP(1:rHalf, cHalf + 1:col).^1.25;

% update 3rd quarter
pepperGrayImP(rHalf + 1:row, 1:cHalf) = pepperGrayImP(rHalf + 1:row, 1:cHalf).^0.75;

figure();

imshow(pepperGrayImP);
title('Processed Grayscale Image');

imwrite(pepperGrayImP, 'Jonathon_pepperGrayImP.jpg');
disp("-----Finish Solving Problem 4-----")
pause

% -----Problem 5-----
% set threshold value
t = 0.35;

% My method 1
bw1 = zeros(size(pepperGrayImN));
tVals = find(pepperGrayImN > t);
bw1(tVals) = 1;

% My method 2
bw2 = ones(size(pepperGrayImN));
tVal2s = find(pepperGrayImN <= t);
bw2(tVal2s) = 0;

% Matlab method
bw3 = imbinarize(pepperGrayImN, t);

% report results
if bw1 == bw3 & bw2 == bw3
    disp('Both of my methods worked');
elseif bw1 == bw3
    disp('My first method worked, but not my second.');
elseif bw2 == bw3
    disp('My second method worked, but not my first.');
else
    disp('Neither of my methods worked.');
end

%display images
figure();

%display bw1 on the left
subplot(1,3,1);
imshow(bw1);
title('my first method');

%display bw2 in the middle
subplot(1,3,2);
imshow(bw2);
title('my second method');

%display bw3 on the right
subplot(1,3,3);
imshow(bw3);
title('Matlab method');

disp("-----Finish Solving Problem 5-----")
pause

% -----Problem 6-----
%TODO: Solve problem 6
disp("-----Finish Solving Problem 6-----")
pause

% -----Problem 7-----
clear;
close all;
disp("-----Finish Solving Problem 7-----")
pause


