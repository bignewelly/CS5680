% Jonathon Pearson
% Final Project

function [edges] = CallEdgeExtraction(Im, T)
    % filter templates
    HOE = imfilter(Im, [1 2 1; 0 0 0; -1 -2 -1]);
    VOE = imfilter(Im, [1 0 -1; 2 0 -2; 1 0 -1]);
    NOE = imfilter(Im, [2 1 0; 1 0 -1; 0 -1 -2]);
    SOE = imfilter(Im, [0 1 2; -1 0 1; -2 -1 0]);
    
    MOE = max(abs(HOE), abs(VOE));
    MOE = max(MOE, abs(NOE));
    MOE = max(MOE, abs(SOE));
    
    edgeIds = find(MOE >= T);
   
    edges = zeros(size(MOE));
    
    edges(edgeIds) = 1;
    
    edges = logical(edges);
end
