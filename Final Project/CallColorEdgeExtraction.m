
% Jonathon Pearson
% Final Project

function [edges] = CallColorEdgeExtraction(yuvIm)
    % filter templates
    avgFilt = [1 2 1; 2 4 2; 1 2 1]/16;
    % Call edge extraction on each of the color channels
    % We will call an averaging filter on the U and V channels because the
    % because the thresholding is picking up too much noise in these
    % channels.  In many cases these channels have half the resolution than
    % the Y channel.  This low-pass is similar to that.
    edges = CallEdgeExtraction(yuvIm(:, :, 1)) | CallEdgeExtraction(imfilter(yuvIm(:, :, 2), avgFilt)) | CallEdgeExtraction(imfilter(yuvIm(:, :, 3),avgFilt));
end
