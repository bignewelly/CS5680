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


