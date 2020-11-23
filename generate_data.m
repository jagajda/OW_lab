function generate_data(distribution, no_samples, no_criterion, parameters)
    datetime.setDefaultFormats('default', 'yyy-mm-dd hh:MM:ss');
    timestamp = string(datetime('now'));
    old = {':', ' '};
    new = {'-'};
    timestamp = replace(timestamp, old, new);
    timestamp = timestamp + '.xlsx';
    switch distribution
        case 'Normalny'
            mu = parameters("mu");
            sigma = parameters("sigma");
            data = normrnd(mu, sigma, no_samples, no_criterion);
            filename = 'normalny' + timestamp;
        case 'Eksponencjalny'
            mu = parameters("mu");
            data = exprnd(mu, no_samples, no_criterion);
            filename = 'eksponencjalny' + timestamp;
        case 'Jednostajny'
            data = rand(no_samples, no_criterion);
            filename = 'jednostajny' + timestamp;
        otherwise
    end
    if ~(isfile(filename))
        xlswrite(filename, data);
    else
        delete(filename);
        xlswrite(filename, data);
    end
end