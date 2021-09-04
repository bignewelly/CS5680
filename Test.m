im1 = imread('Lena.jpg');
im1 = double(im1);
subIm1 = im1(124:127, 100:103);
subIm1(1:4) = 1:4;
subIm1(2, 3) = 255;
subIm1(11) = 250;
subIm1(3,4) = 255;

D = size(subIm1)

[row, col] = size(subIm1)



largeVal = subIm1(1:1);

for i = 1:row
    for j = 1:col
        if largeVal < subIm1(i, j)
            largeVal = subIm1(i,j);
        end
    end
end

loc = [];
count = 0;
for i = 1:row*col
    if (subIm1(i) == largeVal)
        count = count + 1;
        loc(count) = i;
    end
end
        