clearvars;
close all;
clc;

%%

dom = imread('dom.png');
domEdged = edge(dom, 'log');  

[H, theta, rho] = hough(domEdged);
peaks = houghpeaks(H, 18);

figure;
imshow(H);
hold on;
plot(peaks, 'o');

lines = houghlines(domEdged, theta, rho, peaks, 'FillGap', 10, 'MinLength', 10);
figure(), imshow(dom), hold on
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