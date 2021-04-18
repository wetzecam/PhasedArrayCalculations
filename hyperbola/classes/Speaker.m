classdef Speaker
    % Class to encapsulate information about
    %   an individual speaker in the Phased Array
    
    properties
        d      % Location          |    SpaceVector
        u      % Forward Direction |     SpaceVector [Normalized]
        
        % **** More Parameters to be added Incl. but not limited to
        %       -- Radiation Pattern
        %       -- Transconductance Transfer Function H(s)
        %       -- ? Distortion ?
    end
    
    methods
        function obj = Speaker(d)
            % Constructor of Speaker
            %   Input = Location [SpaceVector]
            obj.d = d;
            obj.u = SpaceVector(1,0);
        end
        
        function td = Delay(obj,R,c)
            X = R.Displacement(obj.d);
            td = X./c;
        end
    end
end

