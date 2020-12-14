function [w] = nadir(A)
    [no_points, no_kryt] = size(A);
    max_val = 0;
    max_val_idx = 0;
    for i=1:no_points
        val = sum(A(i, :));
        if (val > max_val)
            max_val = val;
            max_val_idx = i;
        end
    end
    w = A(max_val_idx, :);
end