function count = perm_invs_count(p)
    [nR,nE] = size(p);
    count = zeros(nR,1);
    for i = 1:nE-1
        count = count + sum((p(:, i) > p(:, (i+1):end)),2);
    end
end
