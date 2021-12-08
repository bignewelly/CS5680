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
    
    disp('min threshold:');
    disp(threshold);
    
    disp('max threshold:');
    disp(max(Im,[],'all'));
    
    % Calculate our entropy for each threshold
    hT = hn + he;
    p0p = numel(find(Im == threshold + 1));
    p1p = numel(find(Im >= threshold + 1));
    for t=threshold:max(Im,[],'all') - 2
        ftp = numel(find(Im == t + 1));
        if ftp
            p0 = p0p;
            p1 = p1p;
            p0p = numel(find(Im <= t));
            p1p = numel(find(Im >= t + 1));
 
            hn = (p0/p0p)*hn-((ftp/p0p)*log(ftp/p0p))-((p0/p0p)*log(p0/p0p)); 

            he = (p1/p1p)*he+((ftp/p1p)*log(ftp/p1p))-((p1/p1p)*log(p1/p1p));

            ht = hn + he;

            if not(isnan(ht))
            % If the entropy is greater for this threshold, let's use it.
                if ht > hT
                    hT = ht;
                    threshold = t;
                end
            end

        end
    end
end
