% Jonathon Pearson
% Assignment 5

function [labelIm, num] = FindComponentLabels(im, se)
    labelIm = uint8(zeros(size(im)));
    num = 0;
    % loop through pixels and find the ones that aren't part of a current 
    % connected componant
    for p = 1:numel(im)
        if im(p) && ~labelIm(p)
            num = num + 1; 
            k = logical(zeros(size(im)));
            kMinus1 = k;
            k(p) = true; 
            
            % perform extraction of connected components
            while any(k ~= kMinus1, 'all')
                kMinus1 = k;
                
                k = imdilate(kMinus1, se) & im;
            end
            
            % Get ids of all the pixels in this connected object.
            cOIds = find(k == 1);
            
            % set the values of of all pixels in the connected object to
            % the label
            labelIm(cOIds) = num;
        end
    end
end