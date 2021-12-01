% Jonathon Pearson
% Final Project

function [threshold] = CallFastEntropicThresholding(Im)
    % We're going to start by finding our minimum possible threshold
    threshold = min(Im,[],'all');
    % Not lets get the all the values
    f = numel(find(Im == threshold));
    % Find the probabilty that these are edge pixels
    pe = f/numel(find(Im > threshold));
    
    hn = 0;
    he = - pe*log(pe); 
    
    for i=threshold +1:max(Im,[],'all')
        f = numel(find(Im == i));
        if f
            pe = f/numel(find(Im > threshold));
            he = he - pe*log(pe);
        end        
    end
    
    hT = hn + he;
    for t=threshold + 1:max(Im,[],'all')
        p0 = numel(find(Im <= t - 1));
        p1 = numel(find(Im > t - 1));
        p0p = numel(find(Im <= t));
        p1p = numel(find(Im > t));
        ft = numel(find(Im == t));
        
        if p0p && p0
            hn = p0/p0p*hn-ft/p0p*log(ft/p0p)-p0/p0p*log(p0/p0p);
        end
        
        if p1p && p1
            he = p1/p1p*he+ft/p1p*log(ft/p1p)-p1/p1p*log(p1/p1p);
        end
        
        ht = hn + he;

        if ht > hT
            hT = ht;
            threshold = ht;
        end
    end
end
