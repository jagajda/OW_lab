function data = generate_data_limited(distribution, no_samples, no_criterion, parameters, min_v, max_v)
    data = zeros(no_samples, no_criterion);
    switch distribution
        case 'Normalny'
            mu = parameters("mu");
            sigma = parameters("sigma");
            
            for i=1:no_criterion
                if (mu < min_v(i))
                    mu_ = mean([min_v(i), max_v(i)]);
                else
                    mu_ =mu;
                end
                data(:, i) = normrnd(mu_, sigma, no_samples, 1);
                for j=1:no_samples
                    if (data(j, i) <= min_v(i))
                        data(j, i) = data(j, i)+(min_v(i)-data(j, i))*1.2;
                    end
                    if (data(j, i) >= max_v(i))
                        data(j, i) = data(j, i)-(max_v(i)- data(j, i) + 0.2);
                    end
                end
            end
        case 'Eksponencjalny'
            mu = parameters("mu");
            for i=1:no_criterion
                if (mu < min_v(i))
                    mu_ = mean([min_v(i), max_v(i)]);
                else
                    mu_ =mu;
                end
                data(:, i) = exprnd(mu_, no_samples, 1);
                for j=1:no_samples
                    if (data(j, i) <= min_v(i))
                        data(j, i) = data(j, i)+(min_v(i)-data(j, i))*1.2;
                    end
                    if (data(j, i) >= max_v(i))
                        data(j, i) = data(j, i)-(max_v(i)- data(j, i)*1.2);
                    end
                end
            end
        case 'Jednostajny'
            for i=1:no_criterion
%                 data(:, i) = rand(no_samples, 1);
                for j=1:no_samples
                    data(j, i) = min_v(i) +(max_v(i)-min_v(i))*rand;
                    if (data(j, i) <= min_v(i))
                        data(j, i) = data(j, i)+(min_v(i)-data(j, i))*1.2;
                    end
                    if (data(j, i) >= max_v(i))
                        data(j, i) = data(j, i)-(max_v(i)- data(j, i) + 0.2);
                    end
                end
            end
        otherwise
    end
end