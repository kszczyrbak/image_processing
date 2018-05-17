clearvars;
close all;
clc;

lena_bmp = imread('lena.bmp');

jet_bmp = imread('jet.bmp');

sub_bmp = imsubtract(lena_bmp, jet_bmp);

figure(1);
imshow(sub_bmp);
title('lena_bmp subtracted by jet_bmp');

lena_16 = int16(lena_bmp);
jet_16 = int16(jet_bmp);

sub_16 = imsubtract(lena_16, jet_16);

figure(2);
imshow(sub_16, []);
title('lena16 subtracted by jet16');

absdiff = imabsdiff(lena_bmp, jet_bmp);
figure(3);
imshow(absdiff, []);
title('lena absdiff jet');