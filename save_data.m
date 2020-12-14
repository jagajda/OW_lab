function filename = save_data(distribution,data, reference_points, header)
    datetime.setDefaultFormats('default', 'yyy-MM-dd hh:mm:ss');
    timestamp = string(datetime('now'));
    data_size = size(data);
    no_criterion = data_size(2);
    old = {':', ' '};
    new = {'-'};
    for i=1:length(header)
       if(contains(header(i), "min"))
           new_header(i) = "min"
       else
           new_header(i) = "max"
       end
    end
    
    filename =distribution + replace(timestamp, old, new) + '.xlsx';
    T = array2table(data);
    T.Properties.VariableNames = header;
    if isfile(filename)
        delete(filename)   
    end
    writematrix(new_header, filename, 'Sheet', 'Data')
    writematrix(data, filename, 'Sheet', 'Data')
    R = array2table(reference_points);
    R.Properties.VariableNames = header;
    writetable(R,filename,'Sheet','PunktyOdniesienia');
    writematrix(new_header,filename,'Sheet','Data')
end

