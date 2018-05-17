close all;
clearvars;
clc;

rice = imread('rice.png');

ricebw = im2bw(rice, 120/255);
ricebwotsu = im2bw(rice, graythresh(rice));
ricebwkittler = im2bw(rice, clusterKittler(rice)/255);
ricebwyen = im2bw(rice, entropyYen(rice)/255);

figure(7);
subplot(3,2,1);
imshow(rice);
title('Original');
subplot(3,2,2);
imhist(rice);
title('Histogram');
subplot(3,2,3);
imshow(ricebw);
title(strcat('recznie ',num2str(86/255)));
subplot(3,2,4);
imshow(ricebwotsu);
title(strcat('Otsu ',num2str(graythresh(rice))));
subplot(3,2,5);
imshow(ricebwkittler);
title(strcat('Kittler ',num2str(clusterKittler(rice)/255)));
subplot(3,2,6);
imshow(ricebwyen);
title(strcat('Yen ',num2str(entropyYen(rice)/255)));
