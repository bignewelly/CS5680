% Jonathon Pearson
% Assignment 1


function [maxValue, minValue, meanValue, medianValue] = FindInfo(oriIm)
    sizeOri = numel(oriIm);

    maxValue = 0;
    minValue = 255;
    totalValue = double(0);

    % Get maxValue, minValue, and totalValue
    for i = 1:sizeOri
        if maxValue < oriIm(i)
            maxValue = oriIm(i);
        end
        
        if minValue > oriIm(i)
            minValue = oriIm(i);
        end
        
        totalValue = totalValue + double(oriIm(i));
    end
    
    % calculate meanValue
    meanValue = double(totalValue)/double(sizeOri);
    
    % sort oriIm    
    sortIm = MergeSort(oriIm);
        
%  I tried using a bubble sort, but it took far too long to run.  So I
%  switched to a merge sort.  It's loads faster.


%     % do bubble sort
%     switched = -1;
%     while switched ~= 0
%         switched = 0;
%         
%         for i = 2:sizeOri
%             if oriIm(i) < oriIm(i-1)
%                 %perform switch
%                 a = oriIm(i);
%                 oriIm(i) = oriIm(i-1);
%                 oriIm(i-1) = a;
%                 switched = switched + 1;
%             end
%         end
%         disp('switched:');
%         disp(switched);
%     end
        
    % Calculate median
    halfSize = sizeOri/2;
    
    if mod(sizeOri, 2) == 0
        medianValue = (double(sortIm(halfSize)) + double(sortIm(halfSize + 1)))/2;
    else
        medianValue = sortIm(halfSize + 1);
    end
    
end

function [sorted] = MergeSort(A)
    sizeA = numel(A); 
    % Check if we have more than one element. If we have just one, our list
    % is already sorted
    if sizeA > 1 
        half = fix(numel(A)/2);
        
        % Break our list in have and sort each half
        B = MergeSort(A(1:half));
        C = MergeSort(A(half + 1: numel(A)));
                
        % since A is the size of array I already need, I'll just use it.
        sorted = A;
        
        % get the element count of each array
        sizeB = numel(B);
        sizeC = numel(C);
        
        i = 1;
        b = 1;
        c = 1;
        while i <= sizeA
            
            % If we're still in B, get the current B value, otherwise we'll
            % just mark it as a -1
            if b <= sizeB
                bVal = B(b);
            else
                bVal = -1;
            end
            
            % If we're still in C, get the current C value, otherwise we'll
            % just mark it as a -1
            if c <= sizeC
                cVal = C(c);
            else
                cVal = -1;
            end
            
            % If we have already grabbed all of B, just fill the rest with
            % C and visa versa
            if bVal == -1
                sorted(i) = cVal;
                c = c + 1;
            elseif cVal == -1
                sorted(i) = bVal;
                b = b + 1;
            elseif bVal <= cVal
                % If current B value is less than or equal to cVal, use it
                sorted(i) = bVal;
                b = b + 1;
            else
                % If current C value is less than bVal, use it
                sorted(i) = cVal;
                c = c + 1;
            end
            i = i + 1;
        end
    else
        % set the return value to our sorted list
         sorted = A;
    end
end
    