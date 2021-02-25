classdef diceroll
    methods(Static)
        function obj = diceroll()
        end
        
        function obj = newNumbers()
            obj.dice=randi(6,6,1)';
        end
    end
end