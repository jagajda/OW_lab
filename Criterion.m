classdef Criterion
    properties
        Distribiution;
        Vals;
        MinMax;
    end
    
    methods
        function obj = Criterion(distribiution, vals, minMax) 
            obj.Distribiution = distribiution;
            obj.Vals = vals;
            if(upper(minMax)=="MIN")
                obj.MinMax = "min";
            else
                obj.MinMax = "max"; 
            end
        end
       
        function tableName = getTableName(obj, num)
            tableName= strcat("Kryterium ", num2str(num), "(", obj.MinMax, ")");
        end
    end
end