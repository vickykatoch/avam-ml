% scaled features.
% x = square feet
% y = sale price
x = [1, 2, 4];
y = [2, 2.5,  3];

% function to calculate the predicted value
function result = h(x, t0, t1)
  result = t0 + t1 * x;
end

% given a theta_0 and theta_1, this function calculates
% their cost. We don't need this function, strictly speaking...
% but it is nice to print out the costs as gradient descent iterates.
% We should see the cost go down every time the values of theta get updated.
function distance = cost(theta_0, theta_1, x, y)
  distance = 0;
  for i = 1:length(x) % arrays in octave are indexed starting at 1
    square_feet = x(i);
    predicted_value = theta_0 + theta_1 * square_feet;
    actual_value = y(i);
    % how far off was the predicted value (make sure you get the absolute value)?
    distance = distance + abs(actual_value - predicted_value);
  end
  % get how far off we were on average
  distance = distance / length(x);
end

alpha = 0.1;
iters = 1500;
m = length(x);

% initial values
theta_0 = 0;
theta_1 = 0;

for i = 1:iters
  % we store this calculation in temporary variables,
  % because theta_0 and theta_1 must be updated *together*.
  % i.e. we can't update theta_0 and use the new theta_0 value
  % while updating theta_1.
  cost_0 = 0;
  for j = 1:m
    cost_0 += (h(x(j), theta_0, theta_1) - y(j));
  end
  temp_0 = theta_0 - alpha * 1/m * cost_0;

  cost_1 = 0;
  for j = 1:m
    cost_1 += ((h(x(j), theta_0, theta_1) - y(j)) * x(j));
  end
  temp_1 = theta_1 - alpha * 1/m * cost_1;

  theta_0 = temp_0;
  
  theta_1 = temp_1;

  % print out the new values of theta for each iteration,
  % as well as the new, lower cost
  disp([theta_0, theta_1, cost(theta_0, theta_1, x, y)]);
end

% scale the values of theta, they
% were too small because we did feature scaling
theta_0 = theta_0 * 100000;
theta_1 *= 100;

% un-scale the features. So now we should be
% back to [1000, 2000, 4000] for square feet,
% from [1, 2, 4].
x *= 1000;
y *= 100000;

% plot the data and the best-fit line
figure;
% set (0,'defaultaxesposition', [0.15, 0.1, 0.7, 0.7]);

set (0,'defaultaxesposition', [0.15, 0.1, 0.7, 0.7]);

plot(x, y, 'rx');
hold on;
plot(1000:4000, h(1000:4000, theta_0, theta_1));

% tell me how much to sell a 3000 square foot home for:
disp(h(3000, theta_0, theta_1));
