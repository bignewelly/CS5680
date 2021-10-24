% Jonathon Pearson
% Assignment 4

function [alteredSubbands] = ModifyWaveltCoefficents(subbands)
    %step 3
    var = median(subbands, 'all')/0.6745;

    %step 4:
    t = var*sqrt(2*log(numel(subbands)));

    %step 5:
    alteredSubbands = subbands;

    gt = find(subbands >= t);
    lt = find(subbands <= -t);
    close = find(abs(subbands) < t);
    
    alteredSubbands(gt) = subbands(gt) - t;
    alteredSubbands(lt) = subbands(lt) + t;
    alteredSubbands(close) = 0;
end

