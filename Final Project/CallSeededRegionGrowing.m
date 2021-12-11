% Jonathon Pearson
% Final Project

function [regions, colors] = CallSeededRegionGrowing(Im, Seeds)
    figure();
    % Let's create a table that we can use for processing the regions and
    % their borders
    [m, n] = size(Seeds);    
    %  Get the max amount of regions we will be using
    regionsAndBorders = double(bwlabel(Seeds)); 
    regionCount = max(regionsAndBorders, [], 'all');
    colors = zeros(regionCount, 3);
        
    % We have our seeds, now let's start growing our regions
    zeroPix = -1;
    while not(zeroPix - numel(find(regionsAndBorders == 0)) == 0)
        zeroPix = numel(find(regionsAndBorders == 0));
        P = [];
        %Grow each of the regions.
        borders = imdilate(regionsAndBorders, strel('square', 3));
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
        
        regionsAndBorders = regionsAndBorders + borders;
        
%         for r=1:regionCount
%             % Set binary image back to zero
%             binReg(:, :) = 0;
%             
%             % Get the current region pixels
%             binReg(regionsAndBorders == r) = 1;
%             
%             % get the pixel average for the region
%             avg = GetRegionAverage(Im, binReg);
%             
%             % Dilate the region and find the new pixels
%             [newPixelsX, newPixelsY] = find(imdilate(binReg, strel('square', 3)) - binReg);
%             
%             % Get the pixel distance for each
%             for i=1:numel(newPixelsX)
%                 p = Im(newPixelsX(i), newPixelsY(i), :);
% 
%                 P = [P; newPixelsX(i), newPixelsY(i), r, sqrt((p(1) - avg(1))^2 + (p(2) - avg(2))^2 + (p(3) - avg(3))^2)];
% 
%             end
%         end
%             %2: Sort the newpixels by distance from the average color value from
%             %the region that grew them
%             minD = find(P(:, 4) == min(P(:, 4), [], 'all'));
%             X = P(:, 1);
%             Y = P(:, 2);
%             R = P(:, 3);
%                         
%             for i=1:numel(minD)
%                 regionsAndBorders(X(minD(i)), Y(minD(i))) = R(minD(i));
%             end
                 
            imshow(uint16(regionsAndBorders), []);

            %3: Add the pixels that have the minimum distance
            
    end
    
    regions = regionsAndBorders;
end
