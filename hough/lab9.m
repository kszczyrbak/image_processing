close all;
clearvars;
clc;

dom = imread('dom.png');

domLog = edge(dom, 'log');
figure();
subplot(1,2,1);
imshow(dom);
title('Original');
subplot(1,2,2);
imshow(domLog);
title('Edge log');

domCanny = edge(dom, 'canny');
figure();
subplot(1,2,1);
imshow(dom);
title('Original');
subplot(1,2,2);
imshow(domCanny);
title('Edge canny');

domSobel = edge(dom, 'sobel');
figure();
subplot(1,2,1);
imshow(dom);
title('Original');
subplot(1,2,2);
imshow(domSobel);
title('Edge sobel');

domLogManual = edge(dom, 'log', 0.01);
domCannyManual = edge(dom, 'canny', 0.2);
domSobelManual = edge(dom, 'sobel', 0.14);



figure()
subplot(3,2,1);
imshow(domLog);
title('Log auto');
subplot(3,2,2);
imshow(domLogManual);
title('Log manual');
subplot(3,2,3);
imshow(domCanny);
title('Canny auto');
subplot(3,2,4);
imshow(domCannyManual);
title('Canny manual');
subplot(3,2,5);
imshow(domSobel);
title('Sobel auto');
subplot(3,2,6);
imshow(domSobelManual);
title('Sobel manual');




