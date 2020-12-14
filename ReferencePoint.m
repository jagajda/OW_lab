classdef ReferencePoint
    properties
        Vals
        Expert
        Type
    end
    
    methods
        function obj = ReferencePoint(vals, expert, type)
            obj.Vals = vals;
            obj.Expert = expert;
            obj.Type = type;
        end
        
        function row = toRow(obj)
            row = horzcat(obj.Vals, obj.Expert);
        end
    end
end

