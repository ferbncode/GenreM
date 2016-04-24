function g = sigmoid(z)
g = zeros(size(z));
prediction = rdivide(1,(1 + exp(-1*(z))));
g = prediction;
end
