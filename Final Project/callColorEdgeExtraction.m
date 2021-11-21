% Jonathon Pearson
% Final Project

function [edges] = CallColorEdgeExtraction(yuvIm, Ty, Tu, Tv)
    % filter templates
    edges = CallEdgeExtraction(yuvIm(:, :, 1), Ty) | CallEdgeExtraction(yuvIm(:, :, 2), Tu) | CallEdgeExtraction(yuvIm(:, :, 3), Tv);
end
