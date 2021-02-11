classdef game
    properties
        player;
        madeMove;
    end
    methods
        function obj = game(main)
            obj.player=player(main);
            obj.madeMove=false;
        end
        
        function currentValsTurns = getCurrentValuesT(channelID,key)
            currentValsTurns = thingSpeakRead(channelID,'Readkey',key);
        end
        
        function obj = makeMove(obj,color,position)
            if(~obj.madeMove)
                obj.pressed(color,position);
            end
        end
        
        function playerTurn = getCurrentTurn(main)
            var = main.getCurrentValuesT();
            playerTurn=var(7);
        end
        
        function moves = getValidMoves(obj,playerTurn)
            
            %Initialize necessary variables for calculations
            moves=[];
            dice = obj.getDice();
            total = dice(5)+dice(6);
            maxValues=[max(obj.board.red),max(obj.board.yellow),max(obj.board.green),max(obj.board.blue)];
            
            %If its the player turn they have extra possible moves
            if(playerTurn)
                colorValues=[[dice(1)+dice(5),dice(1)+dice(6)],[dice(2)+dice(5),dice(2)+dice(6)],[dice(3)+dice(5),dice(3)+dice(6)],[dice(4)+dice(5),dice(4)+dice(6)]];
                for(i=1:1:length(maxValues))
                    for(j=1:1:2)
                        if(maxValues(i)<colorValues(j+i*2-2))
                            moves=[moves,i*10+colorValues(j+i*2-2)];
                        end
                    end
                end
            end
            
            %Generalized move list for all players
            for (i=1:1:length(maxValues))
                if(total>maxValues(i))
                    moves=[moves,i*10+total];
                end
            end
        end
    end
end