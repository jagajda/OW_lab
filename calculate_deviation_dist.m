function [dist] = calculate_deviation_dist(rank1, rank2, weights)
%calculate deviation distance
%   Calcualtes deviation distance between given ranks with set weights
    [row1, col1] = size(rank1);
    [row2, col2] = size(rank2);
    dist = 0;
    for i=1:row1
        found = find(rank2 == rank1(i,:));
        if length(found) > 0
            ind = found(1);
            dist = dist + abs(weights(i) - weights(ind));
        end
    end
    dist = dist / (row1 - 1);
end

