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
        madeColorMove;
        madeWhiteMove;
        
    end
    
    methods
        
        %Constructor for the game class. Each game has a player and if the
        %player has made a move this turn.
        function obj = game()
            obj.player=player(obj);
            obj.madeColorMove=false;
            obj.madeWhiteMove=false;
        end
        
        %Function for if a key is pressed
        function obj = pressed(obj,color,position,playerTurn)
            
            [colorMoves,whiteMoves] = obj.getValidMoves(playerTurn);
            colorMoves=colorMoves-1;
            whiteMoves=whiteMoves-1;
            
            disp(colorMoves);
            disp(whiteMoves);
            
            %Check that a move is valid and if so tell the game a move was
            %made and tell the board a move was made.
            switch color
                case "red"
                    if(ismember(10+position,whiteMoves))
                        obj.madeWhiteMove=true;
                        obj.player.board=obj.player.board.setValue(color,position);
                    elseif(ismember(10+position,colorMoves))
                        obj.madeColorMove=true;
                        obj.player.board=obj.player.board.setValue(color,position);
                    end
                case "yellow"
                    if(ismember(10+position,whiteMoves))
                        obj.madeWhiteMove=true;
                        obj.player.board=obj.player.board.setValue(color,position);
                    elseif(ismember(20+position,colorMoves))
                        obj.madeColorMove=true;
                        obj.player.board=obj.player.board.setValue(color,position);
                    end
                case "blue"
                    if(ismember(10+position,whiteMoves))
                        obj.madeWhiteMove=true;
                        obj.player.board=obj.player.board.setValue(color,position);
                    elseif(ismember(30+position,colorMoves))
                        obj.madeColorMove=true;
                        obj.player.board=obj.player.board.setValue(color,position);
                    end
                case "green"
                    if(ismember(10+position,whiteMoves))
                        obj.madeWhiteMove=true;
                        obj.player.board=obj.player.board.setValue(color,position);
                    elseif(ismember(40+position,colorMoves))
                        obj.madeColorMove=true;
                        obj.player.board=obj.player.board.setValue(color,position);
                    end
            end
        end
        
        %If the player hasn't made a move, see if said move is a valid move
        function obj = makeMove(obj,color,position)
            temp=obj.getCurrentTurn();
            if((~obj.madeWhiteMove||temp==obj.player.playerTurn)&&~obj.madeColorMove)
                disp("Made move");
                obj.pressed(color,position,temp==obj.player.playerTurn);
            end
        end
        
        %Gets the current turn from thingspeak.
        function playerTurn = getCurrentTurn(obj)
            var = obj.getCurrentValuesT();
            playerTurn=var(7);
        end
        
        function dice = getDice(obj)
            dice = obj.getCurrentValuesT();
        end
        
        function [colorMoves,whiteMoves] = getValidMoves(obj,playerTurn)
            
            %Initialize necessary variables for calculations
            whiteMoves=[];
            colorMoves=[];
            dice = obj.getDice();
            total = dice(5)+dice(6);
            maxValues=[max(obj.player.board.red),max(obj.player.board.yellow),max(obj.player.board.green),max(obj.player.board.blue)];
            
            %If its the player turn they have extra possible moves
            if(playerTurn)
                colorValues=[[dice(1)+dice(5),dice(1)+dice(6)],[dice(2)+dice(5),dice(2)+dice(6)],[dice(3)+dice(5),dice(3)+dice(6)],[dice(4)+dice(5),dice(4)+dice(6)]];
                for(i=1:1:length(maxValues))
                    for(j=1:1:2)
                        if(maxValues(i)<colorValues(j+i*2-2))
                            colorMoves=[colorMoves,i*10+colorValues(j+i*2-2)];
                        end
                    end
                end
            end
            
            %Generalized move list for all players
            for (i=1:1:length(maxValues))
                if(total>maxValues(i))
                    whiteMoves=[whiteMoves,i*10+total];
                end
            end
        end
        
    end
    methods (Static)
        
        %Get what players turn it currently is
        function currentValsTurns = getCurrentValuesT()
            currentValsTurns = thingSpeakRead(game.channelIDTurn,'Readkey',game.readKeyTurn);
        end
        
    end
end