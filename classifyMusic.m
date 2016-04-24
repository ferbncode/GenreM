%% Initialization
clear ; close all; clc

%% Load Data

data = load('dataSet');
X = data(:, [1, 2]); y = data(:, 3);

fprintf(['Plotting data with + indicating (y = 1) examples and o ' ...
         'indicating (y = 0) examples.\n']);

plotData(X, y);

hold on;
% Labels and Legend
xlabel('Variance')
ylabel('Mean')

% Specified in plot order
legend('Classical', 'Metal')
hold off;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;



[m, n] = size(X);

X = [ones(m, 1) X];

initial_theta = zeros(n + 1, 1);

[cost, grad] = costFunction(initial_theta, X, y);

fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', grad);

fprintf('\nProgram paused. Press enter to continue.\n');
pause;



options = optimset('GradObj', 'on', 'MaxIter', 400);

[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);

plotDecisionBoundary(theta, X, y);

hold on;
xlabel('Variance')
ylabel('Mean')

legend('Classical', 'Metal')
hold off;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;


prob = sigmoid([1 -20.2274813694 9.10379315836] * theta);
fprintf(['For a music the prob is %f\n\n'], prob);



fprintf('\nProgram paused. Press enter to continue.\n');
pause;

