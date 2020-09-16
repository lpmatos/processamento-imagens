clear, clc, close all;

% ---- DESCRICAO QUANTICAZAO ----
% A quantizacao consiste em dividir e aproximar o valor da funcao para
% o nível de escala mais próximo, sendo por isso um processo irreversivel
% de destruicao de informacao.

peppers = 'peppers.png'
mansao = 'mansao.jpg'
cranio = 'cranio.png'

% ---- LENDO IMAGEM ----
img = imread(cranio);

% ---- SHOW IMAGEM ----
figure; imshow(img)

% ---- PHANTON IMAGE ----
P = phantom('Modified Shepp-Logan',300);

% ---- CONVERTE IMAGEM PARA DOUBLE ----
img = im2double(img);

% ---- OBTENDO INFORMACOES BASICAS DA IMAGEM ----
info = whos('img');
disp(info);

% ---- OBTENDO DIMENSOES DA IMAGEM ----
s = size(img);
disp(s);

% ---- OBTENDO MAIOR DIMENSAO DA IMAGEM ----
DimMax = max(s);
disp(DimMax);

% ---- NIVEL DA QUANTIZACAO ----
% b o numero de bits da quantizacao
% L o nivel de cinza
b = 2;
L = 2^b;

% ---- CONSTROI MATRIZ DE ZEROS ----
lim = zeros(1, L - 1)
disp(lim);

% ---- POPULA MATRIZ DE ZEROS ----
for i = 1 : L - 1
    lim(i) = i / L;
end
disp(lim);

% ---- LOOP PARA QUANTIZAR ----
for x = 1 : s(1)
    for y = 1 : length(img)
        apply = false;
        % ---- COMPARA MATRIZ DA IMAGEM COM A MATRIZ LIMIAR ----
        for i = 1 : L - 1
            if img(x, y) <= lim(i)
                img(x, y, :) = lim(i) - lim(1);
                img(x, y, 1);
                apply = true;
                break
            end
        end
        if apply == false
            img(x, y, :) = 1;
        end
    end
end

% ---- SHOW IMAGEM ----
figure; imshow(img)
