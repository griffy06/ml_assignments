function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 50;
sigma = 0.12;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
predictions = svmPredict(model, Xval);
error = mean(double(predictions ~= yval));


a = [0.01,0.03,0.1,0.3,1,3,10,30];
b = [0.01,0.03,0.1,0.3,1,3,10,30];

for i=1:8
  for j=1:8
      
    model= svmTrain(X, y, a(1,i), @(x1, x2) gaussianKernel(x1, x2, b(1,j)));
    predictions = svmPredict(model, Xval);
    error2 = mean(double(predictions ~= yval));
    if error2<error
    error = error2;
    C=a(1,i);
    sigma=b(1,j);
    end
    end
end


% =========================================================================

end
