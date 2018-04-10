function [ acc ] = teste( W, X, Y )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here ()
    m = size(X,1);
    saida = X*W';
    count = 0;
    for i = 1:m
        if isequal(binariza(saida(i,:)), Y(i,:))
            count = count + 1;
        end
        
    end
    
    acc = 100*(count/size(saida,1));
    

end

