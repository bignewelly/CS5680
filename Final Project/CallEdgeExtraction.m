% Jonathon Pearson
% Final Project

function [edges] = CallEdgeExtraction(Im)
    % filter templates
    HOE = imfilter(double(Im), [1 2 1; 0 0 0; -1 -2 -1]);
    VOE = imfilter(double(Im), [1 0 -1; 2 0 -2; 1 0 -1]);
    NOE = imfilter(double(Im), [2 1 0; 1 0 -1; 0 -1 -2]);
    SOE = imfilter(double(Im), [0 1 2; -1 0 1; -2 -1 0]);
    
    MOE = max(abs(HOE), abs(VOE));
    MOE = max(MOE, abs(NOE));
    MOE = max(MOE, abs(SOE));
    
    % Get the threshold
    T = CallFastEntropicThresholding(MOE);
    
    edges = zeros(size(MOE));
    
    edges(MOE >= T) = 1;
    
    edges = logical(edges);
end
