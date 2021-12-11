% Jonathon Pearson
% Final Project

function [avg] = GetRegionAverage(Im, Region)
    R = Im(:, :, 1);
    R(Region == 0) = 0;
    G = Im(:, :, 2);
    G(Region == 0) = 0;
    B = Im(:, :, 3);
    B(Region == 0) = 0;
    
    totalP = sum(Region, 'all');
    
    avg = [sum(R, 'all'), sum(G, 'all'), sum(B, 'all')]/totalP;
end
