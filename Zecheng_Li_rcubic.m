% Load the data
opts = detectImportOptions('TSLA-6 month.csv');
opts.VariableNamingRule = 'preserve';
data = readtable('TSLA-6 month.csv', opts);

% Select the 'Date' and 'Close' columns
dates = data.('Date');
closePrices = data.('Close');

% Convert dates to MATLAB datetime
dates = datetime(dates, 'InputFormat', 'yyyy-MM-dd');

% Convert dates to serial date number for interpolation
dates_num = datenum(dates);

% Perform cubic spline interpolation
futureDates = dates(end) + days(1:30);
futureDates_num = datenum(futureDates);
splineCoeff = spline(dates_num, closePrices);

% Predict future prices
predictedPrices = ppval(splineCoeff, futureDates_num);

% Plot the original data
figure;
plot(dates, closePrices, 'b.-', 'LineWidth', 1.5, 'MarkerSize', 10); % Blue line with markers
hold on;

% Plot the predicted data
plot(futureDates, predictedPrices, 'r--', 'LineWidth', 1.5); % Red dashed line for prediction
datetick('x', 'yyyy-mm-dd');
xlabel('Date');
ylabel('Close Price');
title('Tesla Stock Price and Cubic Spline Interpolation Prediction');
legend('Actual Stock Price', 'Predicted Price');
grid on;

% Set y-axis range from 0 to 400
ylim([0 400]);
