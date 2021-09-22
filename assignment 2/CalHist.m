% Jonathon Pearson
% Assignment 2

function [histogram] = CalHist(inputIm, normalized)
    %TODO: calculate histogram
    histogram = zeros(1, 255 + 1);
    for i = 1 : numel(inputIm)
        histogram(inputIm(i) + 1) = histogram(inputIm(i) + 1) + 1;
    end
    
    if normalized
        histogram = histogram/double(max(histogram, [], 'all'));
    end
end