function sir = prepare_photo (im)
  %initializare sirul final.
  sir = zeros (1, 784);

  % TODO: inverseaza pixelii imaginii im.
  max_value = max(im(:));
  im = max_value - im;

  % TODO: transpune imaginea, iar apoi transforma imaginea intr-un vector linie.
  % HINT: functia reshape
  im = im';
  sir = reshape(im, 1, 784);
endfunction
