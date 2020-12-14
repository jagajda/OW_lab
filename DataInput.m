classdef DataInput
    properties
        Criterions;
    end
    
    methods
        function obj = addCriterion(obj,criterion)
            obj.Criterions = [obj.Criterions, criterion];
        end
        
        function vals = getVals(obj)
           vals = [];
           for i=1:length(obj.Criterions)
               val = obj.Criterions(i).Vals;
               vals = horzcat(vals, val);
           end
        end
        
        function names = getNames(obj)
            names = [];
            for i=1:length(obj.Criterions)
               names = [names, obj.Criterions(i).getTableName(i)];
            end
        end
        
        function status = isEmpty(obj)
            status = isempty(obj.Criterions);
        end
        
        
        function size = getSize(obj)
           size = length(obj.Criterions);
        end
        
        function size = getCriterionSize(obj)
           size = -1;
           if(~isempty(obj.Criterions))
               size = length(obj.Criterions(length(obj.Criterions)).Vals);
           end
        end
        
        function names = getFileNames(obj)
            names = [];
            for i=1:length(obj.Criterions)
               names = [names,convertCharsToStrings(obj.Criterions(i).MinMax)];
            end
        end
        
        function setDataTable(obj,dataTable)
           dataTable.ColumnName = obj.getNames();
           dataTable.Data = obj.getVals();
        end
        
        function status = saveToXlsx(obj, filename)
            status = ~isempty(obj.Criterions);
            if(status)
                writematrix(obj.getFileNames(), filename, 'Sheet', 'data');
                writematrix(obj.getVals(), filename, 'Sheet', 'data', 'WriteMode', 'Append');
            end
        end
        function obj = initFromXlsx(obj, filename)
            table = readtable(filename, 'Sheet', 'data');
            variables = table.Variables;
            for i=1:length(table.Properties.VariableNames)
                if(contains(table.Properties.VariableNames{i}, "min"))
                   names(i) = "min";
                else
                   names(i) = "max";
                end
            end
            newCriterions = [];
            for i=1:length(names)
                dataCriterion = variables(:,i);
                newCriterion = Criterion("Unknown", dataCriterion, names(i));
                newCriterions = [newCriterions, newCriterion];
            end
            obj.Criterions = newCriterions;
        end
    end
end