function prediction = KNN (labels, Y, test, k)
  % initializeaza prediction
  prediction = -1;

  % initializeaza distantele
  [m, n] = size (Y);
  distance = zeros (m, 1);

  % TODO: pentru fiecare rand calculati distanta Euclidiana dintre acesta si
  % vectorul de test primit ca argument.
  for i = 1 : m
    distance(i) = norm(Y(i, :) - test);
  endfor

  % TODO: ordonati crescator distantele si tineti minte intr-un vector primele
  % k valori care reprezinta valorile adevarate ale acestor imagini care s-au
  % dovedit a fi cele mai apropiate.
  % Hint [~,aux] = sort (...)
  [~, aux] = sort(distance);
  distance = labels(aux(1 : k));

  % TODO: calculati predictia ca mediana celor k valori cele mai apropiate.
  prediction = median(distance);
endfunction
