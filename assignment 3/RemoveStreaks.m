% Jonathon Pearson
% Assignment 3

function[enhancedIm, hPFilteredIm, scaledFilteredImGx, scaledFilteredImGy]= RemoveStreaks(im)

    filteredImGx = imfilter(double(im), [-1; 0; 1]);
    filteredImGy = imfilter(double(im), [-1 0 1]);


    %TODO:  I need to do a filter based on the high pass filter.  I want to
    %keep only the drastic changes.  If anything is too gradual, replace
    %it.
    %I also want to use gy and gx so I have direction.  Then I can step
    %through and and add and take away values one row and column at a time.
    strongFilter = double([1 1 1; 1 -8 1; 1 1 1]);

    hPFilteredIm = imfilter(double(im), strongFilter);
       
    scaledFilteredImGx =uint8(double(filteredImGx - min(filteredImGx, [], 'all'))./double(max(filteredImGx, [], 'all') - min(filteredImGx, [], 'all')).*255);
    scaledFilteredImGy =uint8(double(filteredImGy - min(filteredImGy, [], 'all'))./double(max(filteredImGy, [], 'all') - min(filteredImGy, [], 'all')).*255);

    midRangeVals = find((im > 75 & im < 240) & (abs(filteredImGx) < 150 | abs(filteredImGy) < 150));

    enhancedIm = im;
    enhancedIm(midRangeVals) = 250;
end

