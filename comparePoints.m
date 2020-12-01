function functionMean = comparePoints (points, paramLow, paramHigh, paramStep)
    distances = zeros(length(points(:, 1)));
    for i = 1:length(points(:, 1))
        distances(i) = norm(points(i, :) - points(1, :));
    end
    integral = 0;
    for i = 1:length(points(:, 1)) - 1
        integral = integral + (distances(i) + distances(i + 1))*paramStep/2;
    end
    functionMean = integral/(paramHigh - paramLow);
    
