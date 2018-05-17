clearvars;
close all;
clc;

global index;
global sTh;
global sLim;
global segRes;
global mRes;

umbrella = imread('umbrella.png');

figure();
imshow(umbrella);

umbrellaHsv = rgb2hsv(umbrella);
umbrellaHsv = double(umbrellaHsv);

umbrellaH = umbrellaHsv(:,:,1);
[Y, X] = size(umbrellaH);

sTh = 0.05;
cTh = 5/255;
sizeTh = 40;

index = -1;
sLim = 8;
segRes = zeros(Y, X);
mRes = zeros(Y, X);

imgSplit(umbrellaH, 1, 1, X, Y);


i = 0;
while(i <= index)
   IB = segRes == i;
   if any(IB(:))
      [yF, xF] = find(IB, 1, 'first');
      SE = strel('square',3);
      IBDilate = imdilate(IB, SE);
      IBDiff = abs(IB -IBDilate);
      IBMult = IBDiff .* segRes;
      IBNonZero = nonzeros(IBMult);
      IBUnique = unique(IBNonZero);
      
      flag = 0;
      
      for j = 1:numel(IBUnique)
         sIB = segRes == IBUnique(j);
         [sYF, sXF] = find(sIB, 1, 'first');
         if(abs(mRes(yF, xF) - mRes(sYF, sXF)) < cTh)
             segRes(sIB) = i;
             flag = 1;
         end
      end
      
      if(flag == 0)
        i = i+1;
      end
      
   else
       i = i+1;
   end
end

figure();
subplot(1,2,1);
imshow(segRes, []);
subplot(1,2,2);
imshow(mRes, []);

U = unique(segRes);
for i = 1 : numel(U)
    chunk = segRes == U(i);
    if sum(chunk) < sizeTh
        segRes(chunk) = 0;
    end
end

figure();
subplot(1,2,1);
imshow(segRes, []);
subplot(1,2,2);
imshow(mRes, []);

U2 = unique(segRes);
for i = 1 : numel(U2) 
    mask = segRes == U2(i);
    segRes(mask) = i;
end

figure();
subplot(1,2,1);
imshow(segRes, []);
subplot(1,2,2);
imshow(mRes, []);
    
final = label2rgb(segRes);

figure();
imshow(final);