close all;
clc;
clearvars;

%%

kw = imread('kw.bmp');

load maskiPP;

kwConv = uint8(conv2(double(kw), R1, 'same'));

kwAdd = kwConv + 128;
kwAbs = abs(kwConv);



F = fspecial('laplacian');

kwLaplacian = uint8(conv2(double(kw), F, 'same'));

figure(1);
subplot(2,2,1);
imshow(kw);
title('Original');
subplot(2,2,2);
imshow(kwAbs, []);
title('Abs');
subplot(2,2,3);
imshow(kwAdd, []);
title(' +128 ');
subplot(2,2,4);
imshow(imabsdiff(kwLaplacian, kw), []);
title('Laplacian');

%%

kwConv = uint8(conv2(double(kw), R2, 'same'));

kwAdd = kwConv + 128;
kwAbs = abs(kwConv);

F = fspecial('laplacian');

kwLaplacian = uint8(conv2(double(kw), F, 'same'));

figure(2);
subplot(2,2,1);
imshow(kw);
title('Original');
subplot(2,2,2);
imshow(kwAbs, []);
title('Abs');
subplot(2,2,3);
imshow(kwAdd, []);
title(' +128 ');
subplot(2,2,4);
imshow(imabsdiff(kwLaplacian, kw), []);
title('Laplacian');

%%

kwConv = uint8(conv2(double(kw), P1, 'same'));

kwAdd = kwConv + 128;
kwAbs = abs(kwConv);

F = fspecial('laplacian');

kwLaplacian = uint8(conv2(double(kw), F, 'same'));

figure(3);
subplot(2,2,1);
imshow(kw);
title('Original');
subplot(2,2,2);
imshow(kwAbs, []);
title('Abs');
subplot(2,2,3);
imshow(kwAdd, []);
title(' +128 ');
subplot(2,2,4);
imshow(imabsdiff(kwLaplacian, kw), []);
title('Laplacian');

%%


kwConv = uint8(conv2(double(kw), P2, 'same'));

kwAdd = kwConv + 128;
kwAbs = abs(kwConv);

F = fspecial('laplacian');

kwLaplacian = uint8(conv2(double(kw), F, 'same'));

figure(4);
subplot(2,2,1);
imshow(kw);
title('Original');
subplot(2,2,2);
imshow(kwAbs, []);
title('Abs');
subplot(2,2,3);
imshow(kwAdd, []);
title(' +128 ');
subplot(2,2,4);
imshow(imabsdiff(kwLaplacian, kw), []);
title('Laplacian');


%%


kwConv = uint8(conv2(double(kw), S1, 'same'));

kwAdd = kwConv + 128;
kwAbs = abs(kwConv);

F = fspecial('laplacian');

kwLaplacian = uint8(conv2(double(kw), F, 'same'));

figure(5);
subplot(2,2,1);
imshow(kw);
title('Original');
subplot(2,2,2);
imshow(kwAbs, []);
title('Abs');
subplot(2,2,3);
imshow(kwAdd, []);
title(' +128 ');
subplot(2,2,4);
imshow(imabsdiff(kwLaplacian, kw), []);
title('Laplacian');

%%


kwConv = uint8(conv2(double(kw), S2, 'same'));

kwAdd = kwConv + 128;
kwAbs = abs(kwConv);

F = fspecial('laplacian');

kwLaplacian = uint8(conv2(double(kw), F, 'same'));

figure(6);
subplot(2,2,1);
imshow(kw);
title('Original');
subplot(2,2,2);
imshow(kwAbs, []);
title('Abs');
subplot(2,2,3);
imshow(kwAdd, []);
title(' +128 ');
subplot(2,2,4);
imshow(imabsdiff(kwLaplacian, kw), []);
title('Laplacian');

%%

OS1 = conv2(double(kw), S1, 'same');
OS2 = conv2(double(kw), S2, 'same');
OW = sqrt(OS1.^2 + OS2.^2);

figure(7);
subplot(1,2,1);
imshow(kw);
title('Original');
subplot(1,2,2);
imshow(OW);
title('Combined sqrt');

OW2 = abs(OS1) + abs(OS2);

figure(8);
subplot(1,2,1);
imshow(kw);
title('Original');
subplot(1,2,2);
imshow(OW2);
title('Combined abs');


%%

jet = imread('jet.bmp');

jetOS1 = conv2(double(jet), S1, 'same');
jetOS2 = conv2(double(jet), S2, 'same');
jetOW = sqrt(jetOS1.^2 + jetOS2.^2);

figure(9);
subplot(1,2,1);
imshow(jet);
title('Original');
subplot(1,2,2);
imshow(jetOW, []);
title('Combined sqrt');

jetOW2 = abs(jetOS1) + abs(jetOS2);

figure(10);
subplot(1,2,1);
imshow(jet);
title('Original');
subplot(1,2,2);
imshow(jetOW2, []);
title('Combined abs');


