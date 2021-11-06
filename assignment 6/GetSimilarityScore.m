% Jonathon Pearson
% Assignment 6

function [score] = GetSimilarityScore(H, G)
    % get the magnitude of each histogram
    magH = sum(H, 'all');
    magG = sum(G, 'all');

    score = sum(min(H.*magH, G.*magG)/min(magH, magG), 'all');
end
