clearvars;

close all;
clc;

lenaRGB = imread('lenaRGB.bmp');
jezioroRGB = imread('jezioro.jpg');
lenaR = lenaRGB(:,:,1);
lenaG = lenaRGB(:,:,2);
lenaB = lenaRGB(:,:,3);


figure(1);
subplot(2,2,1);
imshow(lenaRGB);
title('RGB');
subplot(2,2,2);
imshow(lenaR);
title('R');
subplot(2,2,3);
imshow(lenaG);
title('G');
subplot(2,2,4);
imshow(lenaB);
title('B');

histLenaR = imhist(lenaR);
histLenaG = imhist(lenaG);
histLenaB = imhist(lenaB);

figure(2);
subplot(1,3,1);
plot(histLenaR);
title('R');
subplot(1,3,2);
plot(histLenaG);
title('G');
subplot(1,3,3);
plot(histLenaB);
title('B');

lenaEQ = lenaRGB;

Re = histeq(lenaR, 256);
Be = histeq(lenaB, 256);
Ge = histeq(lenaG, 256);

lenaEQ(:,:,1) = Re;
lenaEQ(:,:,2) = Ge;
lenaEQ(:,:,3) = Be;

figure(3);
subplot(1,2,1);
imshow(lenaRGB);
subplot(1,2,2);
imshow(lenaEQ);

%%

obrazHSV = rgb2hsv(lenaRGB);
obrazH = obrazHSV(:,:,1);
obrazS = obrazHSV(:,:,2);
obrazV = obrazHSV(:,:,3);

histH = imhist(obrazH);
histS = imhist(obrazS);
histV = imhist(obrazV)

figure(4);
subplot(1,3,1);
plot(histH);
title('H');
subplot(1,3,2);
plot(histS);
title('S');
subplot(1,3,3);
plot(histV);
title('V');

newHistV = histeq(obrazV, 256);

NewObrazHSV = obrazHSV;
NewObrazHSV(:,:,3) = newHistV;

figure(5);
subplot(1,2,1);
imshow(hsv2rgb(obrazHSV));
subplot(1,2,2);
imshow(hsv2rgb(NewObrazHSV));

%%

obrazHSV = rgb2hsv(jezioroRGB);
obrazH = obrazHSV(:,:,1);
obrazS = obrazHSV(:,:,2);
obrazV = obrazHSV(:,:,3);

histH = imhist(obrazH);
histS = imhist(obrazS);
histV = imhist(obrazV)

figure(6);
subplot(1,3,1);
plot(histH);
title('H');
subplot(1,3,2);
plot(histS);
title('S');
subplot(1,3,3);
plot(histV);
title('V');

newHistV = histeq(obrazV, 256);

NewObrazHSV = obrazHSV;
NewObrazHSV(:,:,3) = newHistV;
figure(7);
subplot(1,2,1);
imshow(hsv2rgb(obrazHSV));
subplot(1,2,2);
imshow(hsv2rgb(NewObrazHSV));
