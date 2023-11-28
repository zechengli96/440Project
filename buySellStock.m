function [buy, sell, maxProfit] = buySellStock(forecastPrices)
    [~ , n] = size(forecastPrices);
    maxProfit = 0;
    buy = 1; % buy index
    sell = 1; % sell index
    left = 1;
    right = 2;
    while (right <= n)
        if (forecastPrices(left) < forecastPrices(right))
            profit = forecastPrices(right) - forecastPrices(left);
            if profit > maxProfit
                maxProfit = profit;
                buy = left;
                sell = right;
            end
        else
            left = right;
        end
        right = right + 1;
    end
end

% test command
% [buy, sell, maxProfit] = buySellStock([7, 1, 5, 3, 6, 0, 3, 5, 6, 4]) 
% result - buy at index 6, sell at index 9

% [buy, sell, maxProfit] = buySellStock([7, 1, 5, 3, 6, 0, 4])
% result - buy at index 2, sell at index 5.
