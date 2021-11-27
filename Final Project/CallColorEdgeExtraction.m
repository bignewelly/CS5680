% Jonathon Pearson
% Final Project

function [edges] = CallColorEdgeExtraction(yuvIm)
    % filter templates
    edges = CallEdgeExtraction(yuvIm(:, :, 1)) | CallEdgeExtraction(yuvIm(:, :, 2)) | CallEdgeExtraction(yuvIm(:, :, 3));
end
