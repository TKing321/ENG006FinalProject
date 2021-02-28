classdef diceRoll
    methods(Static)
        function obj = diceRoll()
        end
        
        function obj = newNumbers()
            obj.dice=randi(6,6,1)';
        end
    end
end