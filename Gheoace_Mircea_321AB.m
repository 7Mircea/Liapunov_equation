clc
clear all;
n = 6;  % dimensiune matrice patratica
A = rand(n); % generam o matrice aleatoare patratice cu dimensiune n
verif_val_proprii_opuse(A); % acest rand verifica daca exista valori proprii
% opuse, pentru a verifica unicitate solutiei
C = rand(n); % generam o matrice aleatoare patratice cu dimensiune n
C = tril(C) + tril(C)';
%%%%%%%%%%%%%%%%%%%%%%%%%
%  pentru a face o matrice simetrica obtinem mai intai una generala
%  apoi extragem partea inferioara si o adunam cu partea inferiora 
%  transpusa
%%%%%%%%%%%%%%%%%%%%%%%%%
X = sol(A, C);  % aici calculam X care satisface ecuatia Liapunov continua
C_verif = A' * X + X * A; % calculam pe C corespunzator rezultatului X 
% calculat de noi
norm(C - C_verif) % printam eroarea dintre ce trebuia sa fie si ce am 
% obtinut