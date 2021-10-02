% Jonathon Pearson
% Assignment 3

clear;

% load image

% -----Problem 1-----
threeByThree = double([1 1 1; 1 2 1; 1 1 1]);
threeByThree = threeByThree/sum(threeByThree, 'all');
fiveByFive = double([1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1]);
fiveByFive = fiveByFive/sum(fiveByFive, 'all');

circuitIm = imread('Circuit.jpg');

avgFilt3X3CircuitIm = AverageFiltering(circuitIm, threeByThree);
avgFilt5X5CircuitIm = AverageFiltering(circuitIm, fiveByFive);

%display images
figure();

%display circuitIm on the left
subplot(1,3,1);
imshow(circuitIm);
title('Original Circuit Image');

%display avgFilt3X3CircuitIm in top right
subplot(1,3,2);
imshow(avgFilt3X3CircuitIm);
title('3X3 Weighted Filter');

%display avgFilt5X5CircuitIm in bottom left
subplot(1,3,3);
imshow(avgFilt5X5CircuitIm);
title('5X5 Standard Filter');

disp("-----Finish Solving Problem 1-----")
pause

% -----Problem 2-----
% TODO: Solve Problem 2
weighted3X3 = [1 2 1; 2 4 2; 1 2 1];
standard3X3 = [1 1 1; 1 1 1; 1 1 1];

medWeightedFiltCircuitIm = MedianFiltering(circuitIm, weighted3X3);
medStandardFiltCircuitIm = MedianFiltering(circuitIm, standard3X3);

%display images
figure();

%display circuitIm on the left
subplot(1,3,1);
imshow(circuitIm);
title('Original Circuit Image');

%display avgFilt3X3CircuitIm in top right
subplot(1,3,2);
imshow(medWeightedFiltCircuitIm);
title('3X3 Weighted Filter');

%display avgFilt5X5CircuitIm in bottom left
subplot(1,3,3);
imshow(medStandardFiltCircuitIm);
title('3X3 Standard Filter');
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


