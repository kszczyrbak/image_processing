close all;
clearvars;
clc;

%%

ferrari = imread('ferrari.bmp');
SE = strel('square', 3);
ferrariErode = imerode(ferrari, SE);
ferrariDilate = imdilate(ferrari, SE);

figure(1);
subplot(2,2,1);
imshow(ferrari);
title('Original');
subplot(2,2,2);
imshow(ferrariErode);
title('Erode');
subplot(2,2,3);
imshow(ferrariDilate);
title('Dilate');
subplot(2,2,4);
imshow(ferrariDilate - ferrariErode);
title('Gradient');

%%
ferrariOpen = imopen(ferrari, SE);
ferrariClose = imclose(ferrari, SE);

figure(2);
subplot(2,2,1:2);
imshow(ferrari);
title('Original');
subplot(2,2,3);
imshow(ferrariOpen);
title('Open');
subplot(2,2,4);
imshow(ferrariClose);
title('Close');

%%
ferrariTop = imtophat(ferrari, SE);
ferrariBottom = imbothat(ferrari, SE);

figure(3);
subplot(2,2,1:2);
imshow(ferrari);
title('Original');
subplot(2,2,3);
imshow(ferrariTop);
title('Top');
subplot(2,2,4);
imshow(ferrariBottom);
title('Bottom');

%%
rice = imread('rice.png');
SE = strel('disk',10);
riceTop = imtophat(rice, SE);

figure(4);
subplot(1,2,1);
imshow(rice);
title('Original');
subplot(1,2,2);
imshow(riceTop);
title('Top hat');
