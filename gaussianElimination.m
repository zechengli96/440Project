function X = gaussianElimination(A, b)
    [m, n] = size(A);
    Aug = [A, b]; % Augmented matrix 
   
    S = zeros(m, 1);
    for i = 1: (n-1)
        S(i) = max(abs(A(i, 1:n)));
    end

    for k = 1: (n-1)
        % Find pivot row
        pivot = abs(A(k, k)) / S(k);
        pivot_row = k;
        for i = (k + 1): n 
            candidate = abs(A(i, k)) / S(i);
            if candidate > pivot
                pivot = candidate;
                pivot_row = i;
            end
        end

        fprintf("Pivot row is %d\n", pivot_row);
        
        % Swap rows
        temp = Aug(k, :);
        Aug(k, :) = Aug(pivot_row, :);
        Aug(pivot_row, :) = temp;
        
        % Forward elimination
        for i = (k+1): n 
            EC = Aug(i, k) / Aug(k, k);
            for j = k: (n + 1) 
                Aug(i, j) = Aug(i, j) - EC * Aug(k, j);
            end
        end
        
    end

    X = zeros(m, 1);
    for i = n: -1: 1
        X(i) = Aug(i, n+1);
        for j = n: -1: (i+1)
            X(i) = X(i) - Aug(i, j) * X(j);
        end
        X(i) = X(i) / Aug(i, i);
        
    end
    
end






