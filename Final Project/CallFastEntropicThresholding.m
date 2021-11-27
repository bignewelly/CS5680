% Jonathon Pearson
% Final Project

function [threshold] = CallFastEntropicThresholding(Im)
    
    threshold = 0;
    hT = 0;
    for t=min(Im,[],'all'):max(Im,[],'all')
        nonEdge = numel(find(Im <= t));
        edge = numel(find(Im > t));
        hnT = 0;
        heT = 0;
        for i=0:t
            fi = numel(find(Im == i));
            pn = fi/nonEdge;
            pe = fi/edge;
            
            hnT = hnT - pn*log(pn);
            heT = heT - pe*log(pe);            
        end
        ht = hnT + heT;

        if ht > hT
            hT = ht;
            threshold = t;
        end
    end
end
