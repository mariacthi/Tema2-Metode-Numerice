function im = visualise_image (train_mat, number)
  % initializare matrice finala.
  im = zeros (28, 28);

  % TODO: citeste din matricea de antrenament linia cu numarul number.
  line = train_mat(number, :);

  % TODO: transforma linia citita intr-o matrice 28x28 care trebuie apoi
  % transpusa.
  % HINT: functia reshape
  line = reshape(line, 28, 28);
  line = line';

  % TODO: transforma matricea in uint8 pentru a fi o imagine valida.
  im = uint8(line);

endfunction
