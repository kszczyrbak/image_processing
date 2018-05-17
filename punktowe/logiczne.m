clearvars;
close all;
clc;

kolo = imread('kolo.bmp');

kwadrat = imread('kwadrat.bmp');

kolo = boolean(kolo);

kwadrat = boolean(kwadrat);

figure(1);
subplot(3,2,1);
imshow(kolo);
subplot(3,2,2);
imshow(kwadrat);
subplot(3,2,3);
imshow(~kolo);
title('NOT kolo');
subplot(3,2,4);
imshow(kolo&kwadrat);
title('kolo AND kwadrat');
subplot(3,2,5);
imshow(kolo|kwadrat);
title('kolo OR kwadrat');
subplot(3,2,6);
imshow(xor(kolo,kwadrat));
title('kolo XOR kwadrat');
