% Jonathon Pearson
% Assignment 3

function[enhancedIm, hPFilteredIm, scaledFilteredIm, scaledFilteredHiLoIm]= RemoveStreaks(im)

    %TODO:  I need to do a filter based on the high pass filter.  I want to
    %keep only the drastic changes.  If anything is too gradual, replace
    %it.
    %I also want to use gy and gx so I have direction.  Then I can step
    %through and and add and take away values one row and column at a time.
    strongFilter = double([1 1 1; 1 -8 1; 1 1 1]);

    hPFilteredIm = imfilter(double(im), strongFilter);

    hPFilteredHighLow = zeros(size(hPFilteredIm));
   
    highLowValues = find(abs(hPFilteredIm) > 255 | im > 250 | im < 100);
    
    hPFilteredHighLow(highLowValues) = hPFilteredIm(highLowValues);

    scaledFilteredIm =uint8(double(hPFilteredIm - min(hPFilteredIm, [], 'all'))./double(max(hPFilteredIm, [], 'all') - min(hPFilteredIm, [], 'all')).*255);
    scaledFilteredHiLoIm =uint8(double(hPFilteredHighLow - min(hPFilteredHighLow, [], 'all'))./double(max(hPFilteredHighLow, [], 'all') - min(hPFilteredHighLow, [], 'all')).*255);

    
    enhancedIm = uint8(ones(size(im)))*max(im, [], 'all');
    enhancedIm(highLowValues) = im(highLowValues);
end

