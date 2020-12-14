function [w] = antyidealny(A)
    [no_points, no_kryt] = size(A);
    w = zeros(1, no_kryt);
    for i=1:no_kryt
        w(i) = max(A(:, i));
    end
end