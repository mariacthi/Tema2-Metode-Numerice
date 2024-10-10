function new_X = task2 (photo, pcs)
  [m n] = size(photo);

  % initializare matrice finala.
  new_X = zeros(m, n);

  % TODO: cast photo la double.
  A = double(photo);

  % TODO: normalizeaza matricea initiala scazand din ea media fiecarui rand.
  u = zeros(m, 1);
  for i = 1 : m
    u(i) = sum(A(i, :)) / n;
    A(i, :) = A(i, :) .- u(i);
  endfor

  % TODO: construieste matricea Z.
  Z = (1 / sqrt(n - 1)) * A';

  % TODO: calculeaza matricile U, S si V din SVD aplicat matricii Z
  [U, S, V] = svd(Z);

  % TODO: construieste matricea W din primele pcs coloane ale lui V
  W = V(:, 1 : pcs);

  % TODO: calculeaza matricea Y
  Y = W' * A;

  % TODO: aproximeaza matricea initiala
  A = W * Y + u;

  % TODO: transforma matricea in uint8 pentru a fi o imagine valida.
  new_X = uint8(A);

endfunction
