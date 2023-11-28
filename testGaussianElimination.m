clc

% example from homework 2
A = [0.001, 2, 3; 0, 3, 0; 2, -4, 2];
b = [10; 6; 0];

X = gaussianElimination(A, b);

disp(X)
