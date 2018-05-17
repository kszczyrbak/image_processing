function LUT( obraz, przekodowanie )

figure();
obraz_lut = intlut(obraz, przekodowanie);
subplot(2,2,1:2);
plot(przekodowanie);
title('Wykres przekodowania');
xlim([0 250]);
ylim([0 255]);
subplot(2,2,3);
imshow(obraz);
title('Original');
subplot(2,2,4);
imshow(obraz_lut);
title(inputname(2));

end

