clearvars;
close all;
clc;


lena_bmp = imread('lena.bmp');

jet_bmp = imread('jet.bmp');

lincomb_bmp1 = imlincomb(1, lena_bmp, 1, jet_bmp, 'uint16');
lincomb_bmp2 = imlincomb(1, lena_bmp, 1.5, jet_bmp, 'uint16');
lincomb_bmp3 = imlincomb(1.5, lena_bmp, 1, jet_bmp, 'uint16');
lincomb_bmp4 = imlincomb(0.5, lena_bmp, 1.5, jet_bmp, 'uint16');


figure(1);
subplot(2,2,1);
imshow(lincomb_bmp1, []);
title('1 ; 1');
subplot(2,2,2);
imshow(lincomb_bmp2, []);
title('1 ; 1.5');
subplot(2,2,3);
imshow(lincomb_bmp3, []);
title('1.5 ; 1');
subplot(2,2,4);
imshow(lincomb_bmp4, []);
title('0.5 ; 1.5');