% Jonathon Pearson
% Assignment 6

function [orderedIds] = QueryImageDatabase(imHist, dbHist)
    [S, M, N, C] = size(dbHist);
    results = zeros(1, S);
    % compare histogram to all the image histograms
    for i=1:size(dbHist)
        results(i) = GetSimilarityScore(imHist, dbHist(i, :));
    end
    
    orderedIds = uint8(zeros(1, S));
    % Get the sorted ids for the images
    for i = 1:S
        best = find(results == max(results, [], 'all'));
        orderedIds(i) = best(1);
        results(best) = 0;
    end
end
