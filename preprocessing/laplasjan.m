clearvars;
clc;
close all;

moon = imread('moon.bmp');

M = [0 1 0 ; 1 -4 1; 0 1 0];

M = M/9;


moonConv = conv2(double(moon), M, 'same');

moonConvAdd = moonConv + 128;
moonConvAbs = abs(moonConv);

F = fspecial('laplacian');

moonLaplacian = uint8(conv2(double(moon), F, 'same'));


subplot(2,2,1);
imshow(moon);
title('Original');
subplot(2,2,2);
imshow(moonConvAbs, []);
title('Abs');
subplot(2,2,3);
imshow(moonConvAdd, []);
title(' +128 ');
subplot(2,2,4);
imshow(imabsdiff(moonLaplacian, moon), []);
title('Laplacian');