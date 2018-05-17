close all;
clearvars;
clc;

ertka = imread('ertka.bmp');

SE = strel('square',3);

imageErode = imerode(ertka, SE);

figure(1);
subplot(1,2,1);
imshow(ertka);
title('Original');
subplot(1,2,2);
imshow(imageErode);
title('imerode');

SE = strel('octagon',3);
imageErode = imerode(ertka, SE);

figure(2);
subplot(1,2,1);
imshow(ertka);
title('Original');
subplot(1,2,2);
imshow(imageErode);
title('imerode');

SE = strel('square',3);

ertkaErode3 = imerode(ertka, SE);
ertkaErode3 = imerode(ertkaErode3, SE);
ertkaErode3 = imerode(ertkaErode3, SE);

figure(3);
subplot(1,2,1);
imshow(ertka);
title('Original');
subplot(1,2,2);
imshow(ertkaErode3);
title('imerode');

buzka = imread('buzka.bmp');
SE = [0 1 1; 1 0 1; 1 1 0];
buzkaErodeManual = imerode(buzka, SE);

figure(4);
subplot(1,2,1);
imshow(buzka);
title('Original');
subplot(1,2,2);
imshow(buzkaErodeManual);
title('imerode');


SE = strel('square', 3);
imageDilate = imdilate(ertka, SE);


figure(5);
subplot(1,2,1);
imshow(ertka);
title('Original');
subplot(1,2,2);
imshow(imageDilate);
title('imerode');

%%

image = ertka;
SE = strel('square', 3);
imageErode = imerode(image, SE);
imageDilate = imdilate(image, SE);
imageOpen = imopen(image, SE);
imageClose = imclose(image, SE);

figure(6);
subplot(3,2,1);
imshow(image);
title('Original');
subplot(3,2,2);
imshow(imageErode);
title('Erode');
subplot(3,2,3);
imshow(imageDilate);
title('Dilate');
subplot(3,2,4);
imshow(imageOpen);
title('Open');
subplot(3,2,5:6);
imshow(imageClose);
title('Close');

%%

image = imread('wyspa.bmp');
SE = strel('square', 3);
imageErode = imerode(image, SE);
imageDilate = imdilate(image, SE);
imageOpen = imopen(image, SE);
imageClose = imclose(image, SE);

figure(7);
subplot(3,2,1);
imshow(image);
title('Original');
subplot(3,2,2);
imshow(imageErode);
title('Erode');
subplot(3,2,3);
imshow(imageDilate);
title('Dilate');
subplot(3,2,4);
imshow(imageOpen);
title('Open');
subplot(3,2,5:6);
imshow(imageClose);
title('Close');

%%

image = imread('kolka.bmp');
SE = strel('square', 3);
imageErode = imerode(image, SE);
imageDilate = imdilate(image, SE);
imageOpen = imopen(image, SE);
imageClose = imclose(image, SE);

figure(8);
subplot(3,2,1);
imshow(image);
title('Original');
subplot(3,2,2);
imshow(imageErode);
title('Erode');
subplot(3,2,3);
imshow(imageDilate);
title('Dilate');
subplot(3,2,4);
imshow(imageOpen);
title('Open');
subplot(3,2,5:6);
imshow(imageClose);
title('Close');

%%

SE = strel('square',3);
erClose = imclose(ertka, SE);
erErode = imerode(erClose, SE);
erErode = imerode(erErode, SE);
erErode = imerode(erErode, SE);
figure(9);
subplot(1,2,1);
imshow(ertka);
title('Original');
subplot(1,2,2);
imshow(erErode);
title('Morphed');

%%
hom = imread('hom.bmp');
SE1 = [0 1 0; 1 1 1; 0 1 0];
SE2 = [1 0 1; 0 0 0; 1 0 1];
hitMiss = bwhitmiss(hom, SE1, SE2);

figure(10);
subplot(1,2,1);
imshow(hom);
title('Original');
subplot(1,2,2);
imshow(hitMiss);
title('Hit or miss');

