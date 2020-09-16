clear, clc, close all;

% ---- APLICANDO RUIDO ----

peppers = 'peppers.png'
mansao = 'mansao.jpg'
cranio = 'cranio.png'
vaca = 'vaquinha.jpg'

% ---- LENDO IMAGEM ----
img = imread(mansao);

% ---- INTENSIDADE RUIDO ----
i = 0.2

% ---- EXIBE ----
figure; imshow(img)

% ---- OBTENDO INFORMACOES BASICAS DA IMAGEM ----
info = whos('img');
disp(info);

% ---- OBTENDO DIMENSOES DA IMAGEM ----
s = size(img);
disp(s);

% ---- OBTENDO MAIOR DIMENSAO DA IMAGEM ----
DimMax = max(s);
disp(DimMax);

% ---- CONVERTE RGB TO GRAY E RETORNA O VALOR EM DOUBLE ----
img = double(rgb2gray(img)) / 255;

% ---- EXIBE ----
figure; imshow(img)

% ---- FAZENDO A MATRIZ MEDIA ----
media = double(zeros(s(1), s(2)));

% ---- APLICA RUIDO ----
% Function randn - Cria uma matriz aleatoria dado o intervalo
media = media + img + i * randn(s(1), s(2));

% ---- EXIBE ----
figure; imshow(media)
