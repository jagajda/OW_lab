function [distance_mean] = compare_rankings(input_data, reference_points, algorithm, bound_low, bound_high, step)
    %%% plot ranking distance (lambda) 
    % algorithm - initialized instance of algorithm 
    
    dist_rankings_list = [];
    prev_result =input_data;

    for lambda=bound_low:step:bound_high
        % --- TOPSIS and RSM

        result = algorithm.calculate(input_data, reference_points);

        if (lambda>bound_lower)
            distance = tau_dist(result, prev_result);
        else
            distance = 0; %initialization, only for 1st iteration
        end

        dist_rankings_list = [dist_rankings_list, distance];

    end

    plot(bound_lower:step:bound_higher, dist_rankings_list);
    xlabel("Lambda");
    ylabel("tau distance");
    grid on 
    
    % -- return
    distance_mean = mean(dist_rankings_list);
end