% Jonathon Pearson
% Assignment 6

function [orderedIds] = QueryImageDatabase(imHist, dbHist)
    [S, M, N, C] = size(dbHist);
    results = zeros(1, S);
    % compare histogram to all the image histograms
    for i=1:size(dbHist)
        results(i) = GetSimilarityScore(imHist, dbHist(i, :));
    end
    
    orderedIds = zeros(2, S);
    % Get the sorted ids for the images
    for i = 1:S
        current = max(results, [], 'all');
        best = find(results == current);
        orderedIds(i, 1) = best(1);
        orderedIds(i, 2) = current;
        results(best) = 0;
    end
end
