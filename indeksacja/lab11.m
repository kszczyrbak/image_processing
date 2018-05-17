clearvars;
clc;
close all;

img = imread('ccl1.png');
img_pre = img;
[YY, XX] = size(img);
L=1;
N=100;

id = 1:N;
for y = 2:(YY-1)
    for x = 2:(XX-1)
        if(img(y,x) ~= 0)
        
            sasiedzi = [img(y-1,x-1) img(y-1,x) img(y-1, x+1) img(y, x-1)];
            suma = sum(sasiedzi);
        
            if(suma == 0)
                img(y,x) = L;
                L=L+1;
            elseif ( suma > 0 )
                imgnonzero = nonzeros(sasiedzi);
                min_sasiedzi = min(imgnonzero);
                max_sasiedzi = max(imgnonzero);
                
                if(min_sasiedzi == max_sasiedzi)
                    img(y,x) = min_sasiedzi;
                else
                    img(y,x) = min_sasiedzi;
                    id = union(id, min_sasiedzi, max_sasiedzi);
                end
            end
        end
    end
end
imgResult = imread('ccl1Result.png');

figure();
subplot(1,2,1);
imshow(imgResult);
title('Expected');
subplot(1,2,2);
imshow(img, []);
title('Actual');


for i = 1:N
    lut(i) = root(id, i);
end

for x = 2:(XX-1)
    for y = 2:(YY-1)
        if img(y,x) > 0
            img(y,x) = lut(img(y,x));
        end
    end
end

figure();
subplot(1,2,1);
imshow(imgResult);
title('Expected');
subplot(1,2,2);
imshow(img, []);
title('Actual');

img2 = imread('ccl2.png');
figure();
subplot(2,2,1:2);
imshow(img2, []);
title('Original');
subplot(2,2,3);
imshow(bwlabel(img2, 4), []);
title('Bwlabel 4');
subplot(2,2,4);
imshow(bwlabel(img2, 8), []);
title('Bwlabel 8');