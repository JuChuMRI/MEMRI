classdef Subject < handle
    
    properties
        name
        id
        experiment
        phase1
        phase2
        phase3
        phase4
    end
    
    methods
        function obj = Subject(ID, experiment)
           if nargin > 0
               obj.setID(ID)
               obj.setExperiment(experiment)
           end
        end
        
        function setID(obj,ID)
            obj.id = ID;
        end
        function setExperiment(obj, Experiment)
            obj.experiment = Experiment;
        end
        function readPhase(obj,phaseNum, file, sheet)
            switch phaseNum
                case 1
                    obj.phase1 = Phase(1, file, sheet);
                case 2
                    obj.phase2 = Phase(2, file, sheet);
                case 3
                    obj.phase3 = Phase(3, file, sheet);
                case 4
                    obj.phase4 = Phase(4, file, sheet);
            end
        end
                  
    end
    
end
