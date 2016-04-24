%% Initialization
clear ; close all; clc

%% Load Data

data = load('dataSet');
X = data(:, [1, 2]); y = data(:, 3);


[m, n] = size(X);

X = [ones(m, 1) X];

initial_theta = zeros(n + 1, 1);
[cost, grad] = costFunction(initial_theta, X, y);
options = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);


testData = load('testData');
test1= testData(1);
test2 = testData(2);
prob = sigmoid([1 test1 test2] * theta);
fprintf("%f", prob);
