function [b] = s_inf_tr(A,b)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
n = length(A);%merge pentru A patratica
for k = 1 : n
    for j = 1 : k-1
        b(k) = b(k) - A(k, j)*b(j);
    end
    b(k) = b(k) / A(k, k);
end
end

