clc
% example from slide 6 - Larange Polynomial
X = [2, 2.75, 4];
Y = [0.5, 4/11, 0.25];
f = lagrangePolynomial(X, Y);

% Evaluate the Lagrange interpolating polynomial at x = 2.5
result = f(2.5);
disp(result);