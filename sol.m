function [X] = sol(A,C)
% aflam solutia ecuatiei Liapunov continue
n = length(A);%numar de linii sau de coloane ale matricii A
[U, S] = schur(A, 'complex');% A = U * S * U', unde U este tranpusa hermitic
C = U' * C * U; % operatorul ' in acest caz transpune matricea careia i se 
%aplica si o conjuga complex
Y = eye(n); % initializam pe Y pentru viteza
for j = 1 : n % j reprezinta coloana pe care o calculam din Y
    if j > 1
        for k = 1 : j-1
            C(:, j) = C(:, j) - S(k, j) * Y(:, k);
%             din coloana j a matricii C scadem coloanele de la 1 la j-1
%             ale matricii Y inmultite cu elementrul de pe pozitia(k,j)
%             a formei Schur complexe a matricii A
        end
    end
    Y(:,j) = s_inf_tr(S' + S(j,j) * eye(n), C(:,j));
%     rezolvam sistemul inferior triunghiular (S' + S(j,j) * eye(n) ) = C(:,j)
%     unde S' reprezinta forma Schur conjugata hermitic
%     S(j,j) este elemntul de pe pozitia (j,j)
%     eye(n) este matricea unitate de dimensiune n
%     C(:, j) este coloana j din matricea C
end
X = real(U * Y * U'); % extragem partea real?
end

