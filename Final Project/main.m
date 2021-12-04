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
yuvAkiyoIm = rgb2ycbcr(akiyoIm);
yuvForemanIm = rgb2ycbcr(foremanIm);


% display images
figure();

%display yuvAkiyoIm
subplot(1,2,1);
imshow(yuvAkiyoIm, []);
title('Luminance of Akiyo');

%display yuvForemanIm
subplot(1,2,2);
imshow(yuvForemanIm, []);
title('Luminance Value of Foreman');


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




disp("-----Finished Running-----")
pause;

%clean up
clear;
close all;



