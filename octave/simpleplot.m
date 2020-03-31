d = [1 1; 2 2; 3 3]
clf;
grid on;
axis([0, 4, 0, 4],"square");
axis("tic[xy]","on");
scatter(d(:,1), d(:,2), "r", "s", "filled");