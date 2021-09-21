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
    
    oriMaxIntensity = 0;
    oriMinIntensity = 255;

    % Get min and max
    for i = 1:numel(inputIm)
        if oriMaxIntensity < inputIm(i)
            oriMaxIntensity = inputIm(i);
        end

        if oriMinIntensity > inputIm(i)
            oriMinIntensity = inputIm(i);
        end
    end

    slope = double(range(2) - range(1))/double(oriMaxIntensity - oriMinIntensity);
    
    b = double(range(1)) - slope * double(oriMinIntensity);

    transFunc = int16(zeros(1, oriMaxIntensity - oriMinIntensity + 1));
       
    for i = oriMinIntensity: oriMaxIntensity
        transFunc(i - oriMinIntensity + 1) = int16(double(i) * slope + b);
    end
   
    scaledIm = inputIm;
    
    for i = 1:numel(scaledIm)
        scaledIm(i) = transFunc(inputIm(i) - oriMinIntensity + 1);
    end
end
