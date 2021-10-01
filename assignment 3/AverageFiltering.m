% Jonathon Pearson
% Assignment 3

function[filteredIm]= AverageFiltering(im, mask)
  
    if mask < 0
        throw(MException('myComponent:inputError', 'All mask values should be positive.'));
    end
    
    if ~(abs(1 - sum(mask, 'all')) < 0.0001)
        throw(MException('myComponent:inputError','Mask values should add up to 1.'));
    end
    
    [m, n] = size(mask);
    for i = 1:m
        for j = 1:(n-i+1)
            if ~(mask(i,j) == mask(j,i))
                throw(MException('myComponent:inputError','Mask must be symmetrical around the center.'));
            end
        end
    end
  
    
    %TODO: implement filtering function
    
    filteredIm = im;
end