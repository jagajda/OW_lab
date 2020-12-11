function [meanPoint, stdDevOfPoints, meanDistance, stdDevOfDistances, minDistance, maxDistance] = compareCompromisePoints(points)    
    numberOfPoints = size(points, 1);
    numberOfCriteria = size(points, 2);
    meanPoint = zeros(1, numberOfCriteria);
    stdDevsOfPoints = zeros(1, numberOfCriteria);
    for i = 1:numberOfCriteria
        meanPoint(i) = mean(points(:, i));
        stdDevsOfPoints(i) = std(points(:, i));
    end
    stdDevOfPoints = mean(stdDevsOfPoints);
    distances = zeros(numberOfPoints, numberOfPoints);
    for i = 1:numberOfPoints
        for j = 1:numberOfPoints
            distances(i, j) = norm(points(i, :) - points(j, :));
        end
    end
    distancesNoZeros = distances(find(distances ~= 0));
    meanDistance = mean(distancesNoZeros);
    stdDevOfDistances = std(distancesNoZeros);
    minDistance = min(distancesNoZeros);
    maxDistance = max(distancesNoZeros);
