clear, clc, close all;

% ---- FATIAMENTO EM PLANOS DE BITS ----
% Basicamente o fatiamento de planos de bits consiste em dar
% ênfase a transformação de bits específicos para contribuir com 
% a aparência final da imagem.

% ---- IMAGENS ----
phanton = 'phanton.png'
natureza = 'natureza.png'

% ---- LENDO IMAGEM ----
img = imread(phanton);

% ---- EXIBE IMAGEM ----
figure; imshow(img)

% ---- PLANOS E CONTROLE ----
planos = 8
controle = planos

% ---- OBTENDO INFORMACOES BASICAS DA IMAGEM ----
info = whos('img');
disp(info);

% ---- CONVERTE RGB TO GRAY - PEGA IMAGEM E PRETO/BRANCO ----
gray = rgb2gray(img);       

% ---- PEGANDO AS DIMENSOES - ALTURA E LARGURA - DA IMAGEM ----
[altura, largura]= size(gray);       

% ---- ALOCA MATRIZ DE ZEROS COM BASE NOS OITO PLANOS DE BIT ---- 
zeros = zeros(altura, largura, planos); 

% ---- ITERA SOBRE OS OITO PLANOS ----
% ITERA SOBRE AS DIMENSOES DA IMAGEM.
% PEGA O BIT DE CADA PIXEL.
%
for k = 1:planos
  for i = 1:altura                 
    for j = 1:largura 
      zeros(i, j, k) = bitget(gray(i,j), k); 
    end
  end
end

% ---- EXIBINDO RESULTADO PARA CADA PLANO DE BIT ----
figure('Name', 'Fatiamento em planos de bits'); 
for i = 1:planos
  subplot(3,3,i); imshow(zeros(:,:,controle)); title(strcat(int2str(i),"th Plano de Bit"));
  controle = controle - 1
end

% ---- EXIBE IMAGEM ----
subplot(3,3,9); imshow(gray); title("Original Image");
