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
subplot(2,1,1);
imshow(circuitIm);
title('Original Circuit Image');

%display avgFilt3X3CircuitIm in top right
subplot(2,2,3);
imshow(avgFilt3X3CircuitIm);
title('3X3 Weighted Filter');

%display avgFilt5X5CircuitIm in bottom left
subplot(2,2,4);
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
subplot(2,1,1);
imshow(circuitIm);
title('Original Circuit Image');

%display avgFilt3X3CircuitIm in top right
subplot(2,2,3);
imshow(medWeightedFiltCircuitIm);
title('3X3 Weighted Filter');

%display avgFilt5X5CircuitIm in bottom left
subplot(2,2,4);
imshow(medStandardFiltCircuitIm);
title('3X3 Standard Filter');
disp("-----Finish Solving Problem 2-----")
pause

% -----Problem 3-----
% TODO: Solve proglem 3
strongFilter = double([1 1 1; 1 -8 1; 1 1 1]);

moonIm = imread('Moon.jpg');

filteredMoonIm = imfilter(double(moonIm), strongFilter);

filteredMoonIm2 = filteredMoonIm;

% set filteredMoonIm2 to max out at 255 and min out at 0 (no scaling)
filteredMoonIm2(find(filteredMoonIm2 > 255)) = 255;
filteredMoonIm2(find(filteredMoonIm2 < 0)) = 0;

scaledFilteredMoonIm =uint8(double(filteredMoonIm - min(filteredMoonIm, [], 'all'))./double(max(filteredMoonIm, [], 'all') - min(filteredMoonIm, [], 'all')).*255);

enhancedMoonIm = moonIm - uint8(filteredMoonIm);

%display images
figure();

%display circuitIm on the left
subplot(2,2,1);
imshow(moonIm);
title('Original Moon Image');

%display avgFilt3X3CircuitIm in top right
subplot(2,2,2);
imshow(filteredMoonIm2);
title('Filtered Image');

%display avgFilt5X5CircuitIm in bottom left
subplot(2,2,3);
imshow(scaledFilteredMoonIm);
title('Scaled Filtered Image');

%display avgFilt5X5CircuitIm in bottom left
subplot(2,2,4);
imshow(enhancedMoonIm);
title('Enhanced Image');

disp("-----Finish Solving Problem 3-----")
pause

% -----Problem II-----
% TODO solve Problem II
riceIm = imread('Rice.jpg');

[riceEdgeIm, riceImHist] = FindEdgeInfo(riceIm, 20);

%display images
figure();

%display circuitIm on the left
subplot(2,1,1);
imshow(riceIm);
title('Original Rice Image');

%display avgFilt3X3CircuitIm in top right
subplot(2,2,3);
imshow(riceEdgeIm);
title('Important edges');

%display avgFilt5X5CircuitIm in bottom left
subplot(2,2,4);
imshow(riceEdgeIm);
title('edge Histogram');

disp("-----Finish Solving Problem II-----")
pause

% -----Problem III-----
% TODO solve problem III
disp("-----Finish Solving Problem III-----")
pause

clear;
close all;


