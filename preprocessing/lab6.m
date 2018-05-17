close all;
clearvars;
clc;

plansza = imread('plansza.bmp');

filtr = fspecial('average');

plansza2 = uint8(conv2(double(plansza), filtr, 'same'));

figure(1);
subplot(2,2,1);
imshow(plansza);
title('Original');
subplot(2,2,2);
imshow(plansza2);
title('Filtered');
subplot(2,2,3:4);
imshow(imabsdiff(plansza, plansza2), []);
title('Absolute difference');

f3 = fspecial('average', 3);
f5 = fspecial('average', 5);
f9 = fspecial('average', 9);
f15 = fspecial('average', 15);
f35 = fspecial('average', 35);

filtr3 = uint8(conv2(double(plansza), f3, 'same'));
filtr5 = uint8(conv2(double(plansza), f5, 'same'));
filtr9 = uint8(conv2(double(plansza), f9, 'same'));
filtr15 = uint8(conv2(double(plansza), f15, 'same'));
filtr35 = uint8(conv2(double(plansza), f35, 'same'));


figure(2);
subplot(3,2,1);
imshow(plansza2);
title('Default');
subplot(3,2,2);
imshow(filtr3);
title('3');
subplot(3,2,3);
imshow(filtr5);
title('5');
subplot(3,2,4);
imshow(filtr9);
title('9');
subplot(3,2,5);
imshow(filtr15);
title('15');
subplot(3,2,6);
imshow(filtr35);
title('35');


