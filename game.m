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
            
            status=thingSpeakRead(obj.channelIDStatus,'ReadKey',obj.readKeyStatus);
            
            %Check that a move is valid and if so tell the game a move was
            %made and tell the board a move was made.
            switch color
                case "red"
                    if(~status(1))
                        if(ismember(10+position,whiteMoves)&&~obj.madeWhiteMove)
                            if(position~=11)
                                obj.madeWhiteMove=true;
                                obj.player.board=obj.player.board.setValue(color,position);
                            else
                                total=obj.board.total("red");
                                if(total>=5)
                                    obj.madeWhiteMove=true;
                                    obj.player.board=obj.player.board.setValue(color,position);
                                    status(1)=1;
                                    thingSpeakWrite(obj.channelIDStatus,status,'WriteKey',obj.writeKeyStatus);
                                end
                            end
                        elseif(ismember(10+position,colorMoves))
                            if(position~=11)
                                obj.madeColorMove=true;
                                obj.player.board=obj.player.board.setValue(color,position);
                            else
                                total=obj.board.total("red");
                                if(total>=5)
                                    obj.madeColorMove=true;
                                    obj.player.board=obj.player.board.setValue(color,position);
                                    status(1)=1;
                                    thingSpeakWrite(obj.channelIDStatus,status,'WriteKey',obj.writeKeyStatus);
                                end
                            end
                        end
                    end
                case "yellow"
                    if(~status(2))
                        if(ismember(10+position,whiteMoves)&&~obj.madeWhiteMove)
                            if(postion~=11)
                                obj.madeWhiteMove=true;
                                obj.player.board=obj.player.board.setValue(color,position);
                            else
                                total=obj.board.total("yellow");
                                if(total>=5)
                                    obj.madeWhiteMove=true;
                                    obj.player.board=obj.player.board.setValue(color,position);
                                    status(2)=1;
                                    thingSpeakWrite(obj.channelIDStatus,status,'WriteKey',obj.writeKeyStatus);
                                end
                            end
                        elseif(ismember(20+position,colorMoves))
                            if(position~=11)
                                obj.madeColorMove=true;
                                obj.player.board=obj.player.board.setValue(color,position);
                            else
                                total=obj.board.total("yellow");
                                if(total>=5)
                                    obj.madeColorMove=true;
                                    obj.player.board=obj.player.board.setValue(color,position);
                                    status(2)=1;
                                    thingSpeakWrite(obj.channelIDStatus,status,'WriteKey',obj.writeKeyStatus);
                                end
                            end
                        end
                    end
                case "blue"
                    if(~status(3))
                        if(ismember(10+position,whiteMoves)&&~obj.madeWhiteMove)
                            if(position~=11)
                                obj.madeWhiteMove=true;
                                obj.player.board=obj.player.board.setValue(color,position);
                            else
                                total=obj.board.total("blue");
                                if(total>=5)
                                    obj.madeWhiteMove=true;
                                    obj.player.board=obj.player.board.setValue(color,position);
                                    status(3)=1;
                                    thingSpeakWrite(obj.channelIDStatus,status,'WriteKey',obj.writeKeyStatus);
                                end
                            end
                        elseif(ismember(30+position,colorMoves))
                            if(position~=11)
                                obj.madeColorMove=true;
                                obj.player.board=obj.player.board.setValue(color,position);
                            else
                                total=obj.board.total("blue");
                                if(total>=5)
                                    obj.madeColorMove=true;
                                    obj.player.board=obj.player.board.setValue(color,position);
                                    status(3)=1;
                                    thingSpeakWrite(obj.channelIDStatus,status,'WriteKey',obj.writeKeyStatus);
                                end
                            end
                        end
                    end
                case "green"
                    if(~status(4))
                        if(ismember(10+position,whiteMoves)&&~obj.madeWhiteMove)
                            if(position~=11)
                                obj.madeWhiteMove=true;
                                obj.player.board=obj.player.board.setValue(color,position);
                            else
                                total=obj.board.total("green");
                                if(total>=5)
                                    obj.madeWhiteMove=true;
                                    obj.player.board=obj.player.board.setValue(color,position);
                                    status(4)=1;
                                    thingSpeakWrite(obj.channelIDStatus,status,'WriteKey',obj.writeKeyStatus);
                                end
                            end
                        elseif(ismember(40+position,colorMoves))
                            if(position~=11)
                                obj.madeColorMove=true;
                                obj.player.board=obj.player.board.setValue(color,position);
                            else
                                total=obj.board.total("green");
                                if(total>=5)
                                    obj.madeColorMove=true;
                                    obj.player.board=obj.player.board.setValue(color,position);
                                    status(4)=1;
                                    thingSpeakWrite(obj.channelIDStatus,status,'WriteKey',obj.writeKeyStatus);
                                end
                            end
                        end
                    end
            end
        end
        
        %If the player hasn't made a move, see if said move is a valid move
        function obj = makeMove(obj,color,position)
            temp=obj.getCurrentTurn();
            if((~obj.madeWhiteMove||temp==obj.player.playerTurn)&&~obj.madeColorMove)
                obj=obj.pressed(color,position,temp==obj.player.playerTurn);
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
        
        function obj = newTurn(obj)
            currentTurn=getCurrentValuesT();
            if(obj.player.playerTurn==currentTurn(7))
                if(~obj.madeColorMove||~obj.madeWhiteMove)
                    obj.player.board.incrementPenalties();
                end
                %Needs to be fully implemented.
                newTurn=currentTurn(7)+1;
                thingSpeakWrite(obj.channelIDTurn,[randi(6,1,6),newTurn,'WriteKey',obj.writeKeyTurn);
            end
            obj.madeWhiteMove=false;
            obj.madeColorMove=false;
        end
    end
    methods (Static)
        
        %Get what players turn it currently is
        function currentValsTurns = getCurrentValuesT()
            currentValsTurns = thingSpeakRead(game.channelIDTurn,'Readkey',game.readKeyTurn);
        end
        
    end
end