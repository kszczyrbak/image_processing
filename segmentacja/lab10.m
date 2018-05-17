close all;
clearvars;
clc;

knee = imread('knee.png');
kneeSize = size(knee);
[kneeX, kneeY] = size(knee);
kneeDouble = double(knee);
kneeCopy = knee;


figure();
imshow(knee);
[y, x] = ginput(1);
x = round(x);
y = round(y);

visited = zeros(kneeSize);
segmented = zeros(kneeSize);
stack = zeros(10000, 2);

mV = kneeDouble(x,y);
nS = 1;
threshold = 60;



H = fspecial('gauss');
kneeDouble = imfilter(kneeDouble, H);

iStack = 1;
stack(1,:) = [x, y];
visited(x,y) = 1;
segmented(x,y) = 1;



while iStack > 0
    x = stack(iStack, 1);
    y = stack(iStack, 2);
    px = kneeDouble(x,y);
    iStack = iStack - 1;
    nS = nS + 1;
    mV = (mV * (nS-1) + px) / nS;
    
    for i = x-1:x+1
        for j = y-1:y+1
            
            if(i > 1 && j > 1 && i < kneeX && j < kneeY)
                
                neighborPx = kneeDouble(i,j);
                diff = abs(neighborPx - mV);
                if(diff < threshold && visited(i,j)==0)
                   iStack = iStack+1;
                   segmented(i,j)=1;
                   stack(iStack, :) = [i, j];
                end
            
            end
            visited(i,j) = 1;
        end
    end
    
    %kneeCopy(segmented > 0) = 255;
    %imshow(kneeCopy);
    %drawnow
end

figure();
imshow(segmented, []);
        
            