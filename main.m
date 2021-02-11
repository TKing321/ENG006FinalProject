classdef main
    properties (Constant)
        writeKeyTurn = 'NGW99VVOQPSVSISN';
        readKeyTurn = '5RYFWLGNF8I4GSQU';
        channelIDTurn = 1302152;
        
        writeKeyStatus = '5PMM9O7QNFYBH0OH';
        readKeyStatus = 'DCJX3N1VGVPW10I7';
        channelIDStatus = 1302961;
          
    end
    properties
        madeMove=false;
    end
    
    methods 
        function obj = main()
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
        
        function dice = getDice(obj)
            dice = obj.getCurrentValuesT();
        end
        
        function pushRolls(obj)
            temp = obj.getDice();
            thingSpeakWrite(obj.channelIDTurn,[randi(6,6,1)',temp(7)],'Writekey',obj.writeKeyTurn);
        end
        
        function currentValsTurns = getCurrentValuesT(obj)
            currentValsTurns = thingSpeakRead(obj.channelIDTurn,'Readkey',obj.readKeyTurn);
        end
    end
end