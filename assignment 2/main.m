% Jonathon Pearson
% Assignment 2

clear;

% load image
foodIm = imread('Food.jpg');

sizeOri = numel(foodIm);

maxValue = max(foodIm, [], 'all');
minValue = min(foodIm, [], 'all');

% calculate meanValue
meanValue = mean(foodIm, 'all');

% -----Problem 1-----
% Each of these should throw an exception:
try
    Scaling(foodIm, [0.1 1.2]);
catch ex
    disp(ex.message);
end

try
    Scaling(foodIm, int16([-255 -1]));
catch ex
    disp(ex.message);
end

try
    Scaling(foodIm, int16([255 0]));
catch ex
    disp(ex.message);
end

% Rescale the image to have a good quality range
[scaledFoodIm, transFunc] = Scaling(foodIm, int16([0 255]));

figure();

plot((minValue: maxValue), transFunc);

xlabel('Original Range');
ylabel('Scaled Range');

disp("-----Finish Solving Problem 1-----")
pause

% -----Problem 2-----
% get histograms
hist = CalHist(scaledFoodIm, false);
normHist = CalHist(scaledFoodIm, true);

figure();

%display historgram on the left
subplot(1,2,1);
bar(hist);
title('Histogram');
xlabel('Intensity Value');
ylabel('Pixel Count');

%display normalized histogram on top right
subplot(1,2,2);
bar(normHist);
title('Normalized Histogram');
xlabel('Intensity Value');
ylabel('Pixel Count');

disp("-----Finish Solving Problem 2-----")
pause

% -----Problem 3-----
% TODO: Solve proglem 3
disp("-----Finish Solving Problem 3-----")
pause

% -----Problem 4-----
% TODO solve problem 4
disp("-----Finish Solving Problem 4-----")
pause

% -----Problem 5-----
% TODO solve problem 5
disp("-----Finish Solving Problem 5-----")
pause

clear;
close all;


