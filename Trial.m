classdef Trial < handle
    
    properties
        id
        instr
        emo
        data
        depVars
    end
    
    methods
        function obj = Trial(id)
            if nargin > 0
                obj.setID(id)
            end
        end
        function setID(obj, id)
            obj.id = id;
        end
        function setDepVars(obj, depVars)
            obj.depVars = depVars;
        end
        function setData(obj, data)
            obj.data = data;
        end
    end
    
    
end