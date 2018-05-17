%%startup
clearvars;
close all;
clc;

lena_bmp = imread('lena.bmp');

jet_bmp = imread('jet.bmp');

add_bmp = imadd(lena_bmp, jet_bmp);
figure(1);
%%

imshow(add_bmp);

add_ui16 = imadd(lena_bmp, jet_bmp, 'uint16');

figure(2);
imshow(add_ui16, []);
title('lena\_bmp imadd jet\_bmp ');