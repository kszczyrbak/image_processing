clearvars;
close all;
clc;

lena_bmp = imread('lena.bmp');

jet_bmp = imread('jet.bmp');

lena_complement = imcomplement(lena_bmp);
jet_complement = imcomplement(jet_bmp);

figure(1);
imshow(lena_complement);
title('complement of lena');

figure(2);
imshow(jet_complement);
title('complement of jet');