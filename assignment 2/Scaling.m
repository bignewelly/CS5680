% Jonathon Pearson
% Assignment 2

function [scaledIm, transFunc] = Scaling(inputIm, range)
    %TODO: Scale image
    if ~isinteger(range)
        throw(MException('myComponent:inputError', 'Range values should be integers.'));
    end
    
    if ~(range >= 0)
        throw(MException('myComponent:inputError','Range values should be positive.'));
    end
    
    if range(1) > range(2)
        throw(MException('myComponent:inputError','Second range value should be greater than first.'));
    end
    
    oriMinIntensity = inputIm(2);
    oriMaxIntensity = inputIm(3);
    
    slope = double(range(2) - range(1))/double(oriMaxIntensity - oriMinIntensity);
    
    transFunc = zeros(oriMaxIntensity - oriMinIntensity + 1);
    
    for (i = oriMinIntensity: oriMaxIntensity)
    end
   
    
    y = original * slope + oriMinIntensity
    scaledIm = inputIm;
    transFunc =  range;
end