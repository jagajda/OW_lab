function filename = save_data(distribution,data, reference_points)
    datetime.setDefaultFormats('default', 'yyy-MM-dd hh:mm:ss');
    timestamp = string(datetime('now'));
    data_size = size(data);
    no_criterion = data_size(2);
    col_names = [];
    for i=1:no_criterion
        str = strcat("Kryterium", num2str(i));
        col_names = [col_names, str];
    end
    old = {':', ' '};
    new = {'-'};
    filename =distribution + replace(timestamp, old, new) + '.xlsx';
    T = array2table(data);
    T.Properties.VariableNames = col_names;
    if isfile(filename)
        delete(filename)   
    end
    writetable(T,filename,'Sheet','DaneWejsciowe');
    R = array2table(reference_points);
    R.Properties.VariableNames = col_names;
    writetable(R,filename,'Sheet','PunktyOdniesienia');
end

