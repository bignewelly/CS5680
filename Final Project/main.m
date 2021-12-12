% Jonathon Pearson
% Final Project


% Let's get our images


akiyoIm = imread('Resources/Akiyo.jpg');
foremanIm = imread('Resources/Foreman.jpg');

% display images
figure();

%display akiyoIm
subplot(1,2,1);
imshow(akiyoIm);
title('Akiyo');

%display foremanIm
subplot(1,2,2);
imshow(foremanIm);
title('Foreman');


% Convert to YUV
yuvAkiyoIm = RGBToYUV(akiyoIm);
yuvForemanIm = RGBToYUV(foremanIm);

% get edges
akiyoImEdges = CallColorEdgeExtraction(yuvAkiyoIm);
foremanImEdges = CallColorEdgeExtraction(yuvForemanIm);

% display images
figure();

%display akiyoImEdges
subplot(1,2,1);
imshow(akiyoImEdges, []);
title('Edges of Akiyo');

%display foremanImEdges
subplot(1,2,2);
imshow(foremanImEdges, []);
title('Edges of Foreman');


% Get the connected edges
akiyoImConnectedEdges = bwlabel(akiyoImEdges, 8);
foremanImConnectedEdges = bwlabel(foremanImEdges, 8);

% display images
figure();

%display akiyoImConnectedEdges
subplot(1,2,1);
imshow(akiyoImConnectedEdges, []);
title('Connected Edges of Akiyo');

%display foremanImConnectedEdges
subplot(1,2,2);
imshow(foremanImConnectedEdges, []);
title('Connected Edges of Foreman');

akiyoImSeeds = GetSeeds(yuvAkiyoIm, akiyoImConnectedEdges, 10, 3);
foremanImSeeds = GetSeeds(yuvForemanIm, foremanImConnectedEdges, 10, 3);

% display seeds
figure();

%display akiyoImSeeds
subplot(1,2,1);
imshow(akiyoImSeeds, []);
title('Seeds of Akiyo');

%display foremanImSeeds
subplot(1,2,2);
imshow(foremanImSeeds, []);
title('Seeds of Foreman');

[akiyoImRegions, akiyoImRegionsInfo] = CallSeededRegionGrowing(yuvAkiyoIm, akiyoImSeeds);
[foremanImRegions, foremanImRegionsInfo] = CallSeededRegionGrowing(yuvForemanIm, foremanImSeeds);

% display seeds
figure();

%display akiyoImRegions
subplot(1,2,1);
imshow(akiyoImRegions, []);
title('Akiyo Regions');

%display foremanImRegions
subplot(1,2,2);
imshow(foremanImRegions, []);
title('Foreman Regions');

disp("-----Finished Running-----")
pause;

%clean up
clear;
close all;



