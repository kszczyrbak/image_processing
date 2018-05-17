clc;
close all;
clearvars;

image = imread('rice.png');
[X Y] = size(image);
imageBW = image;

for i = 1:X
    for j = 1:Y
    
        avg = meanLT(i,j,20,image,X, Y);
        if imageBW(i,j) > avg
            imageBW(i,j) = 255;
        else
            imageBW(i,j) = 0;        
        end
    end
end

figure(1);
subplot(1,2,1);
imshow(image);
title('Original');
subplot(1,2,2);
imshow(imageBW);
title('Binary');

%%

image = imread('katalog.bmp');
[X Y] = size(image);
imageBW = image;

k = 0.15;
R = 128;
W = 8;
for i = 1:X
    for j = 1:Y
        
        
        avg = meanLT(i,j,W,image,X, Y);
        odch = stddevLT(i,j,W,image,avg,X,Y);
        T = avg*(1 + k*((odch/R) - 1));
        if imageBW(i,j) > T
            imageBW(i,j) = 255;
        else
            imageBW(i,j) = 0;        
        end
    end
end

figure(2);
subplot(1,2,1);
imshow(image);
title('Original');
subplot(1,2,2);
imshow(imageBW);
title('Binary');

