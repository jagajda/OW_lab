function [dist] = tau_dist(rank1, rank2)
%calculates Tau Sequence Distance between 2 ranks
%   Detailed explanation goes here
    dist=0;
    [r1, col1] = size(rank1);
    [r2, col2] = size(rank2);
    assert(r1 == r2, 'Error: unequal size of ranks');
    for i=1:r1
        dist = dist + tau_dist_row(rank1(i, :), rank2(i, :));
    end
end

