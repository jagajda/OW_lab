classdef AbstractAlgorithm
    
    properties(Abstract, Constant)
        Name;
        Params;
    end
    
    methods (Abstract)
       calculate(obj, input);
       obj = init(obj, params);
    end
    
    methods (Static)
        function val = str2bool(str)
            val  = strcmpi(str, 'True'); 
        end
    end
    
end

