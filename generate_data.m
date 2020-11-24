function generate_data(distribution, no_samples, no_criterion, parameters)
    datetime.setDefaultFormats('default', 'yyy-MM-dd hh:mm:ss');
    timestamp = string(datetime('now'));
    col_names = [];
    for i=1:no_criterion
        str = strcat("Kryterium", num2str(i));
        col_names = [col_names, str];
    end
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
    T = array2table(data);
    T.Properties.VariableNames = col_names;
    if ~(isfile(filename))
        writetable(T, filename);
    else
        delete(filename);
        writetable(T, filename);
    end
end