close all;
clc;
clearvars;

lenaSzum = imread('lenaSzum.bmp');
lena = imread('lenaSzum.bmp');

avg = fspecial('average');
lenaAverage = uint8(conv2(double(lena), avg, 'same'));
lenaMedian = medfilt2(lena);

figure(1);
subplot(2,2,1);
imshow(lena);
title('Original');
subplot(2,2,2);
imshow(lenaMedian);
title('Median');
subplot(2,2,3);
imshow(lenaAverage);
title('Average');
subplot(2,2,4);
imshow(imabsdiff(lenaAverage, lenaMedian), []);
title('Absolute difference');


lenaSzumMedian = medfilt2(lenaSzum);

figure(12);
subplot(2,2,1);
imshow(lenaSzum);
title('Original');
subplot(2,2,2);
imshow(lenaSzumMedian);
title('Median');
subplot(2,2,3:4);
imshow(imabsdiff(lenaSzum, lenaSzumMedian), []);

lenaTmp = lenaSzum;

for i = 1:10
    lenaTmp = medfilt2(lenaTmp, [5 5]);
end

figure(3);
subplot(1,2,1);
imshow(lenaSzum);
title('Original');
subplot(1,2,2);
imshow(lenaTmp);
title('10x median');

