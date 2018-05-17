clearvars;
close all;
clc;

load funkcjeLUT;

lena_bmp = imread('lena.bmp');

LUT(lena_bmp, kwadratowa);

LUT(lena_bmp, log);

LUT(lena_bmp, odwlog);

LUT(lena_bmp, odwrotna);

LUT(lena_bmp, pierwiastkowa);

LUT(lena_bmp, pila);

LUT(lena_bmp, wykladnicza);