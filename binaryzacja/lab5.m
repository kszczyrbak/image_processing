clc;
close all;
clearvars;

coins = imread('coins.png');


figure(1);
subplot(2,1,1);
imshow(coins);
subplot(2,1,2);
imhist(coins);

coinsbw = im2bw(coins, 86/255);

figure(2);
subplot(2,1,1);
imshow(coins);
subplot(2,1,2);
imshow(coinsbw);

figura = imread('figura.png');
figure(3);
subplot(2,1,1);
imshow(figura);
subplot(2,1,2);
imhist(figura);

figura2 = imread('figura2.png');
figure(4);
subplot(2,1,1);
imshow(figura2);
subplot(2,1,2);
imhist(figura2);

figura3 = imread('figura3.png');
figure(5);
subplot(2,1,1);
imshow(figura3);
subplot(2,1,2);
imhist(figura3);

figura4 = imread('figura4.png');
figure(6);
subplot(2,1,1);
imshow(figura4);
subplot(2,1,2);
imhist(figura4);

coinsbwotsu = im2bw(coins, graythresh(coins));
coinsbwkittler = im2bw(coins, clusterKittler(coins)/255);
coinsbwyen = im2bw(coins, entropyYen(coins)/255);

figure(7);
subplot(3,2,1);
imshow(coins);
title('Original');
subplot(3,2,2);
imhist(coins);
title('Histogram');
subplot(3,2,3);
imshow(coinsbw);
title(strcat('recznie ',num2str(86/255)));
subplot(3,2,4);
imshow(coinsbwotsu);
title(strcat('Otsu ',num2str(graythresh(coins))));
subplot(3,2,5);
imshow(coinsbwkittler);
title(strcat('Kittler ',num2str(clusterKittler(coins)/255)));
subplot(3,2,6);
imshow(coinsbwyen);
title(strcat('Yen ',num2str(entropyYen(coins)/255)));






