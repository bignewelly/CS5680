% Jonathon Pearson
% Assignment 2

function [histogram] = CalHist(inputIm, normalized)
    histogram = zeros(1, 255 + 1);
    for i = 1 : numel(inputIm)
        histogram(inputIm(i) + 1) = histogram(inputIm(i) + 1) + 1;
    end
    
    if normalized
        histogram = histogram/double(numel(inputIm));
    end
end