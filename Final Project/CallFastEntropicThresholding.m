% Jonathon Pearson
% Final Project

function [threshold] = CallFastEntropicThresholding(Im)
    threshold = min(Im,[],'all');
    f = numel(find(Im == threshold));        
    pn = f/numel(find(Im <= threshold));
    pe = f/numel(find(Im > threshold));

    hn = - pn*log(pn);
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
        
        hn = p0/p0p*hn-ft/p0p*log(ft/p0p)-p0/p0p*log(p0/p0p);
        he = p1/p1p*he-ft/p1p*log(ft/p1p)-p1/p1p*log(p1/p1p);
        
        ht = hn + he;

        if ht > hT
            hT = ht;
            threshold = t;
        end
    end
end
