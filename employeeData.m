classdef employeeData
    methods(Static)
        function obj = employeeData()
        end
        
        function obj = newNumbers()
            obj.dice=randi(6,6,1)';
        end
    end
end