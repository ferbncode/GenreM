function [J, grad] = costFunction(theta, X, y)
m = length(y); % number of training examples

J = 0;
grad = zeros(size(theta));


z = X*theta;
prediction = sigmoid(z);
J = -sum(y.*(log(prediction)) + (1-y).*log(1-prediction))/m;

%% CALCULATION OF INITIAL GRADIENT %%

error = prediction - y;

for i=1:length(theta),

	grad(i) = sum(error.*X(:,i))/m;
endfor

return

end
