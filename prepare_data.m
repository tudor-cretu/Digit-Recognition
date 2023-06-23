function [train_mat, train_val] = prepare_data(name, no_train_images)
  n = 784;
  
  % Initializing the train matrix.
  train_mat = zeros(no_train_images, n);
  
  % Initializing the train vector.
  train_val = zeros(1, no_train_images);
  
  % Loads the data from the table given as an argument.
  data = load(name);
  
  % Save the first no_train_images rows from the training image table into the train_mat matrix.
  train_mat = data.trainX(1:no_train_images, :);
  
  % Save the first no_train_images values from the label vector into the train_val vector.
  train_val = data.trainY(1:no_train_images);
end
