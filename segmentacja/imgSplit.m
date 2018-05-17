function imgSplit(img, x1, y1, x2, y2)

global sLim;
global sTh;
global segRes;
global index;
global mRes;

img_chunk = img(y1:y2, x1:x2);
img_mean = mean(img_chunk(:));
img_std = std(img_chunk(:));

    if ((img_std < sTh) ||  (abs(y1-y2) <= sLim) || (abs(x1-x2) <= sLim) )
        segRes(y1:y2, x1:x2) = index;
        index = index+1;
        mRes(y1:y2, x1:x2) = img_mean;
    else
        newX = round((x1+x2)/2);
        newY = round((y1+y2)/2);
    
        imgSplit(img, x1, y1, newX, newY);
        imgSplit(img, newX + 1, y1, x2, newY);
        imgSplit(img, newX + 1, newY +1, x2, y2);
        imgSplit(img, x1, newY+1, newX, y2);
    end
end
    