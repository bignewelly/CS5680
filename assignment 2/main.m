% Jonathon Pearson
% Assignment 2

clear;

% load image
foodIm = imread('Food.jpg');

sizeOri = numel(foodIm);

maxValue = 0;
minValue = 255;
totalValue = double(0);

% Get maxValue, minValue, and totalValue
for i = 1:sizeOri
    if maxValue < foodIm(i)
        maxValue = foodIm(i);
    end

    if minValue > foodIm(i)
        minValue = foodIm(i);
    end

    totalValue = totalValue + double(foodIm(i));
end

% calculate meanValue
meanValue = double(totalValue)/double(sizeOri);

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
% TODO solve problem 2
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


