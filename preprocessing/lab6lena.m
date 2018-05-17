close all;
clearvars;
clc;

lena = imread('lena.bmp');

filtr = fspecial('average');

plansza2 = uint8(conv2(double(lena), filtr, 'same'));

figure(1);
subplot(2,2,1);
imshow(lena);
title('Original');
subplot(2,2,2);
imshow(plansza2);
title('Filtered');
subplot(2,2,3:4);
imshow(imabsdiff(lena, plansza2), []);
title('Absolute difference');

f3 = fspecial('average', 3);
f5 = fspecial('average', 5);
f9 = fspecial('average', 9);
f15 = fspecial('average', 15);
f35 = fspecial('average', 35);

filtr3 = uint8(conv2(double(lena), f3, 'same'));
filtr5 = uint8(conv2(double(lena), f5, 'same'));
filtr9 = uint8(conv2(double(lena), f9, 'same'));
filtr15 = uint8(conv2(double(lena), f15, 'same'));
filtr35 = uint8(conv2(double(lena), f35, 'same'));


figure(2);
subplot(3,2,1);
imshow(plansza2);
title('Default');
subplot(3,2,2);
imshow(filtr3);
title('3');
subplot(3,2,3);
imshow(filtr5);
title('5');
subplot(3,2,4);
imshow(filtr9);
title('9');
subplot(3,2,5);
imshow(filtr15);
title('15');
subplot(3,2,6);
imshow(filtr35);
title('35');


M = [1 2 1; 2 4 2; 1 2 1];
M = M/sum(sum(M));

lenaM = uint8(conv2(double(lena), M, 'same'));

figure(3);
subplot(1,2,1);
imshow(lena);
title('Original');
subplot(1,2,2);
imshow(lenaM);
title('Mask');

gauss = fspecial('gaussian', 5, 0.5);

lenaGauss = uint8(conv2(double(lena), gauss, 'same'));

figure(4);
subplot(2,2,1);
imshow(lena);
title('Original');
subplot(2,2,2);
imshow(lenaGauss);
title('Gaussian');
subplot(2,2,3:4);
mesh(gauss);

gauss2 = fspecial('gaussian', 5, 1.5);
gauss3 = fspecial('gaussian', 5, 10);

lenaGauss2 = uint8(conv2(double(lena), gauss2, 'same'));
lenaGauss3 = uint8(conv2(double(lena), gauss3, 'same'));

figure(5);
subplot(2,2,1);
imshow(lena);
title('Original');
subplot(2,2,2);
imshow(lenaGauss);
title('0.5');
subplot(2,2,3);
imshow(lenaGauss2);
title('1.5');
subplot(2,2,4);
imshow(lenaGauss3);
title('10');






