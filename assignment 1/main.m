% Jonathon Pearson
% Assignment 1

clear;

% -----Problem 1-----
% load image
pepperIm = imread('peppers.bmp');

f = figure();

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
%TODO: Solve problem 4
disp("-----Finish Solving Problem 4-----")
pause

% -----Problem 5-----
%TODO: Solve problem 5
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


