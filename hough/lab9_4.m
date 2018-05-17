close all;
clearvars;
clc;

lab112 = imread('lab112.png');

imshow(lab112);

labBinary = imcomplement(imbinarize(lab112, 35/255));
labOpen = imopen(labBinary, ones(1,8));
labEdged = edge(labOpen, 'canny');

%%
figure();
subplot(2,2,1);
imshow(lab112);
title('Original');
subplot(2,2,2);
imshow(labBinary);
title('Binarized');
subplot(2,2,3);
imshow(labOpen);
title('Opened');
subplot(2,2,4);
imshow(labEdged);
title('Edged');

[H, theta, rho] = hough(labEdged);

%%

peaks = houghpeaks(H, 8);

figure();
imshow(H, []);
hold on;
plot(peaks, 'o');

lines = houghlines(labEdged, theta, rho, peaks, 'FillGap', 5, 'MinLength', 7);
figure(), imshow(lab112), hold on
max_len = 0;    
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end