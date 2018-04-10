clc; clear;

fprintf('+------------------------------------------------------------------------+\n');
fprintf('|                            PERCEPTRON DE UMA CAMADA                    |\n');
fprintf('|                     Acadêmico: Raul Gabriel Carvalho de Melo           |\n');
fprintf('|                                IFCE - Maracanaú                        |\n');
fprintf('+------------------------------------------------------------------------+\n');

dados = load('C:\Users\Raul Melo\Documents\Madaline\dataIris.dat');

dados = [normaliza(dados(:,1:4)) dados(:,5:7)];

%% VARIÁVEIS INICIAIS
% NÚMERO DE REALIZAÇÕES, TAXA DE APRENDIZAGEM E NÚMERO DE ÉPOCAS
realizacoes = 20;
eta = 0.1;
n_epocas = 350;

n_neurons = 3;
n_atributos = 4;
m = size(dados,1);
%%
for i = 1 : realizacoes
    % EMBARALHA OS DADOS
    dados = dados(randperm(m),:);
    
    W = rand(n_neurons,(n_atributos + 1))-0.5;
    
    [X_treino, Y_treino, X_teste, Y_teste] = separaDados(dados, n_atributos, n_neurons, 0.8);
    % ADICIONA O BIAS
    X_treino = [-ones(size(X_treino,1),1) X_treino];
    X_teste = [-ones(size(X_teste,1),1) X_teste];

    % TREINA A REDE COM QUANTIDADE X DE ÉPOCAS
    [W] = treino(W, X_treino, Y_treino, eta, n_epocas, n_atributos);
    
    acertos(i) = teste(W, X_teste, Y_teste);


end

acc_media = mean(acertos)
desvio_padrao = std(acertos)