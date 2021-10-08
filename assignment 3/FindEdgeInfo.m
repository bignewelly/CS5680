% Jonathon Pearson
% Assignment 3

function[edges, edgeHist]= FindEdgeInfo(im, bin)
    filteredImGx = imfilter(double(im), [-1 -2 -1; 0 0 0; 1 2 1]);
    filteredImGy = imfilter(double(im), [-1 0 1; -2 0 2; -1 0 1]);

    arctanIm = atan(double(filteredImGx./filteredImGy));
    magIm = uint8(normalize(abs(filteredImGx) + abs(filteredImGy)) .* 255);
    
    minArctIm = min(arctanIm, [], 'all');
    binSize = (max(arctanIm, [], 'all') - minArctIm)/(bin - 1);
    
    edgeHist = zeros(1, bin);
    for i = 1 : numel(arctanIm)
        binID = uint16((arctanIm(i) - minArctIm)/binSize) + 1;
        if binID > numel(edgeHist)
            disp(binID);
            throw(MException('myComponent:error','Mask must be symmetrical around the center.'));
        end
        edgeHist(binID) = edgeHist(binID) + 1;
    end
    
    disp(edgeHist);
    
    hiMag = find(magIm > 200);
    
    edges = zeros(size(magIm));
    edges(hiMag) = magIm(hiMag);
end
