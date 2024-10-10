function new_X = task1 (photo, k)
  [m, n] = size (photo);

  % initializare matrice finala.
  new_X = zeros (m, n);

  % TODO: cast photo la double.
  A = double(photo);

  % TODO: aplica algoritmul SVD asupra photo.
  [U, S, V] = svd(A);
  V = V';

  % TODO: calculeaza noile matrici reduse U, S si V.
  U = U(:, 1 : k);
  S = S(1 : k, 1 : k);
  V = V(1 : k, :);

  % TODO: calculeaza new_X care este aproximarea matricii initiale photo,
  % folosindu-va de matricile calculate anterior.
  new_X = U * S * V;

  % TODO: transforma matricea in uint8 pentru a fi o imagine valida.
  new_X = uint8(new_X);

endfunction
