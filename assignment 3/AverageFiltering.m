% Jonathon Pearson
% Assignment 3

function[filteredIm]= AverageFiltering(im, mask)     
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
    
    if ~(abs(1 - sum(mask, 'all')) < 0.0001)
        throw(MException('myComponent:inputError','Mask values should add up to 1.'));
    end
    
    for i = 1:m
        for j = 1:(n-i+1)
            if ~(mask(i,j) == mask(j,i))
                throw(MException('myComponent:inputError','Mask must be symmetrical around the center.'));
            end
        end
    end
  
    
    [padN, padM] = size(mask);
    padN = floor(padN/2);
    padM = floor(padM/2);
    [imN, imM] = size(im);
    paddedIm = zeros(imN + padN*2, imM + padM*2);
    
    paddedIm(padN + 1:padN+imN, padM + 1:padM+imM) = im;
    
    [m, n] = size(im);
    
    filteredIm = im;
    
    for i = padM + 1: padM + m
        for j = padN + 1: padN + n
            subset = paddedIm(i - padM: i + padM, j - padN: j + padN);
            filteredIm(i - padN, j - padM) =uint8(sum(subset.* mask, 'all'));
        end
    end
    
end