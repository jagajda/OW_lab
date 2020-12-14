function avgRank = calcualte_avg_rank(ranks)
%calcualte_avg_rank calculates average rank for given n ranks of points
%   ranks = ranks to be processed
%   ranks = table(rank1, rank2, ...)
   number_of_ranks = width(ranks);
   rank1 = table2array(ranks(:,1));
   [items, dimension] = size(rank1);
   newMap = zeros(items,1);
   for i=1:items
       newMap(i,1) = i;
       elem = rank1(i,:);
       for rank=2:number_of_ranks
           found = find(table2array(ranks(:,rank)) == elem);
           if length(found) >= 1
               index = found(1);
               newMap(i,1) = newMap(i,1) + index;
           end         
       end
       newMap(i,1) = round(newMap(i,1) / number_of_ranks);
   end
   avgRank = newMap;
end

