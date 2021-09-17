% Jonathon Pearson
% Assignment 2

clear;

% load image
foodIm = imread('Food.jpg');

% -----Problem 1-----
% TODO solve problem 1
% Each of these should throw an exception:
scaling(foodIm, [0.1, 1.2]);
scaling(foodIm, [-255, -1]);
scaling(foodIm, [255, 0]);

% Rescale the image to have a good quality range
[scaledFoodIm, transFunc] = scaling(foodIm, [0, 255]);

figure();
%TODO: show transFunc in graph
imshow(scaledFoodIm);
title('RGB Original Image');

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


