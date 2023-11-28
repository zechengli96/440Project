% Lagrange Interpolating Polynomial Function
function lagrange_polynomial = lagrangePolynomial(X, Y)
    n = length(X);
    lagrange_polynomial = @(x) 0;
    for i = 1:n
        product = @(x) Y(i);
        for j = 1:n
            if i ~= j
                product = @(x) product(x) * (x - X(j)) / (X(i) - X(j));
            end
        end 
        lagrange_polynomial = @(x) lagrange_polynomial(x) + product(x);
    end
end
