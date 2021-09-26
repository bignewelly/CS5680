% Jonathon Pearson
% Assignment 2

function[enhancedIm]= BBHE(inputIm)
    % Get the mean intensity value
    meanIntensityVal = mean(inputIm, 'all');
    meanInt = uint8(meanIntensityVal);
    
    % split image by mean value
    lower = inputIm(find(inputIm <= meanInt));
    upper = inputIm(find(inputIm > meanInt));
    
    % get the upper and lower histograms
    histL = CalHist(lower, false);
    totalL = sum(histL, 'all');
    histL = histL(1:meanInt)/totalL;
    histU = CalHist(upper, false);
    totalU = sum(histU, 'all');
    histU = histU(double(meanInt+1):end)/totalU;
    
    % get the cumalative histograms of the upper and lower
    for i = 2:numel(histL)
        histL(i) = histL(i-1) + histL(i);
    end

    for i = 2:numel(histU)
        histU(i) = histU(i-1) + histU(i);
    end

    % Get the enhanced image
    enhancedIm = inputIm;
    minVal = min(inputIm, [], 'all');
    %maxVal = max(inputIm, [], 'all');
    %minVal = 0;
    maxVal = 255;
    % assign the values that correspond to the orriginal pixels
    for i = 1:numel(enhancedIm)
        val = inputIm(i);
        if val <= meanInt
            enhancedIm(i) = minVal + (meanInt - minVal) * histL(val);
        else
            enhancedIm(i) = meanInt + 1 + double(maxVal - (meanInt + 1))*histU(val - meanInt);
        end
    end
    
    
end