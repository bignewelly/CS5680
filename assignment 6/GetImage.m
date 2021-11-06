% Jonathon Pearson
% Assignment 6

function [image] = GetImage(imageId)
    if imageId == 1
        image = imread('Elephant1.jpg');
    end
    
    if imageId == 2
        image = imread('Elephant2.jpg');
    end
    
    if imageId == 3
        image = imread('Horse1.jpg');
    end
    
    if imageId == 4
        image = imread('Horse2.jpg');
    end
end

