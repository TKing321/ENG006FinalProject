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
        playerNumber;
        board=board();
        madeMove=false;
    end
    
    methods 
        function obj = main()
            temp=thingSpeakRead(main.channelIDStatus,'Readkey',main.readKeyStatus);
            obj.playerNumber=temp(6)+1;
            temp(6)=temp(6)+1;
            thingSpeakWrite(main.channelIDStatus,temp,'Writekey',main.writeKeyStatus);
        end
        function moves = getValidMoves(obj)
            moves=[];
            dice = obj.getDice();
            playerTurn = (obj.getPlayerTurn()==obj.playerNumber());
            disp(dice);
            total = dice(5)+dice(6);
            maxValues=[max(obj.board.red),max(obj.board.yellow),max(obj.board.green),max(obj.board.blue)];
            if(playerTurn)
                totalRed=[dice(1)+dice(5),dice(1)+dice(6)];
                if(maxValues(1)<totalRed(1))
                    moves=[moves,10+totalRed(1)];
                end
                if(maxValues(1)<totalRed(2))
                    moves=[moves,10+totalRed(2)];
                end
                totalYellow=[dice(2)+dice(5),dice(2)+dice(6)];
                if(maxValues(1)<totalYellow(1))
                    moves=[moves,20+totalYellow(1)];
                end
                if(maxValues(1)<totalYellow(2))
                    moves=[moves,20+totalYellow(2)];
                end
                totalBlue=[dice(3)+dice(5),dice(3)+dice(6)];
                if(maxValues(1)<totalBlue(1))
                    moves=[moves,30+totalBlue(2)];
                end
                if(maxValues(1)<totalBlue(2))
                    moves=[moves,30+totalBlue(2)];
                end
                totalGreen=[dice(4)+dice(5),dice(4)+dice(6)];
                if(maxValues(1)<totalGreen(1))
                    moves=[moves,40+totalGreen(1)];
                end
                if(maxValues(1)<totalGreen(2))
                    moves=[moves,40+totalGreen(2)];
                end
            end
            for (i=1:1:length(maxValues))
                if(total>maxValues(i))
                    moves=[moves,i*10+total];
                end
            end
        end
        function obj = pressed(obj,color,position)
            moves = obj.getValidMoves();
            switch color
                case "red"
                    if(ismember(10+position,moves))
                        obj.madeMove=true;
                        obj.board.setValue(color,position);
                    end
                case "yellow"
                    if(ismember(20+position,moves))
                        obj.madeMove=true;
                        obj.board.setValue(color,position);
                    end
                case "blue"
                    if(ismember(30+position,moves))
                        obj.madeMove=true;
                        obj.board.setValue(color,position);
                    end
                case "green"
                    if(ismember(40+position,moves))
                        obj.madeMove=true;
                        obj.board.setValue(color,position);
                    end
            end
        end
    end
    methods (Static)
        function dice = getDice()
            dice = main.getCurrentValuesT();
        end
        function playerTurn = getPlayerTurn()
            var = main.getCurrentValuesT();
            playerTurn=var(7);
        end
        function [] = pushRolls()
            temp=main.getDice();
            thingSpeakWrite(main.channelIDTurn,[randi(6,6,1)',temp(7)],'Writekey',main.writeKeyTurn);
        end
        function currentValsTurns = getCurrentValuesT()
            currentValsTurns = thingSpeakRead(main.channelIDTurn,'Readkey',main.readKeyTurn);
        end
    end
end