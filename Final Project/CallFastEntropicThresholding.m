% Jonathon Pearson
% Final Project

function [threshold] = CallFastEntropicThresholding(Im)
    % We're going to start by finding our minimum possible threshold
    threshold = min(Im,[],'all');
    
    % Not lets get the all the values
    f = numel(find(Im == threshold));
    % Find the probabilty that these are edge pixels
    pe = f/numel(find(Im > threshold));
    
    
    % Get our initial entropy
    hn = 0;
    he = - pe*log(pe); 
    
    for i=threshold +1:max(Im,[],'all')
        f = numel(find(Im == i));
        if f
            pe = f/numel(find(Im > threshold));
            he = he - pe*log(pe);
        end        
    end
    
    % Calculate our entropy for each threshold
    hT = hn + he;
    p0p = numel(find(Im == threshold + 1));
    p1p = numel(find(Im > threshold));
    for t=threshold:max(Im,[],'all') - 2
        ftp = numel(find(int16(Im) == t + 1));
        p0 = p0p;
        p1 = p1p;
        p0p = p0p + ftp;
        p1p = p1p - ftp;

        temp = p0/p0p*hn-ftp/p0p*log(ftp/p0p)-p0/p0p*log(p0/p0p); 
        hn = temp;

        temp = p1/p1p*he+ftp/p1p*log(ftp/p1p)-p1/p1p*log(p1/p1p);
        he = temp;

        ht = hn + he;

        % If the entropy is greater for this threshold, let's use it.
        if ht > hT
            hT = ht;
            threshold = t;
        end

    end
end
