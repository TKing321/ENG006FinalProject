classdef game
    
    properties (Constant)
        writeKeyTurn = 'NGW99VVOQPSVSISN';
        readKeyTurn = '5RYFWLGNF8I4GSQU';
        channelIDTurn = 1302152;
        
        writeKeyStatus = '5PMM9O7QNFYBH0OH';
        readKeyStatus = 'DCJX3N1VGVPW10I7';
        channelIDStatus = 1302961;
          
    end
    
    properties
        player;
        madeMove;
    end
    
    methods
        
        %Constructor for the game class. Each game has a player and if the
        %player has made a move this turn.
        function obj = game(main)
            obj.player=player(main);
            obj.madeMove=false;
        end
        
        function obj = pressed(obj,color,position,playerTurn)
            
            moves = obj.getValidMoves(playerTurn);
            
            %Check that a move is valid and if so tell the game a move was
            %made and tell the board a move was made.
            switch color
                case "red"
                    if(ismember(10+position,moves))
                        obj.madeMove=true;
                        obj.board=obj.board.setValue(color,position);
                    end
                case "yellow"
                    if(ismember(20+position,moves))
                        obj.madeMove=true;
                        obj.board=obj.board.setValue(color,position);
                    end
                case "blue"
                    if(ismember(30+position,moves))
                        obj.madeMove=true;
                        obj.board=obj.board.setValue(color,position);
                    end
                case "green"
                    if(ismember(40+position,moves))
                        obj.madeMove=true;
                        obj.board=obj.board.setValue(color,position);
                    end
            end
        end
        
        %If the player hasn't made a move, see if said move is a valid move
        function obj = makeMove(obj,color,position)
            if(~obj.madeMove)
                obj.pressed(color,position);
            end
        end
        
        %Gets the current turn from thingspeak.
        function playerTurn = getCurrentTurn(obj)
            var = obj.getCurrentValuesT(obj.channelIDTurn,obj.readKeyTurn);
            playerTurn=var(7);
        end
        
        function dice = getDice(obj)
            dice = obj.getCurrentValuesT();
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
    methods (Static)
        
        %Get what players turn it currently is
        function currentValsTurns = getCurrentValuesT(channelID,key)
            currentValsTurns = thingSpeakRead(channelID,'Readkey',key);
        end
        
    end
end