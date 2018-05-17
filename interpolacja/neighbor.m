%% cleanup

clearvars;
close all;
clc;

%%
figure(1);
oldImage = imread('lena.bmp');
imshow(oldImage);

%%
xReScale = 1.5;
yReScale = 1.5;

[YY, XX] = size(oldImage);

newYY = round(YY*yReScale);
newXX = round(XX*xReScale);

newImage = uint8(zeros(newYY, newXX));

xStep = XX/newXX;
yStep = YY/newYY;

for ii = 0:(newXX-1)
    for jj = 0:(newYY-1)
        i = round(ii*xStep);
        j = round(jj*xStep);
        
        if(i > XX-1) 
            i = XX-1;
        end;
        if(j > YY-1)
            j = YY-1;
        end;
        
        
        newImage(jj+1, ii+1) = oldImage(j+1, i+1);
    end
end

figure(2);
imshow(newImage);