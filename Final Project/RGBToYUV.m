% Jonathon Pearson
% Final Project

function [yuvIm] = RGBToYUV(rgbIm)
    yuvIm = double(rgbIm);
    
    [M, N, C] = size(rgbIm);
   for m = 1 : M
       for n = 1 : N
           p = yuvIm(m, n, :);
           yuvIm(m, n, 1) = 0.299*p(1) +  0.587*p(2) + 0.114*p(3);
           yuvIm(m, n, 2) = -0.14713*p(1) -0.28886*p(2) + 0.436*p(3);
           yuvIm(m, n, 3) = 0.615*p(1) -0.51499*p(2) + -0.10001*p(3);
       end
   end
end
