close all;
clearvars;
clc;

%%

fingerprint = imread('fingerprint.bmp');
morphed = bwmorph(fingerprint, 'thin');
morphed2 = bwmorph(fingerprint, 'thin', 2);
morphedN = bwmorph(fingerprint, 'thin', inf);

figure(1);
subplot(2,2,1);
imshow(fingerprint);
title('Original');
subplot(2,2,2);
imshow(morphed);
title('1 thin');
subplot(2,2,3);
imshow(morphed2);
title('2 thin');
subplot(2,2,4);
imshow(morphedN);
title('N thin');

%%

kosc = imread('kosc.bmp');
skelN = bwmorph(kosc, 'skel', inf);
figure(2);
subplot(1,2,1);
imshow(kosc);
title('Original');
subplot(1,2,2);
imshow(skelN);
title('N skel');

%%

text = imread('text.bmp');
SE = ones(51,1);
textOpen = imopen(text, SE);
textErode = imerode(text, SE);
textReconstructed = imreconstruct(textErode, text);

figure(3);
subplot(2,2,1);
imshow(text);
title('Original');
subplot(2,2,2);
imshow(textOpen);
title('Open');
subplot(2,2,3);
imshow(textErode);
title('Erode');
subplot(2,2,4);
imshow(textReconstructed);
title('Reconstruct');

%%
textFill = imfill(text, 'holes');

figure(4);
subplot(1,2,1);
imshow(text);
title('Original');
subplot(1,2,2);
imshow(textFill);
title('Fill holes');

%%

textClearBorder = imclearborder(text);
figure(5);
subplot(1,2,1);
imshow(text);
title('Original');
subplot(1,2,2);
imshow(textClearBorder);
title('Clear border');
