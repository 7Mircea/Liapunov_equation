function verif_val_proprii_opuse(A)
% scriem daca avem valori proprii opuse sau nu
val_proprii = eig(A); % salvam valorile proprii ale lui A in val_proprii
n = length(A); % aflam dimensiunea lui A
ok = 1; %nu sunt val proprii opuse
% val_proprii
for i = 1 : n-1
    for j = i : n
        if (val_proprii(i) + val_proprii(j)) < 0.0001
            disp('Exista valori proprii opuse. Nu exista solutie unica.');
            ok = 0;
            i = n;
            break
        end
    end
    if ok == 0
        break
    end
end
if ok == 1
    disp('Nu exista valori proprii opuse. Exista solutie unica.');
end
end

