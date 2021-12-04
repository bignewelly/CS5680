% Jonathon Pearson
% Final Project

function [edges] = CallEdgeExtraction(Im)

    % filter templates
    HOE = imfilter(double(Im), [1 2 1; 0 0 0; -1 -2 -1], 'symmetric');
    VOE = imfilter(double(Im), [1 0 -1; 2 0 -2; 1 0 -1], 'symmetric');
    NOE = imfilter(double(Im), [2 1 0; 1 0 -1; 0 -1 -2], 'symmetric');
    SOE = imfilter(double(Im), [0 1 2; -1 0 1; -2 -1 0], 'symmetric');
    
    MOE = max(abs(HOE), abs(VOE));
    MOE = max(MOE, abs(NOE));
    MOE = max(MOE, abs(SOE));
    
    % Get the threshold
    T = CallFastEntropicThresholding(MOE);
    %T2 = CallEntropicThresholding(MOE);
    
    %if not(T == T2)
    %    disp([string(T) '!=' string(T2)]);
    %end
    
    edges = zeros(size(MOE));
    
    edges(MOE >= T) = 1;
    
    edges = logical(edges);
    
        % display images
    figure();

    %display MOE
    subplot(1,2,1);
    imshow(MOE, []);
    title('MOE');

    %display edges
    subplot(1,2,2);
    imshow(edges, []);
    title(T);
end
