% Jonathon Pearson
% Final Project

function [seeds] = GetSeeds(LabeledEdges)
    
    seeds = zeros(max(LabeledEdges, [], 'all'));
    for i=1:max(LabeledEdges, [], 'all')
        [x y] = find(LabeledEdges == i);
        avgx = sum(x, 'all')/numel(x);
        avgy = sum(y, 'all')/numel(y);
        
        seeds(i) = {x, y};
    end 
end
