function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

c_vals = [0.01;0.03;0.1;0.3;1;3;10;30];
sig_vals = [0.01;0.03;0.1;0.3;1;3;10;30];
min = 10000000000;
poss_c = 0;
poss_sig = 0;
for i = 1:length(c_vals)
  for j = 1:length(sig_vals)
    c = c_vals(i);
    sig = sig_vals(j);
    model = svmTrain(X,y,c,@(x1,x2)gaussianKernel(x1,x2,sig));
    predictions = svmPredict(model,Xval);
    class_err = mean(double(predictions ~= yval));
    if (class_err < min)
      min = class_err;
      poss_c = c;
      poss_sig = sig;
     endif
  end
  
end

      
    
  

% You need to return the following variables correctly.
C = poss_c;
sigma = poss_sig;

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







% =========================================================================

end
