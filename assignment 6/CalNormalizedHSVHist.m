% Jonathon Pearson
% Assignment 6

function [hist] = CalNormalizedHSVHist (im, hBinNum, sBinNum, vBinNum)
    H = im(:, :, 1);
    S = im(:, :, 2);
    V = im(:, :, 3);
        
    bins = hBinNum * sBinNum * vBinNum;
    hist = zeros(1, bins);
    for i = 1 : numel(H)
        hBin = uint8(H(i)*(hBinNum - 1));
        sBin = uint8(S(i)*(sBinNum - 1));
        vBin = uint8(V(i)*(vBinNum - 1));
        
        bin = hBin * sBinNum * vBinNum + sBin * vBinNum + vBin + 1;
        
        hist(bin) = hist(bin) + 1;
    end
end
