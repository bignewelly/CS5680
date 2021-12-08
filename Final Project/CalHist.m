% Jonathon Pearson
% Assignment 5

function [histogram] = CalHist(inputIm, normalized)
    maxVal = max(inputIm, [], 'all');
    histogram = zeros(1, int16(maxVal) + 1);
    for i = 1 : numel(inputIm)
        histogram(int16(inputIm(i)) + 1) = histogram(int16(inputIm(i)) + 1) + 1;
    end
    
    if normalized
        histogram = histogram/double(numel(inputIm));
    end
end