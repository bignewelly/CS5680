% Jonathon Pearson
% Final Project

function [threshold] = CallEntropicThresholding(Im)
    
    threshold = 0;
    hT = 0;
    for t=min(Im,[],'all'):max(Im,[],'all')
        nonEdge = numel(find(Im <= t));
        edge = numel(find(Im > t));
            hnT = 0;
            heT = 0;
            for i=0:t
                fi = numel(find(Im == i));
                if fi
                    pn = fi/nonEdge;
                    pe = fi/edge;

                    temp = pn*log(pn);
                    if not(isnan(temp))
                        hnT = hnT - temp;
                    end
                    
                    temp = pe*log(pe);
                    if not(isnan(temp))
                        heT = heT - temp;
                    end
                                
                end
            end
            ht = hnT + heT;
            
            if isnan(ht)
                disp('something is wrong');
            end

            if ht > hT
                hT = ht;
                threshold = t;
            end
    end
end