close all;
clearvars;
clc;

obraz = zeros(11);

obraz(5,5)=1;

[H, Theta, Rho] = hough(obraz, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);

figure();
imshow(H, []);
title('[5,5] = 1');


obraz(9,9)=1;
[H, Theta, Rho] = hough(obraz, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);
figure();
imshow(H, []);
title('[5,5],[3,9] = 1');

obraz(2,6)=1;
obraz(11,8)=1;
[H, Theta, Rho] = hough(obraz, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);

figure();
imshow(H, []);
title('[5,5],[9,9],[2,6],[11,8] = 1');

newRho = Rho(43);
newTheta = Theta(1);

x = 0:0.1:10;
y = ((newRho - x * cosd(newTheta)) / sind(newTheta));

figure();
imshow(obraz);
hold on;
plot(x+1, y+1);