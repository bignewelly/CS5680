
% Jonathon Pearson
% Final Project

function [edges] = CallColorEdgeExtraction(yuvIm)
    avgFilt = [1 2 1; 2 4 2; 1 2 1]/16;
    % filter templates
    edges = CallEdgeExtraction(yuvIm(:, :, 1)) | CallEdgeExtraction(imfilter(yuvIm(:, :, 2), avgFilt)) | CallEdgeExtraction(imfilter(yuvIm(:, :, 3),avgFilt));
end
