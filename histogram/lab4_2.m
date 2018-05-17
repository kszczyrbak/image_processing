clearvars;
close all;
clc;


phobos = imread('phobos.bmp');
phobosEqualised = histeq(phobos);

figure(1);
subplot(1,2,1);
imshow(phobos);
title('Original');
subplot(1,2,2);
imshow(phobosEqualised);
title('Histeq');

load histogramZadany.mat;
phobosCorrect = histeq(phobos, histogramZadany);

figure(2);
subplot(1,2,1);
imshow(phobos);
title('Original');
subplot(1,2,2);
imshow(phobosCorrect);
title('Histeq');

phobosAdjusted = imadjust(phobos);
phobosCLAHE = adapthisteq(phobos);

figure(3);
subplot(1,3,1);
imshow(phobos);
title('Original');
subplot(1,3,2);
imshow(phobosAdjusted);
title('Adjusted');
subplot(1,3,3);
imshow(phobosCLAHE);
title('CLAHE');
