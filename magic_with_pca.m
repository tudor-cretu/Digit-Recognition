function [train, miu, Y, Vk] = magic_with_pca(train_mat, pcs)
  [m, n] = size(train_mat);
  
  % Initialize train matrix.
  train = zeros(m, n);
  
  % Initialize miu.
  miu = zeros(1, n);
  
  % Initialize Y.
  Y = zeros(m, pcs);
  
  % Initialize Vk.
  Vk = zeros(n, pcs);
  
  % Convert train_mat to the double data type.
  train_mat = double(train_mat);

  % Calculate the mean of each column of the matrix.
  miu = mean(train_mat);

  % Subtract the mean from the original matrix.
  train_mat = train_mat - miu;

  % Calculate the covariance matrix.
  cov_matrix = (train_mat' * train_mat) / (m - 1);

  % Calculate the eigenvectors and eigenvalues of the covariance matrix.
  [V, D] = eig(cov_matrix);

  % Sort the eigenvalues in descending order and create the matrix Vk formed by the eigenvectors arranged as columns.
  [~, indices] = sort(diag(D), 'descend');
  V = V(:, indices);

  % Keep only the first pcs columns from the Vk matrix.
  Vk = V(:, 1:pcs);

  % Create the matrix Y by changing the basis of the original matrix.
  Y = train_mat * Vk;

  % Calculate the train matrix, which is an approximation of the original matrix using the previously calculated Vk matrix.
  train = Y * Vk';
endfunction
