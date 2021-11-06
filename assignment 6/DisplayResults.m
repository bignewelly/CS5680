% Jonathon Pearson
% Assignment 6

function DisplayResults(sortedIds)
    % display images
    figure();

    %display on the top left
    subplot(2,2,1);
    imshow(GetImage(sortedIds(1)));
    title('Rank 1 Result');

    %display on the top right
    subplot(2,2,2);
    imshow(GetImage(sortedIds(2)));
    title('Rank 2 Result');

    %display on the bottom left
    subplot(2,2,3);
    imshow(GetImage(sortedIds(3)));
    title('Rank 3 Result');

    %display on the bottom right
    subplot(2,2,4);
    imshow(GetImage(sortedIds(4)));
    title('Rank 4 Result');
end

