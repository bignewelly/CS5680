% Jonathon Pearson
% Final Project

function [threshold] = CallFastEntropicThresholding(Im)

    
    % Get local average of pixels defined as G
    G = imfilter(Im, [0 .25 0; .25 0 .25; 0 .25 0], 'symmetric') + .25;
        
    fHist = CalHist(Im, false);    
    
    % We're going to start by finding our minimum possible threshold
    threshold = int16(0);
   
    % Now lets get the pixel cound
    f = fHist(threshold + 1);
    % Find the probabilty that these are edge pixels
    pe = f/sum(fHist(threshold + 1: end), 'all');
    
    
    % Get our initial entropy
    hn = 0;
    he = - pe*log(pe); 
    
    for i=threshold +2:numel(fHist)
        f = fHist(i);
        if f
            pe = f/sum(fHist(threshold + 1: end), 'all');
            he = he - pe*log(pe);
        end        
    end
    
    disp('min threshold:');
    disp(threshold);
    
    disp('max threshold:');
    disp(numel(fHist));
    
    % Calculate our entropy for each threshold
    hT = hn + he;
    p0p = fHist(threshold + 2);
    p1p = sum(fHist(threshold + 2:end), 'all');
    for t=threshold + 1:numel(fHist) - 2
        ftp = fHist(t + 2);
        if ftp
            p0 = p0p;
            p1 = p1p;
            p0p = sum(fHist(1 : t), 'all');
            p1p = sum(fHist(t + 1 : end), 'all');
 
            hn = (p0/p0p)*hn-((ftp/p0p)*log(ftp/p0p))-((p0/p0p)*log(p0/p0p)); 

            he = (p1/p1p)*he+((ftp/p1p)*log(ftp/p1p))-((p1/p1p)*log(p1/p1p));

            ht = hn + he;

            % If the entropy is greater for this threshold, let's use it.
            if ht > hT
                hT = ht;
                threshold = t;
            end

        end
    end
end
