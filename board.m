classdef board
    properties
        %Each board has 4 colors and penalties.
        red;
        yellow;
        blue;
        green;
        playerPenalties
    end
    methods
        %Initializes the board.
        function obj = board()
            obj.red = zeros(1,12);
            obj.yellow = zeros(1,12);
            obj.blue = zeros(1,12);
            obj.green = zeros(1,12);
            obj.playerPenalties = 0;
        end
        %Sets the value of a certain color and position.
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
        %Adds another penalty to the player
        function obj = incrementPenalties(obj)
            obj.playerPenalties=obj.playerPenalties+1;
        end
        
        %Gets the the total value of a row.
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
        
        %Gets the number of player penalties so far.
        function value = totalPenalties(obj)
            value=obj.playerPenalties;
        end
    end
end