data =[ 88.6 20; 71.6 16; 93.3 19.8; 84.3 18.4; 80.6 17.1; 75.2 15.5; 69.7 14.7; 82 17.1; 69.4 15.4; 83.3 16.3; 79.6 15; 82.6 17.2;80.6 16;83.5 17; 76.3 14.4]

x = data(:,2);
y = data(:,1);

function plotData(x,y)
  plot(x,y,'rx','MarkerSize',8);
end;
grid on
plotData(x,y)
xlabel('Rate of cricket chriping')
ylabel('Temperature in Degrees (F)')
fprintf('Program Paused, press any key to continue')
%pause
% Count how many data points we have
m = length(x);
% Add a column of all ones (intercept term) to x
X = [ones(m, 1) x];
% Calculate theta
theta = (pinv(X'*X))*X'*y;
% Plot the fitted equation we got from the regression
hold on; % this keeps our previous plot of the training data visible

plot(X(:,2), X*theta, '-');
legend('Training data', 'Linear regression');
hold off % Don't put any more plots on this figure
