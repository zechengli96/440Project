clc
X = [0, 0.25, 0.50, 0.75, 1.00];
Y = [1.0000, 1.2840, 1.6487, 2.1170, 2.7183];

cubic_function = leastSquareApproximationCubic(X, Y);
disp(cubic_function);