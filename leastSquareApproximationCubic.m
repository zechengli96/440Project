function cubic_function = leastSquareApproximationCubic(X, Y)
    [~ , m] = size(X);

    S = zeros(7, 1); % summation of Xi^k from i = 1 to m - vector length 7
    b = zeros(4, 1); % summation of Yi * Xi ^k from i = 1 to m - vector length 4
    for k = 0: 6 
        for i = 1: m
            S(k+1) = S(k+1) + X(i)^k;
            if (k <= 3)
                b(k+1) = b(k+1) + Y(i) * X(i)^k;
            end
        end
    end
    
    A = zeros(4, 4);
    for i = 1: 4
        k = i;
        for j = 1: 4
            A(i, j) = S(k);
            k = k + 1;
        end
    end

    disp(A);
    disp(b);
    
    % create and solve a system of 4 linear equations using Gaussian elimination
    X = gaussianElimination(A, b);

    % Make a cubic function
    cubic_function = @(t) X(1) + X(2) * t + X(3) * t^2 + X(4) * t^3;
end

