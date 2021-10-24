% Jonathon Pearson
% Assignment 4

function[denoisedIm]= Denoise(im, topFrequencies)     
    % III - 1
    % get the centered fourier transform of the boy_noisy.gif image
    cfIm = fftshift(fft2(im));

    % III - 2
    % Find the locations of the 4 largest images
    magCfIm = abs(cfIm);
    
    %magCfIm(end/2:(end/2)+1, end/2:(end/2)+1) = 0;

    maxVals = zeros(1, topFrequencies + 1);
        
    for i = 1: numel(magCfIm)
        % check that this values isn't already in maxVals
        if ~ismember(magCfIm(i), maxVals)
            % Check this value against all max values
            for j=1:numel(maxVals)
                % if this value is greater than the current maxval,
                % replace it
                if magCfIm(i) > maxVals(j)
                    if j > 1
                        maxVals(j - 1) = maxVals(j);
                    end
                    maxVals(j) = magCfIm(i);
                else
                    break
                end
            end
        end
    end
            
    maxVals = maxVals(1, 1:end-1);
    
    %III - 3
    [row, col] = find(ismember(magCfIm, maxVals));
        
    for i = 1:numel(row)
        s = sum(cfIm(row(i) - 1: row(i) + 1, col(i) - 1: col(i) + 1), 'All')- cfIm(row(i), col(i));
        avg = s/8;

        cfIm(row(i), col(i)) = avg;
    end

    denoisedIm = uint8(real(ifft2(ifftshift(cfIm))));
end