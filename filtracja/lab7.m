clc;
clear vars;
close all;


load MR_data.mat;

local_window = [5 5];


figure(1);
subplot(3,2,1);
imshow(I_noisefree, []);
title('i\_noisefree');
subplot(3,2,2);
imshow(I_noisy1, []);
title('i\_noisy1');
subplot(3,2,3);
imshow(I_noisy2, []);
title('i\_noisy2');
subplot(3,2,4);
imshow(I_noisy3, []);
title('i\_noisy3');
subplot(3,2,5:6);
imshow(I_noisy4, []);
title('i\_noisy4');

%%
img = I_noisefree;

figure(2);
subplot(3,1,1);
imshow(img, []);
title('I\_noisefree');
subplot(3,1,2);
imshow(convolution(img, local_window), []);
title('I\_noisefree convolution');
subplot(3,1,3);
imshow(bilateral(img, local_window, 2.7), []);
title('I\_noisefree bilateral');

%%
img = I_noisy1;

figure(3);
subplot(3,1,1);
imshow(img, []);
title('I\_noisy1');
subplot(3,1,2);
imshow(convolution(img, local_window), []);
title('I\_noisy1 convolution');
subplot(3,1,3);
imshow(bilateral(img, local_window, 5), []);
title('I\_noisy1 bilateral');

%%
img = I_noisy2;

figure(4);
subplot(3,1,1);
imshow(img, []);
title('I\_noisy2');
subplot(3,1,2);
imshow(convolution(img, local_window), []);
title('I\_noisy2 convolution');
subplot(3,1,3);
imshow(bilateral(img, local_window, 3), []);
title('I\_noisy2 bilateral');

%%
img = I_noisy3;

figure(5);
subplot(3,1,1);
imshow(img, []);
title('I\_noisy3');
subplot(3,1,2);
imshow(convolution(img, local_window), []);
title('I\_noisy3 convolution');
subplot(3,1,3);
imshow(bilateral(img, local_window, 5), []);
title('I\_noisy3 bilateral');

%%
img = I_noisy4;

figure(6);
subplot(3,1,1);
imshow(img, []);
title('I\_noisy4');
subplot(3,1,2);
imshow(convolution(img, local_window), []);
title('I\_noisy4 convolution');
subplot(3,1,3);
imshow(bilateral(img, local_window, 20), []);
title('I\_noisy4 bilateral');