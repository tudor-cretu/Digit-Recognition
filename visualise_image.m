function im = visualise_image(train_mat, number)
  % Initialize the final matrix.
  im = zeros(28, 28);
  
  % Read the row with the specified number from the training matrix.
  row = train_mat(number, :);

  % Transform the read row into a 28x28 matrix, which needs to be transposed.
  im = reshape(row, [28, 28])';
  
  % Convert the matrix to uint8 to form a valid image.
  im = uint8(im);

  % Display the image.
  imshow(im);
end
