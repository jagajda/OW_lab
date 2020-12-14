filename = '/home/marcin/OWlab/Jednostajny_N2_M1_k1.xls'; 
%Init
refs = ReferencePoints();
input = DataInput();

%Init from file
refs = refs.initFromXlsxIgnoreExperts(filename);
% refs = refs.initFromXlsx(data) %Expects last column as expert id
input = input.initFromXlsx(filename);

%inputData
input.getVals(); %matrix

rfType = "A0"; %A0, A1, A2..

a0Vals=refs.getValsForType(rfType); %Matrix fo ref points
a0Refs = refs.getType(rfType) %Array of custom ReferencePoint class