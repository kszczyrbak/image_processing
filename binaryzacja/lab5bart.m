clearvars;
close all;
clc;

bart = imread('bart.bmp');
bartBW = bart;

figure(1);
subplot(1,2,1);
imshow(bart);
subplot(1,2,2);
imhist(bart);

bartBW = bart > 195 & bart < 210;
figure(1);
subplot(1,2,1);
imshow(bart);
subplot(1,2,2);
imshow(uint8(bartBW), []);
