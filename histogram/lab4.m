clearvars;
close all;
clc;

lena1 = imread('lena1.bmp');

lena2 = imread('lena2.bmp');

lena3 = imread('lena3.bmp');

lena4 = imread('lena4.bmp');


figure(1);
subplot(4,2,1);
imshow(lena1);
subplot(4,2,2);
imhist(lena1, 256);
subplot(4,2,3);
imshow(lena2);
subplot(4,2,4);
imhist(lena2, 256);
subplot(4,2,5);
imshow(lena3);
subplot(4,2,6);
imhist(lena3, 256);
subplot(4,2,7);
imshow(lena4);
subplot(4,2,8);
imhist(lena4, 256);

hist1 = imread('hist1.bmp');

figure(2);
subplot(2,1,1);
imshow(hist1);
subplot(2,1,2);
imhist(hist1, 256);

adjust = imadjust(hist1);

figure(3);
subplot(2,1,1);
imshow(adjust);
subplot(2,1,2);
imhist(adjust);

[H,x] = imhist(hist1);
C = cumsum(H);
maxH = max(H);
maxC = max(C);
k = maxC/maxH;
C2 = C/k;

figure(4);
subplot(2,1,1);
imshow(hist1);
subplot(2,1,2);
hold on;
plot(x,H);
plot(x,C2);

C2int8 = uint8(C2*255 / max(C2));
histLUT = intlut(hist1, C2int8);
[H2 x2] = imhist(histLUT,256);
NewC = cumsum(H2);
maxH2 = max(H2);
maxNewC = max(NewC);
newK = maxNewC / maxH2;
NewC2 = NewC/newK;

figure(5);
subplot(2,2,1);
imshow(hist1);
subplot(2,2,2);
imshow(histLUT);
subplot(2,2,3:4);
hold on;
plot(x2, H2);
plot(x2, NewC2);


histEqualized = histeq(hist1, 256);
figure(6);
subplot(1,2,1);
imshow(hist1);
subplot(1,2,2);
imshow(histEqualized);

hist2 = imread('hist2.bmp');
hist3 = imread('hist3.bmp');
hist4 = imread('hist4.bmp');

figure(7);
subplot(2,2,1);
imshow(hist1);
title('Original');
subplot(2,2,2);
imshow(imadjust(hist1));
title('Imadjusted');
subplot(2,2,3);
imshow(histeq(hist1));
title('Histeq');
subplot(2,2,4);
imshow(adapthisteq(hist1));
title('CLAHE');

figure(8);
subplot(2,2,1);
imshow(hist2);
title('Original');
subplot(2,2,2);
imshow(imadjust(hist2));
title('Imadjusted');
subplot(2,2,3);
imshow(histeq(hist2));
title('Histeq');
subplot(2,2,4);
imshow(adapthisteq(hist2));
title('CLAHE');

figure(9);
subplot(2,2,1);
imshow(hist3);
title('Original');
subplot(2,2,2);
imshow(imadjust(hist3));
title('Imadjusted');
subplot(2,2,3);
imshow(histeq(hist3));
title('Histeq');
subplot(2,2,4);
imshow(adapthisteq(hist3));
title('CLAHE');

figure(10);
subplot(2,2,1);
imshow(hist4);
title('Original');
subplot(2,2,2);
imshow(imadjust(hist4));
title('Imadjusted');
subplot(2,2,3);
imshow(histeq(hist4));
title('Histeq');
subplot(2,2,4);
imshow(adapthisteq(hist4));
title('CLAHE');