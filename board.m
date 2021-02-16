classdef board
    properties
        red;
        yellow;
        blue;
        green;
        playerPentalties
    end
    methods
        function obj = board()
            obj.red = zeros(1,11);
            obj.yellow = zeros(1,11);
            obj.blue = zeros(1,11);
            obj.green = zeros(1,11);
            obj.playerPentalties = zeros(1,4);
        end
        function obj = setValue(obj,color,position)
            switch color
                case "red"
                    obj.red(position)=1;
                case "yellow"
                    obj.yellow(position)=1;
                case "blue"
                    obj.blue(position)=1;
                case "green"
                    obj.green(position)=1;
                otherwise
                    error("You have encounter an unexpected error, please contact the Author with the code 'Color Position'");
            end
        end
    end
    methods
        
        function value = total(obj,color)
            switch color
                case "red"
                    value=sum(obj.red);
                case "yellow"
                    value=sum(obj.yellow);
                case "blue"
                    value=sum(obj.blue);
                case "green"
                    value=sum(obj.green);
                otherwise
                    error("You have encounter an unexpected error, please contact the Author with the code 'Color Value'");
            end
        end
        
        function value = totalPentalties(obj)
            value=sum(obj.playerPentalties);
        end
    end
end