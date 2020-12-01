function [inversions] = tau_dist_row(row1, row2)
%tau_dist_row calculates Tau Sequence Distance for every two rows of ranks
%   Detailed explanation goes here
    s1 = length(row1);
    s2 = length(row2);
    assert(s1 == s2, 'Error, unequal length sequences');
    n = s1;
    S = sort(copy(row1));
    M = zeros(1, n);
    M(1) = 0;
    for i=2:n
        if(S(i) == S(i-1))
            M(i) = M(i-1);
        else
            M(i) = M(i-1) + 1;
        end
    end
    B1 = [];
    B2 = [];
    for ind = 1 : M(n-1) + 1
        B1 = [B1, queue()];
        B2 = [B2, queue()];
    end
    for it=1:n
        j = find(S == row1(it));
        k = find(S == row2(it));
        if(length(j) >= 1)
            j_ind = j(1);
        end
        if(length(k) >= 1)
            k_ind = k(1);
        end
        assert(length(k) > 0, 'Error: sequences contain different elements');
        B1(M(j)).enqueue(i);
        B2(M(k)).enqueue(i);
    end
    P = zeros(1, n);
    for index=1:M(n)
        assert(B1(i).depth == B2(i).depth, 'Error: sequences contain different number of copies of an element');
        while(B1(i).depth > 0)
            h1 = B1(i).dequeue();
            h2 = B2(i).dequeue();
            P(h1) = h2;
        end
    end
    inversions = perm_invs_count(P);
end

