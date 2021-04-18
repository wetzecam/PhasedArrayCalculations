classdef SpaceVector
    % Class to hold+facilitate common Spatial Vector Ops
    
    properties
        x  % X-component 
        y  % Y-component
    end
    
    methods
        function obj = SpaceVector(X,Y)
            % Object Constructor
            obj.x = X;
            obj.y = Y;
        end
        
        function Mag = Magnitude(obj)
            % Returns the Magnitude of the 2-D Vector
            Mag = sqrt(obj.x.^2 + obj.y.^2);
        end
        
        function theta = InnerAngle(obj,R)
            % Returns the Angle between the Vector
            %   and another Vector R
            NormalFactor = obj.Magnitude().*R.Magnitude();
            theta = obj.x.*R.x + obj.y.*R.y;
            theta = acos(theta./NormalFactor);
        end
        
        function disp = Difference(obj,D)
            % Returns the Difference vector between
            %   this Vector "obj" and
            %   another Vector "D"
            dX = obj.x - D.x;
            dY = obj.y - D.y;
            disp = SpaceVector(dX,dY);
        end
        
        function disp = Displacement(obj,D)
            % Returns the Magnitude of Displacement between
            %   this Vector and another D
            dR = obj.Difference(D);
            disp = dR.Magnitude();
        end
        
    end
end

