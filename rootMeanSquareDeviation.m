function rootMeanSquareDeviation = rootMeanSquareDeviation(A, E, lowerbound, upperbound)
    % A: an array of actual value
    % E: an array of estimated value from interpolated methods
    rootMeanSquareDeviation = 0;
    for i = lowerbound: upperbound
       rootMeanSquareDeviation = rootMeanSquareDeviation + (A(i) - E(i))^2;
    end
    rootMeanSquareDeviation = sqrt(rootMeanSquareDeviation / (upperbound - lowerbound + 1));
end

% test
% result = rootMeanSquareDeviation([5, 7, 9, 11, 13], [4, 6, 8, 10, 12], 1, 5)
% result = 1