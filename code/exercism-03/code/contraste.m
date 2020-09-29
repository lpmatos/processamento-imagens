clear, clc, close all;

% ---- CORRECAO CONSTRASTE ----
% Corrigir o contraste ajuda a enxergar detalhes de uma imagem que estavam
% escondidos num primeiro momento. Essa técnica verifica quais são os
% máximos e mínimos de uma imagem e redefine a nova imagem a partir desses
% valores, aumentando ou diminuindo as cores que tínhamos anteriormente.
% 

% ---- IMAGENS ----
peppers = 'peppers.png'
mulher = 'mulher.png'

% ---- LENDO IMAGEM ----
img = imread(mulher);

% ---- ITERACOES E GAMA ----
% A operação de Gamma correction visa alterar ao mesmo tempo o contraste e o brilho. 
% Gamma pode assumir basicamente 3 valores, = 1, < 1 e > 1.
% Quando o valor de gamma é igual a 1, não temos alteração. 
% Quando o valor de gamma é < 1 temos maior contraste e menos brilho. 
% Quando o valor é > 1 temos mais brilho e menos contraste.
iteracoes = 2
gama = 1.5

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

% ---- CONVERTE MATRIX PARA GRAYSCALE IMAGE ----
gray = mat2gray(img);

% ---- EXIBE IMAGEM ----
figure; imshow(gray);

% ---- APLICA CONTRASTE ----
result = gray.^ gama;

% ---- EXIBE IMAGEM ----
subplot(3,3,1); imshow(gray); title("Original Image");
subplot(3,3,2); imshow(result); title("Contraste");
