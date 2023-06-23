function new_X = task2(photo, pcs)
  [m, n] = size(photo);
  
  % Initialize the final matrix.
  new_X = zeros(m, n);
  
  % Convert the photo to the double data type.
  photo = double(photo);

  % Calculate the mean of each row.
  mu = mean(photo, 2);

  % Normalize the matrix by subtracting the row means.
  photo = photo - repmat(mu, 1, n);

  % Construct the matrix Z.
  Z = photo';

  % Calculate the SVD for matrix Z.
  [U, S, V] = svd(Z);

  % Construct the matrix W from the first pcs columns of V.
  W = V(:, 1:pcs);

  % Calculate the matrix Y.
  Y = W' * photo;

  % Approximate the original matrix.
  new_X = W * Y + repmat(mu, 1, n);

  % Convert the matrix to uint8 to obtain a valid image.
  new_X = uint8(new_X);
endfunction 

