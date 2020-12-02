function data = generate_data(distribution, no_samples, no_criterion, parameters)
    data = [];
    switch distribution
        case 'Normalny'
            mu = parameters("mu");
            sigma = parameters("sigma");
            data = normrnd(mu, sigma, no_samples, no_criterion);
        case 'Eksponencjalny'
            mu = parameters("mu");
            data = exprnd(mu, no_samples, no_criterion);
        case 'Jednostajny'
            data = rand(no_samples, no_criterion);
        otherwise
    end
end