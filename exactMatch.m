function metrics = exactMatch(points1, points2, weighs)
    metrics = 0;
    for i = 1:length(points1(:, 1))
        if(points1(i, :) == points2(i, :))
            continue;
        else
            for j = 1:length(points2(:, 1))
                if(points2(j, :) == points1(i, :))
                    metrics = metrics + weighs(i);
                    break;
                end
            end
        end
    end