% Jonathon Pearson
% Final Project

function [avg, total] = GetRegionAverage(Im, NewPixels, Region, CurrentAvg, CurrentTotal)
    colorSum = CurrentAvg .* CurrentTotal;
    
    

    R = Im(:, :, 1);
    R = R(NewPixels == Region);
    G = Im(:, :, 2);
    G = G(NewPixels == Region);
    B = Im(:, :, 3);
    B = B(NewPixels == Region);
    
    total = sum(NewPixels(NewPixels == Region), 'all');
    
    avg = [sum(R, 'all') + colorSum(1), sum(G, 'all') + colorSum(2), sum(B, 'all') + colorSum(3)]/total;
end
