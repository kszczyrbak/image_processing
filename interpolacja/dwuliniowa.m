%% cleanup

clearvars;
close all;
clc;

%%figure1
figure(1);
oldImage = imread('chessboard.bmp');
imshow(oldImage);

%%dwuliniowa
xReScale = 1.5;
yReScale = 1.5;

[YY, XX] = size(oldImage);

newYY = round(YY*yReScale);
newXX = round(XX*xReScale);

newImage = double(zeros(newYY, newXX));

xStep = XX/newXX;
yStep = YY/newYY;

for jj = 0:(newYY-1)
    for ii = 0:(newXX-1)
        i = floor(ii*xStep);
        j = floor(jj*yStep);
        
        if(j > YY-1) 
            j = YY-1;
        end;
        
        if(j < 1)
            j = 1;
        end;
        if(i < 1)
            i = 1;
        end;
        if(i > XX-1)
            i = XX-1;
        end;
        
       A = double(oldImage(j, i));
       B = double(oldImage(j, i + 1));
       C = double(oldImage(j + 1, i + 1));
       D = double(oldImage(j + 1, i));
            
       i = ii*xStep-i;
       j = jj*yStep-j;
       % i,j naleza do [0,1];
       
       M1 = [1-j j];
       M2 = [A D; B C];
       M3 = [1-i; i];
       
      
       
        newImage(jj+1, ii+1) = M1*M2*M3;
    end
end

figure(2);
imshow(uint8(newImage));