%% cleanup

clearvars;
close all;
clc;

%% imfinfo

infoBmp = imfinfo('lena.bmp');
infoJpg = imfinfo('lena.jpg');

%% imread

lenaBmp = imread('lena.bmp');
lenaJpg = imread('lena.jpg');

figure(1);
subplot(1, 2, 1);
imshow(lenaBmp);
title('lena.bmp');
subplot(1, 2, 2);
imshow(lenaJpg);
title('lena.jpg');

%% rgb2gray

figure(2);
subplot(1, 2, 1);
imshow(lenaBmp);
title('lena.bmp RGB');
subplot(1, 2, 2);
imshow(rgb2gray(lenaBmp));
title('lena.bmp gray');

%% imwrite

lenaBmpGray = rgb2gray(lenaBmp);
imwrite(lenaBmpGray, 'lena_gray.bmp');

%% mesh


figure(3);
colormap(gray);
mesh(lenaBmpGray);

%% przekroj

figure(4);
plot(lenaBmpGray(10, :));

%% przekroj 2

figure(5);
plot(lenaBmpGray(:, 10));

