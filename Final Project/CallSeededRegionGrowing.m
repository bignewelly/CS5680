% Jonathon Pearson
% Final Project

function [regions, regionCount] = CallSeededRegionGrowing(Im, Seeds)
    figure();
    % Let's create a table that we can use for processing the regions and
    % their borders
    [m, n] = size(Seeds);    
    %  Get the max amount of regions we will be using
    regionsAndBorders = double(bwlabel(Seeds)); 
    regionCount = max(regionsAndBorders, [], 'all');
    
    % this is where we're going to store our region Id,  
    % indeces 1-3 are the color changes. It will store the average color
    % index 4 is the total pixel count
    regionInfo = zeros(regionCount, 4);
    for r =1:regionCount
        [x, y] = find(regionsAndBorders == r);
        col = Im(x, y, :);
        regionInfo(r, :) = [col(1) col(2) col(3) 1];
    end
        
    % We have our seeds, now let's start growing our regions
    zeroPix = -1;
    while not(zeroPix - numel(find(regionsAndBorders == 0)) == 0)
        zeroPix = numel(find(regionsAndBorders == 0));
        P = [];
        %Grow each of the regions.
        borders = imdilate(regionsAndBorders, strel('square', 3));
        if max(borders, [], 'all') > regionCount
            disp("Something's wrong");
        end
        borders(regionsAndBorders>0) = 0;
        
        % check each pixel to see if it borders with another regiion
        [brdrPX, brdrPY] = find(borders);
        count = numel(brdrPX);
        for i = 1:count
            for x = max(1, brdrPX(i) - 1): min(brdrPX(i) + 1, numel(regionsAndBorders(:, 1)))
                for y = max(1, brdrPY(i) - 1): min(brdrPY(i) + 1, numel(regionsAndBorders(1, :)))
                    % ignore the center pixel since we know it's not part
                    % of a region and ignore it if it's part of a border
                    if not(x == y) && not(regionsAndBorders(x, y) < 0)
                        % make sure that the current pixel isn't part of a
                        % region
                        if regionsAndBorders(brdrPX(i), brdrPY(i)) > 0 && not(regionsAndBorders(brdrPX(i), brdrPY(i)) == borders(x, y))
                            regionsAndBorders(x, y) = - borders(x, y);
                            borders(x, y) = 0;
                        end
                    end
                end
            end
        end
        
        brdPx = find(borders > 0);
        y = double(Im(:, :, 1));
        u = double(Im(:, :, 2));
        v = double(Im(:, :, 3));
        P = [brdPx, sqrt((y(brdPx) - regionInfo(borders(brdPx), 1)).^2 + (u(brdPx) - regionInfo(borders(brdPx), 2)).^2 + (v(brdPx) - regionInfo(borders(brdPx), 3)).^2)];
             
            
        %2: Find the smallest distance
        minD = find(P(:, 2) == min(P(:, 2), [], 'all'));

        %3: Add the pixels that have the minimum distance
        regionsAndBorders(P(minD)) = borders(P(minD));
        
        for r = 1 : numel(regionInfo(:, 1))
            [avg, total] = GetRegionAverage(Im, borders, r, [regionInfo(r, 1), regionInfo(r, 2), regionInfo(r, 3)], regionInfo(r, 4));
            regionInfo(r, 1) = avg(1);
            regionInfo(r, 2) = avg(2);
            regionInfo(r, 3) = avg(3);
            regionInfo(r, 4) = total;
        end
        imshow(uint16(regionsAndBorders), []);

    end
    
    regions = regionsAndBorders;
end
