% This file contains the model for linear regression with equation
% COLUMNS : 'Rooms', 'Price','Bathroom', 'Landsize'

data = dlmread('../data/hs.csv');
x = data(:,4);
y = data(:,2);
plot(x, y, 'rx');

