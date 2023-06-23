function new_X = task3(photo, pcs)
  [m, n] = size(photo);
  
  % Initialize the final matrix.
  new_X = zeros(m, n);
  
  % Convert the photo to the double data type.
  photo = double(photo);

  % Calculate the mean of each row of the matrix.
  mu = mean(photo, 2);

  % Normalize the original matrix by subtracting the mean of each row.
  photo = photo - repmat(mu, 1, n);

  % Calculate the covariance matrix.
  cov_matrix = photo * photo' / (n - 1);

  % Calculate the eigenvectors and eigenvalues of the covariance matrix.
  [V, D] = eig(cov_matrix);

  % Sort the eigenvalues in descending order and create the matrix V formed by
  % the eigenvectors arranged as columns.
  [~, indices] = sort(diag(D), 'descend');
  V = V(:, indices);

  % Keep only the first pcs columns of the matrix V.
  W = V(:, 1:pcs);

  % Calculate the matrix Y.
  Y = W' * photo;

  % Calculate the matrix new_X, which is an approximation of the original matrix.
  new_X = W * Y + repmat(mu, 1, n);

  % Convert the matrix to uint8 to obtain a valid image.
  new_X = uint8(new_X);
endfunction
