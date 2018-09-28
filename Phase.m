classdef Phase < handle
   properties
       id
       run
       cat
       trials
       instr
       emo
   end
    
   methods
       function obj = Phase(id, file, sheet)
           obj.setID(id);
           obj.loadData(file, sheet);
       end
       
       function setID(obj,id)
           obj.id = id;
       end
       
       function loadData(obj, file,sheet)
           [NUM,TXT,RAW]=xlsread(file,sheet);
           %% Convert excelsheet content to Structure
           testData   = RAW(3:end,:);  % cell; numerical data starts from row 3
           tfields    = RAW(2,:);    % cell; column fields names in row 2
           fieldnames = cell(1,length(tfields)); 
           obj.trials = cell(1,size(testData,1));  %cell
           
           %Turn column field names into a cell array
           
           for ii = 1:length(size(testData,1))
                fieldnames{ii} = obj.fixFieldNames(tfields{ii});
           end
           
           for ii = 1:size(testData,1)
               trial = Trial(ii);
               trial.setDepVars(fieldnames); 
               trial.setData(testData(ii,:)); %testData{ii,:});
               obj.trials{ii} = trial;
               % fixFieldNames(tfields{ii});  % {} calls content of the cell, not cell itself.
           end
       end
       
       function fs = fixFieldNames(~,s)
           % takes fields names from edat to excel output and replace special
           % characters, such as "." or "[" or "]", and rejoins them using specified
           % delimiter.
           
           % split strings at these special delimiters
           % input argument to strsplit must be a "char".
           % output to strsplit is cells;
           ts = strsplit(s,{'.','[',']'});  % into cells
           
           %strjoin takes output of the strsplit, and joins the cells and produces a
           %string (CHAR)variable.
           fs = strjoin(ts,'_');   %into 1 CHAR variable
       end
       
       
       
       
   end 
end