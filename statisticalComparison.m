function significance = statisticalComparison(data1, data2)
    [H1, ~, ~] = swtest(data1);
    [H2, ~, ~] = swtest(data2);
    if(H1 == 1)
        data1 = boxcox(data1);
    end
    if(H2 == 1)
        data2 = boxcox(data2);
    end
    [h, p] = ttest2(data1, data2);
    fprintf("Decision: %d, p-value: %d", h, p);
    significance = h;