% Jonathon Pearson
% Assignment 2

function[enhancedIm, transFunc]= HistEqualization(inputIm)
    hist = CalHist(inputIm, true);
    
    cNH = zeros(size(hist));
    
    cNH(1) = hist(1);
    
    for i = 2:numel(cNH)
        cNH(i) = cNH(i -1) + hist(i);
    end

    enhancedIm = inputIm;
    for i = 1:numel(enhancedIm)
        enhancedIm(i) = 255 * cNH(inputIm(i) + 1);
    end
    
    transFunc = cNH;
end