function new_X = task3 (photo, pcs)
  [m, n] = size (photo);

  % initializare matrice finala.
  new_X = zeros (m, n);

  % TODO: cast photo la double.
  A = double(photo);

  % TODO: calculeaza media fiecarui rand al matricii.
  % TODO: normalizeaza matricea initiala scazand din ea media fiecarui rand.
  u = zeros(m, 1);
  for i = 1 : m
    u(i) = sum(A(i, :)) / n;
    A(i, :) = A(i, :) .- u(i);
  endfor

  % TODO: calculeaza matricea de covarianta.
  Z = A * A' * (1 / (n - 1));

  % TODO: calculeaza vectorii si valorile proprii ale matricei de covarianta.
  % HINT: functia eig
  [V S] = eig(Z);

  % TODO: ordoneaza descrescator valorile proprii si creaza o matrice V
  % formata din vectorii proprii asezati pe coloane, astfel incat prima coloana
  % sa fie vectorul propriu corespunzator celei mai mari valori proprii si
  % asa mai departe.
  [value, index] = sort(diag(S), 'descend');
  sorted_vectors = V(:, index);

  V = sorted_vectors;

  % TODO: pastreaza doar primele pcs coloane
  % OBS: primele coloane din V reprezinta componentele principale si
  % pastrandu-le doar pe cele mai importante obtinem astfel o compresie buna
  % a datelor. Cu cat crestem numarul de componente principale claritatea
  % imaginii creste, dar de la un numar incolo diferenta nu poate fi sesizata
  % de ochiul uman asa ca pot fi eliminate.
  W = V(:, 1 : pcs);

  % TODO: creaza matricea Y schimband baza matricii initiale.
  Y = W' * A;

  % TODO: calculeaza matricea new_X care este o aproximatie a matricii initiale
  new_X = W * Y;

  % TODO: aduna media randurilor scazuta anterior.
  new_X += u;

  % TODO: transforma matricea in uint8 pentru a fi o imagine valida.
  new_X = uint8(new_X);
endfunction
