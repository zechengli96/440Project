% Given input data
T = [
    2, 71;
    4, 69;
    9, 68;
    11, 66;
    16, 70;
    18, 68;
    23, 71;
    25, 75;
    30, 77;
];

max_error = 5;

% Call the piecewise_linear_approx function piecewise_function =
f = piecewise_linear_approx(T, max_error);

t = 10;
fprintf('value is %d\n', f(10));


