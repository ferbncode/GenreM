function plotData(X, y)
figure; hold on;

pos = find(y==0);
neg = find(y==1);
plot(X(pos, 1), X(pos, 2), 'k+','LineWidth', 2,'MarkerSize', 7);
plot(X(neg, 1), X(neg, 2), 'yo', 'LineWidth',2, 'MarkerSize', 7);

hold off;

end
