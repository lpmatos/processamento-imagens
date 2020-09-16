clear, clc, close all;

peppers = 'peppers.png'
mansao = 'mansao.jpg'
cranio = 'cranio.png'

% ---- LENDO IMAGEM ----
img = imread(cranio);

% ---- SHOW IMAGEM ----
figure; imshow(img)

% ---- PHANTON IMAGE ----
P = phantom('Modified Shepp-Logan',300);

% ---- OBTENDO INFORMACOES BASICAS DA IMAGEM ----
info = whos('img');
disp(info);

% ---- OBTENDO DIMENSOES DA IMAGEM ----
s = size(img);
disp(s);

% ---- OBTENDO MAIOR DIMENSAO DA IMAGEM ----
DimMax = max(s);
disp(DimMax);

% ---- ESCALAS ----
X = 2;
Y = 2;

% ---- CONSTROI MATRIZ DE ZEROS ----
imgDilatada = uint8(zeros(s(1) * X, s(2) * Y, 3));

% ---- DILATACAO ----
for y = 1 : s(1)
    for x = 1 : s(2)
        for copyX     = (y - 1) * X + 1 : y * Y + 1
            for copyY = (x - 1) * Y + 1 : x * X + 1
                imgDilatada(copyX, copyY, :) = img(y, x, :);
            end
        end
    end
end

% ---- SHOW IMAGEM ----
figure; imshow(imgDilatada)
