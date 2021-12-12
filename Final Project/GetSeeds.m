% Jonathon Pearson
% Final Project

function [seeds] = GetSeeds(Im, LabeledEdges, DT, CT)
    
    % get the centroids for all the regions
    centrds = zeros(max(LabeledEdges, [], 'all'), 2);
    for i=1:max(LabeledEdges, [], 'all')
        [x y] = find(LabeledEdges == i);
        avgx = sum(x, 'all')/numel(x);
        avgy = sum(y, 'all')/numel(y);
        
        centrds(i, :) = [avgx avgy];
    end 
    
    centrds = int16(centrds);
    
    % Get the distance of each centroid from all the others
    w = pdist(centrds);
      
    % Put it into a squareform to make it easer to get the weights
    weights = squareform(w);
    
    % We are going to get the values we need to turn each centroid into a
    % node in a graph with waited edges.  That way we can generate a
    % Minimum Spanning Tree
    s = uint16(zeros(numel(w), 1));
    t = uint16(zeros(numel(w), 1));
    
    [M N] = size(weights);
    
    % Get the nodes and edges for the graph
    i = 1;
    for m = 1 : M
        for n = m + 1 : N
            s(i) = m;
            t(i) = n;
            w(i) = weights(m, n);
            i = i + 1;
        end
    end
    
    % Create the graph
    G = graph(s, t, w);
    
    % Create the minimum spanning tree based on the weighted graph
    mst = minspantree(G,'Method','sparse');
    
    disp(mst);
    
    % Get the Seeds
    seeds = zeros(size(LabeledEdges));
    
    for e = 1 : size(mst.Edges, 1)
        % Get the average of the centroids between two adjacent regions
        cntrd1 = centrds(mst.Edges(e, 1).(1)(1), :);
        cntrd2 = centrds(mst.Edges(e, 1).(1)(2), :);
        
        cntrd = (cntrd1 + cntrd2)/2;
        % If two regions are close to eachother in the matrix and close in color, combine the seeds
        [X, Y] = find(seeds(max(1,cntrd(1) - DT) : min(cntrd(1) + DT, end), max(1, cntrd(2) - DT) : min(cntrd(2) + DT, end)));
        
        % check the colorspace difference.  If it's withing the threshold
        % DC average the centroids.
        total = 1;
        p = double(Im(cntrd(1), cntrd(2), :));
        for i = 1 : numel(X)
            % Get the pixel from the original image
            p2 = double(Im(X(i), Y(i), :));
            if sqrt((p(1) - p2(1))^2 + (p(2) - p2(2))^2 + (p(3) - p2(3))^2) >= CT
                % remove the old seed
                seeds(X(i), Y(i)) = 0;
                % add the old x and y value to the new seed location
                cntrd = [(X(i) + cntrd(1)) (Y(i) + cntrd(2))];
                % increment our total to help us calculate the average
                total = total + 1;
            end
        end
        cntrd = uint16(cntrd/total);
        
        % mark the new seed
        seeds(cntrd(1), cntrd(2)) = 1;
    end 
end
