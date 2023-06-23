function prediction = KNN(labels, Y, test, k)
  % Initialize prediction
  prediction = -1;
  
  % Initialize distances
  [m, n] = size(Y);
  distance = zeros(m, 1);
  
  % Calculate the Euclidean distance between each row and the test vector
  for i = 1:m
    distance(i) = norm(Y(i, :) - test);
  end
  
  % Sort distances in ascending order and keep track of the indices
  [~, indices] = sort(distance);
  
  % Get the labels of the k nearest neighbors
  nearest_labels = labels(indices(1:k));
  
  % Calculate the prediction as the mode of the nearest_labels
  prediction = mode(nearest_labels);
end

