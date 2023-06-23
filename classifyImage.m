function prediction = classifyImage(im, train_mat, train_val, pcs)
  % Initializing prediction
  prediction = -1;
  
  % im cast to double
  im = double(im);
  
  % Applying magic_with_pca setului to the train set
  [train, miu, Y, Vk] = magic_with_pca(train_mat, pcs);
  
  % Subtracts from the vector of images the median of each column of the train matrix
  im = im - miu;
  
  % Changing the base by multypling with Vk 
  im = im * Vk;
  
  % Calculating prediction with KNN
  prediction = KNN(train_val, Y, im, 5);
endfunction