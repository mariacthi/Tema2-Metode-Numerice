function [train, miu, Y, Vk] = magic_with_pca (train_mat, pcs)
  [m, n] = size (train_mat);

  % initializare train
  train = zeros (m, n);

  % initializare miu
  miu = zeros (1, n);

  % initializare Y
  Y = zeros (m, pcs);

  % initializare Vk
  Vk = zeros (n, pcs);

  % TODO: cast train_mat la double.
  train_mat = double(train_mat);

  % TODO: calculeaza media fiecarei coloane a matricii.
  % TODO: scade media din matricea initiala.
  for j = 1 : n
    miu(j) = sum(train_mat(:, j)) / m;
    train_mat(:, j) = train_mat(:, j) .- miu(j);
  endfor

  % TODO: calculeaza matricea de covarianta.
  cov_mat = train_mat' * train_mat / (m - 1);

  % TODO: calculeaza vectorii si valorile proprii ale matricei de covarianta.
  % HINT: functia eig
  [V S] = eig(cov_mat);

  % TODO: ordoneaza descrescator valorile proprii si creaza o matrice V
  % formata din vectorii proprii asezati pe coloane, astfel incat prima coloana
  % sa fie vectorul propriu corespunzator celei mai mari valori proprii si
  % asa mai departe.
  [value, index] = sort(diag(S), 'descend');
  sorted_vectors = V(:, index);

  V = sorted_vectors;

  % TODO: pastreaza doar primele pcs coloane din matricea obtinuta anterior.
  Vk = V(:, 1 : pcs);

  % TODO: creaza matricea Y schimband baza matricii initiale.
  Y = train_mat * Vk;

  % TODO: calculeaza matricea train care este o aproximatie a matricii initiale
  % folosindu-va de matricea Vk calculata anterior
  train = Y * Vk';
endfunction
