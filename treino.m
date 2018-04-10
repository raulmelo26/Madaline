function [ W ] = treino(W, X_treino, Y_treino, eta, n_epocas, n_atributos)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here ()

    m = size(X_treino,1);
    for j = 1: n_epocas
        dados = [X_treino Y_treino];
        dados = dados(randperm(m),:);
        X_treino = dados(:,1:n_atributos+1);
        Y_treino = dados(:,n_atributos+2:end);
        for i = 1: size(X_treino,1)
            erro = Y_treino(i,:) - binariza((X_treino(i,:)*W'));
            W = W +eta*erro'*X_treino(i,:);
        end
    end

end

