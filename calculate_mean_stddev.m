function [avg, stddev] = calculate_mean_stddev(ranks)
%calculate_mean_stddev calculates mean and standard deviation for ranks
%given
%   ranks = table(rank1, rank2, ...)
    [dimension, number_of_ranks] = size(ranks);
    weights = linspace(1,0,dimension);
    results = zeros(number_of_ranks);
    for i=1:number_of_ranks
        for j=1:number_of_ranks
            r1 = table2array(ranks(:,i));
            r2 = table2array(ranks(:,j));
            results(i,j) = calculate_deviation_dist(r1, r2, weights);
        end
    end
    avg = mean(results, 'all');
    stddev = std(results, 0, 'all');
end

