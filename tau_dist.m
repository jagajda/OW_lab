function [dist] = tau_dist(rank1, rank2, weigth_vector)
%calculates Tau Sequence Distance between 2 ranks
%   Detailed explanation goes here
    dist=0;
    [r1, col1] = size(rank1);
    [r2, col2] = size(rank2);
%     assert(r1 == r2, 'Error: unequal size of ranks');
    len = min([r1, r2]);
    if (r1 ~= r2)
        fprintf('Warning: unequal size of ranks - last records of longer ranks will be cut out\n');
        if (r1 > r2)
            for i = r2:r1
                % remove row
                rank1(i, :) = [];          
            end
        else 
            for i = r2:r1
                % remove row
                rank2(i, :) = [];          
            end
        end
    end
    
    
    Map_row_ids = containers.Map('KeyType','char','ValueType','uint8');
    
    mapped_rank1 = zeros(1, len);
    mapped_rank2 = zeros(1, len);
    weigth_vector = weigth_vector(1:len);
    next_idx = 1;
    
    % Map rank1
    for i=1:len
        row_str = mat2str(rank1(i, :));
        if ismember(row_str, Map_row_ids.keys())
            % if row already mapped take its id
            idx = Map_row_ids(row_str);
        else
            %else add row with new index to map
            Map_row_ids(row_str) = next_idx;
            idx = next_idx;
            next_idx = next_idx + 1;
        end
        mapped_rank1(i) = idx;
    end
    % Map rank2
    for i=1:len
        row_str = mat2str(rank2(i, :));
        if ismember(row_str, Map_row_ids.keys())
            % if row already mapped take its id
            idx = Map_row_ids(row_str);
        else
            %else if row is not in rank1 -> idx =0 
            idx = 0;
        end
        mapped_rank2(i) = idx;
    end
    
    % change to 0 ids in rank1 which are not in rank2:
    for i=1:len
        if ~ismember(mapped_rank1(i), mapped_rank2)
            mapped_rank1(i) = 0;
        end
    end

    dist = tau_dist_row(mapped_rank1, mapped_rank2, weigth_vector);

end