% Jonathon Pearson
% Assignment 3

function [filteredIm] = MedianFiltering(im, mask)     
    [m, n] = size(mask);
    
    if ~(m == n)
        throw(MException('myComponent:inputError', 'Mask should be square.'));
    end
  
    if (mod(m,2) == 0)
        throw(MException('myComponent:inputError', 'Mask dimsension should be odd.'));
    end
    
    if mask < 0
        throw(MException('myComponent:inputError', 'All mask values should be positive.'));
    end  
    
    [padN, padM] = size(mask);
    padN = floor(padN/2);
    padM = floor(padM/2);
    [imN, imM] = size(im);
    paddedIm = zeros(imN + padN*2, imM + padM*2);
    
    paddedIm(padN + 1:padN+imN, padM + 1:padM+imM) = im;
    
    imSize = size(im);
    
    filteredIm = im;
    
    maskTotal = sum(mask, 'all');
    valueList = zeros(1, maskTotal);
    
    for i = padM + 1: padM + imSize(1)
        for j = padN + 1: padN + imSize(2)
            index = 1;
            for mI = -padM:padM
                for nI = -padN:padN
                    val = paddedIm(i + mI, j + nI);
                    for v = 1:mask(mI + padM + 1, nI + padN + 1)
                        valueList(index) = val;
                        index = index + 1;
                    end
                end
            end
            
            filteredIm(i - padN, j - padM) = median(valueList, 'all');
        end
    end
    
end