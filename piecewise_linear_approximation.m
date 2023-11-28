function piecewise_function = piecewise_linear_approx(T, max_error)
    begin = T(1, :);
    S_lower = -Inf;
    S_upper = Inf;

    fprintf('The algorithm works as follows. The initialization sets Begin := (%.4f, %.4f), Sl := -inf and Su := +inf.\n', begin(1), begin(2));

    for i = 1:(size(T, 1) - 1)
        S_lower_prime = max(S_lower, slope(begin, [T(i+1, 1), T(i+1, 2) - max_error]));
        S_upper_prime = min(S_upper, slope(begin, [T(i+1, 1), T(i+1, 2) + max_error]));

        fprintf('\ni = %d\n', i);
        fprintf('Sl'' := max(%.4f, ((%.4f - %.4f) - %.4f) / (%.4f - %.4f)) = max(%.4f, %.4f) = %.4f\n', S_lower, T(i + 1, 2), max_error, begin(2), T(i + 1, 1), begin(1), S_lower, S_lower_prime, max(S_lower, S_lower_prime));
        fprintf('Su'' := min(%.4f, ((%.4f + %.4f) - %.4f) / (%.4f - %.4f)) = min(%.4f, %.4f) = %.4f\n', S_upper, T(i + 1, 2), max_error, begin(2), T(i + 1, 1), begin(1), S_upper, S_upper_prime, min(S_upper, S_upper_prime));

        if S_lower_prime <= S_upper_prime
            S_lower = S_lower_prime;
            S_upper = S_upper_prime;
            fprintf('The if condition is true, hence Sl := Sl'' and Su := Su''.\n');
        else
            fprintf('\nBecause %.4f > %.4f, the if condition is false and the following line will be added as the first piece:\n', S_lower_prime, S_upper_prime);
            fprintf('f(t) = %.4f(t - %.4f) + %.4f\n', (S_lower + S_upper)/2, begin(1), begin(2));
            begin = [T(i, 1), f(S_lower, S_upper, T(i, 1), begin(1), begin(2))];
            S_lower = slope(begin, [T(i+1, 1), T(i+1, 2) - max_error]);
            S_upper = slope(begin, [T(i+1, 1), T(i+1, 2) + max_error]);

            fprintf('We also set Begin := (%.4f, %.4f) and\n', begin(1), begin(2));
            fprintf('Sl := ((%.4f - %.4f) - %.4f) / (%.4f - %.4f) = %.4f\n', T(i+1, 2), max_error, begin(2), T(i+1, 1), begin(1), S_lower);
            fprintf('Su := ((%.4f + %.4f) - %.4f) / (%.4f - %.4f) = %.4f\n', T(i+1, 2), max_error, begin(2), T(i+1, 1), begin(1), S_upper);
        end
    end

    fprintf('Now we exit the for loop and in the last line, we create the piece:\n');
    fprintf('f(t) = %.4f(t - %.4f) + %.4f\n', (S_lower + S_upper)/2, begin(1), begin(2));

    % Create and return an anonymous function representing the piecewise linear approximation
    a = round((S_lower + S_upper)/2, 4);
    b = round(begin(1), 4);
    c = round(begin(2), 4);
    piecewise_function = @(t) a * (t - b) + c;

end

function result = slope(A, B)
    result = (B(2) - A(2)) / (B(1) - A(1));
end

function result = f(Su, Sl, t, begin_t, begin_y)
    result = (Sl + Su)/2 * (t - begin_t) + begin_y;
end


