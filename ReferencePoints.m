classdef ReferencePoints
    properties
        Points;
    end
    
    methods
        function obj = ReferencePoints(obj)
            obj.Points = containers.Map('KeyType','char','ValueType','any');
        end
        
        function points = getType(obj, type)
            points = [];
            if(obj.hasKey(type))
                points = obj.Points(type);
            end
        end
        
        function obj = addPoint(obj, point)
            if(isKey(obj.Points, point.Type))
                currentPoints = obj.Points(point.Type);
                points = [currentPoints, point];
            else
                points = [point];
            end
            obj.Points(point.Type) = points;
        end
        
        function vals = getVals(obj)
            vals = [];
            k = values(obj.Points);
            for i=length(k)
                vals = vertcat(vals, k{i}.Vals);
            end
        end
        
        function val = hasKey(obj, key)
            val = isKey(obj.Points, key);
        end
        
        function vals = getValsForType(obj, type)
            pointsType = obj.getType(type);
            vals = [];
            for i=1:length(pointsType)
                vals = vertcat(vals, pointsType(i).Vals);
            end
        end
        
        function experts = getExpertsForType(obj, type)
            pointsType = obj.getType(type);
            experts = [];
            for i=1:length(pointsType)
                experts = vertcat(experts, pointsType(i).Expert);
            end
        end
        
        function experts = getExperts(obj)
            experts = [];
            k = values(obj.Points);
            for i=length(k)
                experts = vertcat(experts, k{i}.Expert);
            end
        end
        
        function saveToXlsx(obj, filename)
            k = keys(obj.Points);
            for i=1:length(k)
                key = char(string(k(i)));
                vals = obj.getValsForType(key);
                experts = obj.getExpertsForType(key);
                data = horzcat(vals, experts);
                writematrix(data, filename, 'Sheet', k{i});
            end 
        end
        
        function names = getNames(obj)
           [rows, columns]  = size(obj.getVals());
           names = [];
           for i=1:columns
               names = [names, strcat("Kryterium" , num2str(i))];
           end
        end
        
        function setDataTable(obj, dataTable)
            if(~isempty(obj.Points))
                dataTable.Data = obj.getVals();
                [rows, columns]  = size(obj.getVals());
                dataTable.ColumnName = obj.getNames(); 
            end
        end
        
        function obj = initFromXlsx(obj, filename)
            obj.Points =  containers.Map('KeyType','char','ValueType','any');
            allSheets = sheetnames(filename);
            referencePointsSheets = [];
            for i=1:length(allSheets)
               if contains(allSheets(i), "data")
                   continue;
               end
               referencePointsSheets = [referencePointsSheets, allSheets(i)];
            end
            for i=1:length(referencePointsSheets)
               sheetName = referencePointsSheets(i);
               matrix = readtable(filename, 'Sheet', sheetName);
               matrix = table2array(matrix);
               [matrixRows, matrixColumns]= size(matrix); 
               data = matrix(:,1:matrixColumns-1);
               experts = matrix(:, matrixColumns);
               for j=1:length(experts)
                   newPoint = ReferencePoint(data(j,:), experts(j), sheetName);
                   obj.addPoint(newPoint);
               end
            end
        end
        
        function obj = initFromXlsxIgnoreExperts(obj, filename)
            obj.Points =  containers.Map('KeyType','char','ValueType','any');
            allSheets = sheetnames(filename);
            referencePointsSheets = [];
            for i=1:length(allSheets)
               if contains(allSheets(i), "data")
                   continue;
               end
               referencePointsSheets = [referencePointsSheets, allSheets(i)];
            end
            for i=1:length(referencePointsSheets)
               sheetName = referencePointsSheets(i);
               matrix = readtable(filename, 'Sheet', sheetName);
               matrix = table2array(matrix);
               [rows, columns] = size(matrix);
               for j=1:rows
                   newPoint = ReferencePoint(matrix(j,:),0,sheetName);
                   obj.addPoint(newPoint);
               end
            end
        end
    end
end
