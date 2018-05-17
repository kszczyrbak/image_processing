close all;
clearvars;
clc;

%%

calc = imread('calculator.bmp');

SE = ones(1,71);

calcErode = imerode(calc, SE);
calcReconstruct = imreconstruct(calcErode, calc);
calcOpen = imopen(calc, SE);

figure(1);
subplot(2,2,1:2);
imshow(calc);
title('Original');
subplot(2,2,3);
imshow(calcReconstruct);
title('Reconstructed');
subplot(2,2,4);
imshow(calcOpen);
title('Open');

%%

calcDiff = calc - calcReconstruct;

figure(2);
subplot(2,2,1);
imshow(calc);
title('Original');
subplot(2,2,2);
imshow(calcReconstruct);
title('Reconstructed');
subplot(2,2,3:4);
imshow(calcDiff);
title('Difference');

%%
calcTop = imtophat(calc, SE);

figure(3);
subplot(1,2,1);
imshow(calcTop);
title('Top hat');
subplot(1,2,2);
imshow(calcDiff);
title('Difference');

%%
SE = ones(1,11);
calcDiffErode = imerode(calcDiff, SE);
calcDiffReconstruct = imreconstruct(calcDiffErode, calcDiff);

figure(4);
subplot(2,2,1:2);
imshow(calcDiff);
title('Difference');
subplot(2,2,3);
imshow(calcDiffErode);
title('Erode of diff');
subplot(2,2,4);
imshow(calcDiffReconstruct);
title('Reconstruct of diff');

%%
SE = ones(1,21);
image = calcDiffReconstruct;
imageDilate = imdilate(image, SE);
imageReconstruct = imreconstruct(min(imageDilate, calcDiff), calcDiff);

subplot(2,2,1);
imshow(image);
title('Image');
subplot(2,2,2);
imshow(imageDilate);
title('imageDilate');
subplot(2,2,3:4);
imshow(imageReconstruct);
title('Reconstruct');


