clearvars;
close all;
clc;

lena_bmp = imread('lena.bmp');

jet_bmp = imread('jet.bmp');

lena16 = int16(lena_bmp);
jet16 = int16(jet_bmp);

multiplied_bmp = immultiply(lena16, jet16);

figure(1);
imshow(multiplied_bmp, []);
title('lena16 multiplied by jet16');

multiplied_const = immultiply(lena_bmp, 3);
figure(2);
subplot(1,2,1);
imshow(lena_bmp);
title('Original');
subplot(1,2,2);
imshow(multiplied_const);
title('Multiplied by 3');


kolo = imread('kolo.bmp');
maska = boolean(kolo);
multiplied_mask = immultiply(lena_bmp, maska);

figure(3);
imshow(multiplied_mask);
title('lena16 multiplied by kolo mask');