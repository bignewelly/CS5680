% Jonathon Pearson
% Assignment 6

function DisplayResults(sortedIds)
    % display images
    figure();

    %display on the top left
    subplot(2,2,1);
    imshow(GetImage(sortedIds(1, 1)));
    title("1st Result:" + sortedIds(1, 2));

    %display on the top right
    subplot(2,2,2);
    imshow(GetImage(sortedIds(2, 1)));
    title("2nd Result:" + sortedIds(2, 2));

    %display on the bottom left
    subplot(2,2,3);
    imshow(GetImage(sortedIds(3, 1)));
    title("3rd Result:" + sortedIds(3, 2));

    %display on the bottom right
    subplot(2,2,4);
    imshow(GetImage(sortedIds(4, 1)));
    title("4th Result:" + sortedIds(4, 2));
end

