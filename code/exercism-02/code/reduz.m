clear, clc, close all;

% ---- IMAGENS ----

peppers = 'peppers.png'
mansao = 'mansao.jpg'
cranio = 'cranio.png'
vaca = 'vaquinha.jpg'

% ---- LENDO IMAGEM ----
img = imread(mansao);

% ---- INTENSIDADE DO RUIDO ----
intensidade = 0.2

% ---- EXIBE IMAGEM ----
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
gray = double(rgb2gray(img)) / 255;

% ---- EXIBE IMAGEM ----
figure; imshow(gray)

% ---- CRIANDO MATRIZ DE ZEROS MATRIZ COM BASE NAS DIMENSOES DA IMAGEM ----
media = double(zeros(s(1), s(2)));

% ---- APLICANDO RUIDO NA IMAGEM RUIDO ----
% A funcao randn cria uma matriz aleatoria dado um intervalo
media = media + gray + intensidade * randn(s(1), s(2));

% ---- EXIBE IMAGEM ----
figure; imshow(media)
