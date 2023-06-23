function new_X = task1(photo, k)
  [m, n] = size(photo);
  
  % Convert the photo to the double data type.
  photo = double(photo);
  
  % Apply the SVD algorithm to the photo.
  [U, S, V] = svd(photo);
  
  % Reduce the matrices U, S, and V to the first k singular values.
  U_k = U(:, 1:k);
  S_k = S(1:k, 1:k);
  V_k = V(:, 1:k);
  
  % Calculate the new approximate matrix new_X using the reduced matrices U_k, S_k, and V_k.
  new_X = U_k * S_k * V_k';
  
  % Convert the matrix to uint8 to obtain a valid image.
  new_X = uint8(new_X);
endfunction
