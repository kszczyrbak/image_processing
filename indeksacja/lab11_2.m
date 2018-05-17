clearvars;
clc;
close all;

img = imread('shapes.png');
imgInd = bwlabel(img);

wsp = obliczWspolczynniki(imgInd);

[YY, XX] = size(imgInd);

for y = 1:YY
    for x = 1:XX
        px = imgInd(y,x);
        if (px ~= 0  && ~(wsp(px,2) > 0.33 && wsp(px,2) < 0.66) )
            imgInd(y,x) = 0;
        end
                      
    end
end

figure();
imshow(imgInd, []);

img2 = imread('shapesReal.png');
img2_pre = img2;

figure();
imshow(img2);
title('Original');

img2 = im2bw(img2, 0.23);
SE = strel('square', 5);
img2 = imcomplement(img2);
img2 = imerode(img2, SE);
img2 = bwlabel(img2, 8);
wsp2 = obliczWspolczynniki(img2);

[YY, XX] = size(img2);

for y = 1:YY
    for x = 1:XX
        px = img2(y,x);
        if (px ~= 0  && ~(wsp2(px,2) > 0.50 && wsp2(px,2) < 0.66) )
            img2(y,x) = 0;
        end
                      
    end
end

figure();
subplot(1,2,1);
imshow(img2_pre, []);
title('Original');
subplot(1,2,2);
imshow(img2, []);
title('Result');