classdef game
    
    properties (Constant)
        
        %Channel writing numbers
        writeKeyTurn = 'NGW99VVOQPSVSISN';
        readKeyTurn = '5RYFWLGNF8I4GSQU';
        channelIDTurn = 1302152;
        
        writeKeyStatus = '5PMM9O7QNFYBH0OH';
        readKeyStatus = 'DCJX3N1VGVPW10I7';
        channelIDStatus = 1302961;
          
    end
    
    properties
        
        %Each game has a player class that contains the board and player
        %number. It also has the moves for the player that can happen.
        player;
        madeColorMove;
        madeWhiteMove;
        
        aPlayer
        
    end
    
    
    
    methods
        
        %Constructor for the game class. Each game has a player and if the
        %player has made a move this turn.
        function obj = game()
            obj.player=player(obj);
            obj.madeColorMove=false;
            obj.madeWhiteMove=false;
            [y, Fs] = audioread("8bit.mp3");
            obj.aPlayer = audioplayer(y,Fs);
            obj.aPlayer.StopFcn= @(src, event) play(src);
            play(obj.aPlayer);
        end
        
        %Function for when a specific key is pressed, takes the color press
        %and the position of the pressed key as well as if its the
        %player's turn.
        function [obj,success] = pressed(obj,color,position,playerTurn)
            
            success=false;
            
            %Gets the valid moves for the positions and then shifts them
            %because I'm too lazy to fix it, I think.
            [colorMoves,whiteMoves] = obj.getValidMoves(playerTurn);
            colorMoves=colorMoves-1;
            whiteMoves=whiteMoves-1;
            
            %Gets the  current values of the status channel so that it can
            %check if the rows are closed.
            status=thingSpeakRead(obj.channelIDStatus,'ReadKey',obj.readKeyStatus);
            
            %Code that checks if the move made is a valid move and then
            %makes the move if it is.
            switch color
                
                %Explanation will only be written for one chunck
                case "red"
                    %Checks to see if the rest row is open
                    if(~status(1))
                        %Checks if the move is a valid whitemove and a
                        %white move hasn't been made.
                        if(ismember(20+position,whiteMoves)&&~obj.madeWhiteMove)
                            %As long the position isn't the last one make
                            %the move.
                            if(position~=11)
                                obj.madeWhiteMove=true;
                                obj.player.board=obj.player.board.setValue(color,position);
                                success=true;
                            else
                                %If the move is the last one, check if
                                %there is at least 5 numbers marked to
                                %allow for the last one to be marked.
                                total=obj.player.board.total("red");
                                if(total>=5)
                                    %If the last one in a row is marked,
                                    %then close the row.
                                    obj.madeWhiteMove=true;
                                    obj.player.board=obj.player.board.setValue(color,position);
                                    obj.player.board=obj.player.board.setValue(color,position+1);
                                    status(1)=1;
                                    thingSpeakWrite(obj.channelIDStatus,status,'WriteKey',obj.writeKeyStatus);
                                    success=true;
                                end
                            end
                        elseif(ismember(20+position,colorMoves))
                            %Do the same thing as before but with the color
                            %move instead. See above explanation
                            if(position~=11)
                                obj.madeColorMove=true;
                                obj.player.board=obj.player.board.setValue(color,position);
                                success=true;
                            else
                                total=obj.player.board.total("red");
                                if(total>=5)
                                    obj.madeColorMove=true;
                                    obj.player.board=obj.player.board.setValue(color,position);
                                    obj.player.board=obj.player.board.setValue(color,position+1);
                                    status(1)=1;
                                    thingSpeakWrite(obj.channelIDStatus,status,'WriteKey',obj.writeKeyStatus);
                                    success=true;
                                end
                            end
                        end
                    end
                case "yellow"
                    if(~status(2))
                        if(ismember(40+position,whiteMoves)&&~obj.madeWhiteMove)
                            if(position~=11)
                                obj.madeWhiteMove=true;
                                obj.player.board=obj.player.board.setValue(color,position);
                                success=true;
                            else
                                total=obj.player.board.total("yellow");
                                if(total>=5)
                                    obj.madeWhiteMove=true;
                                    obj.player.board=obj.player.board.setValue(color,position);
                                    obj.player.board=obj.player.board.setValue(color,position+1);
                                    status(2)=1;
                                    thingSpeakWrite(obj.channelIDStatus,status,'WriteKey',obj.writeKeyStatus);
                                    success=true;
                                end
                            end
                        elseif(ismember(40+position,colorMoves))
                            if(position~=11)
                                obj.madeColorMove=true;
                                obj.player.board=obj.player.board.setValue(color,position);
                                success=true;
                            else
                                total=obj.player.board.total("yellow");
                                if(total>=5)
                                    obj.madeColorMove=true;
                                    obj.player.board=obj.player.board.setValue(color,position);
                                    obj.player.board=obj.player.board.setValue(color,position+1);
                                    status(2)=1;
                                    thingSpeakWrite(obj.channelIDStatus,status,'WriteKey',obj.writeKeyStatus);
                                    success=true;
                                end
                            end
                        end
                    end
                case "green"
                    if(~status(3))
                        if(ismember(60+position,whiteMoves)&&~obj.madeWhiteMove)
                            if(position~=11)
                                obj.madeWhiteMove=true;
                                obj.player.board=obj.player.board.setValue(color,position);
                                success=true;
                            else
                                total=obj.player.board.total("green");
                                if(total>=5)
                                    obj.madeWhiteMove=true;
                                    obj.player.board=obj.player.board.setValue(color,position);
                                    obj.player.board=obj.player.board.setValue(color,position+1);
                                    status(3)=1;
                                    thingSpeakWrite(obj.channelIDStatus,status,'WriteKey',obj.writeKeyStatus);
                                    success=true;
                                end
                            end
                        elseif(ismember(60+position,colorMoves))
                            if(position~=11)
                                obj.madeColorMove=true;
                                obj.player.board=obj.player.board.setValue(color,position);
                                success=true;
                            else
                                total=obj.player.board.total("green");
                                if(total>=5)
                                    obj.madeColorMove=true;
                                    obj.player.board=obj.player.board.setValue(color,position);
                                    obj.player.board=obj.player.board.setValue(color,position+1);
                                    status(3)=1;
                                    thingSpeakWrite(obj.channelIDStatus,status,'WriteKey',obj.writeKeyStatus);
                                    success=true;
                                end
                            end
                        end
                    end
                case "blue"
                    if(~status(4))
                        if(ismember(80+position,whiteMoves)&&~obj.madeWhiteMove)
                            if(position~=11)
                                obj.madeWhiteMove=true;
                                obj.player.board=obj.player.board.setValue(color,position);
                                success=true;
                            else
                                total=obj.player.board.total("blue");
                                if(total>=5)
                                    obj.madeWhiteMove=true;
                                    obj.player.board=obj.player.board.setValue(color,position);
                                    obj.player.board=obj.player.board.setValue(color,position+1);
                                    status(4)=1;
                                    thingSpeakWrite(obj.channelIDStatus,status,'WriteKey',obj.writeKeyStatus);
                                    success=true;
                                end
                            end
                        elseif(ismember(80+position,colorMoves))
                            if(position~=11)
                                obj.madeColorMove=true;
                                obj.player.board=obj.player.board.setValue(color,position);
                                success=true;
                            else
                                total=obj.player.board.total("blue");
                                if(total>=5)
                                    obj.madeColorMove=true;
                                    obj.player.board=obj.player.board.setValue(color,position);
                                    obj.player.board=obj.player.board.setValue(color,position+1);
                                    status(4)=1;
                                    thingSpeakWrite(obj.channelIDStatus,status,'WriteKey',obj.writeKeyStatus);
                                    success=true;
                                end
                            end
                        end
                    end
            end
        end
        
        
        %If the player hasn't made a move, see if said move is a valid move
        function [obj,success] = makeMove(obj,color,position)
            %This improves processing time by stopping the computer from
            %getting a move if the player can't make a move.
            temp=obj.getCurrentTurn();
            success=false;
            if((~obj.madeWhiteMove||temp==obj.player.playerTurn)&&~obj.madeColorMove)
                [obj,success]=obj.pressed(color,position,temp==obj.player.playerTurn);
            end
        end
        
        %Gets the current turn from thingspeak.
        function playerTurn = getCurrentTurn(obj)
            var = obj.getCurrentValuesT();
            playerTurn=var(7);
        end
        
        %Function that finds all of the valid moves.
        function [colorMoves,whiteMoves] = getValidMoves(obj,playerTurn)
            
            %Initialize necessary variables for calculations
            whiteMoves=[];
            colorMoves=[];
            dice = obj.getCurrentValuesT();
            total = dice(5)+dice(6);
            %The below code chunk need to be checked to make sure it works
            %as intended. 
            %This finds the last indice of the rows, you cant put a value
            %to the left of said number.
            maxValues=[obj.findMaxValue("red"),obj.findMaxValue("yellow"),14-obj.findMaxValue("green"),14-obj.findMaxValue("blue")];
            
            %If its the player turn they have extra possible moves that the
            %player can do.
            if(playerTurn)
                
                %This code needs to be checked that it functions as
                %intened.
                %This code goes through the possible dice combinations and
                %checks to see if they are greater than the the last number
                %marked in that row.
                colorValues=[[dice(1)+dice(5),dice(1)+dice(6)],[dice(2)+dice(5),dice(2)+dice(6)],[(dice(3)+dice(5)),(dice(3)+dice(6))],[(dice(4)+dice(5)),(dice(4)+dice(6))]];
                for(i=1:1:2)
                    for(j=1:1:2)
                        if(maxValues(i)<colorValues(j+i*2-2))
                            colorMoves=[colorMoves,i*20+colorValues(j+i*2-2)];
                        end
                    end
                end
                for(i=3:1:4)
                    for(j=1:1:2)
                        if(maxValues(i)>colorValues(j+i*2-2))
                            colorMoves=[colorMoves,i*20+14-colorValues(j+i*2-2)];
                        end
                    end
                end
            end
            
            %Generalized move list for all players
            %Implemented what I think will work, not perfectly sure
            for (i=1:1:length(maxValues))
                %If the color is Blue or Green
                if(i>2)
                    %Check if the value is less than the max
                    if(total<maxValues(i))
                        whiteMoves=[whiteMoves,i*20+14-total];
                    end
                else
                    if(total>maxValues(i))
                        whiteMoves=[whiteMoves,i*20+total];
                    end
                end
            end
        end
        
        function maxValue = findMaxValue(obj,color)
            if(obj.player.board.total(color)~=0)
                switch color
                    case "red"
                        maxValue=find(obj.player.board.red,1,'last')+1;
                    case "yellow"
                        maxValue=find(obj.player.board.yellow,1,'last')+1;
                    case "blue"
                        maxValue=find(obj.player.board.blue,1,'last')+1;
                    case "green"
                        maxValue=find(obj.player.board.green,1,'last')+1;
                end
            else
                maxValue=1;
            end
        end
        
        %This is the function for moving to the next turn
        function obj = newTurn(obj)
            %Checks if it is currently the players turn
            currentTurn=obj.getCurrentValuesT();
            if(obj.player.playerTurn==currentTurn(7))
                
                currentPlayers=obj.getCurrentValuesS();
                thingSpeakWrite(obj.channelIDStatus,[currentPlayers(1:6),1],'WriteKey',obj.writeKeyStatus);
                pause(1);
                
                %If its the players turn and they didn't make a move, add a
                %penalty
                if(~obj.madeColorMove&&~obj.madeWhiteMove)
                    obj.player.board=obj.player.board.incrementPenalties();
                end
                %Tells the game whos turn it is next
                if(obj.player.playerTurn==currentPlayers(6))
                    newTurn=1;
                else
                    newTurn=currentTurn(7)+1;
                end
                %Checks if the end conditions of the game have been met
                if(obj.player.board.totalPenalties==4||sum(currentPlayers(1:4))>=2)
                    thingSpeakWrite(obj.channelIDStatus,[currentPlayers(1:4),0,currentPlayers(6:7)],'WriteKey',obj.writeKeyStatus);
                    pause(1);
                end
                %Writes the new dice numbers and turn to the thingspeak
                %array
                thingSpeakWrite(obj.channelIDTurn,[randi(6,1,6),newTurn],'WriteKey',obj.writeKeyTurn);
            end
            %Runs the general start turn function for all players
            obj=obj.startTurn(obj.player.playerTurn==currentTurn(7));
        end
        
        function obj = startTurn(obj,playerTurn)
            %Waits a bit to let code run to end game
            pause(1);
            temp=obj.getCurrentValuesS();
            if(playerTurn)
                thingSpeakWrite(obj.channelIDStatus,[temp(1:6),0],'WriteKey',obj.writeKeyStatus);
            end
            while(temp(7)==1)
                temp=obj.getCurrentValuesS();
            end
            temp=obj.getCurrentValuesS();
            %If the game is over, run the function to end the game.
            if(temp(5)==0)
                obj.madeWhiteMove=true;
                obj.madeColorMove=true;
                return;
            end
            %Sets the moves amde to be false for a new turn.
            obj.madeWhiteMove=false;
            obj.madeColorMove=false;
        end
        %Function that runs at the end of the game. Unknown what features
        %are wanted in it yet.
        
        function obj = endGame(obj)
            pause(1);
            thingSpeakWrite(obj.channelIDStatus,[0,0,0,0,0,0,0],'WriteKey',obj.writeKeyStatus);
            pause(1);
            %clears sound once game has ended
            stop(obj.aPlayer);
        end
    end
    methods (Static)
        
        %Get the current values stored in the turn channel
        function currentValsTurns = getCurrentValuesT()
            currentValsTurns = thingSpeakRead(game.channelIDTurn,'Readkey',game.readKeyTurn);
        end
        
        %Get the current values stored in the status channel
        function currentValsStatus = getCurrentValuesS()
            currentValsStatus = thingSpeakRead(game.channelIDStatus,'Readkey',game.readKeyStatus);
        end
        
    end
end