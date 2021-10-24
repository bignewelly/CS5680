% Jonathon Pearson
% Assignment 4

function [blurredIm]=  BlurImage(oriIm,  blocksize)
    [row, col, depth] = size(oriIm);
    blurredIm = oriIm;

    adjblocksize  = blocksize - 1;
    totalEl = blocksize^2;
    if (depth == 1)
        % gray sclae image
        for r = 1: blocksize : row
            for c = 1: blocksize : col
                total = double(0);
                
                for i = r: r + adjblocksize
                    for j = c: c + adjblocksize
                        total = total + double(oriIm(i, j));
                    end
                end
                
                blurredIm(r: r + adjblocksize, c: c + adjblocksize) = fix(total/totalEl);
            end
        end        
    elseif (depth == 3)
        % color image
        for r = 1: blocksize : row
            for c = 1: blocksize : col
                total = zeros(1,3,'double');
                
                for i = r: r + adjblocksize
                    for j = c: c + adjblocksize
                        for k = 1 : depth
                            total(k) = total(k) + double(oriIm(i, j, k));
                        end
                    end
                end
                for i = 1 : depth
                    blurredIm(r: r + adjblocksize, c: c + adjblocksize, i) = total(i)./totalEl;
                end
            end
        end        
    else
        disp('Error: unrecognized image type');
    end
    end