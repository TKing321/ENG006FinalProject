classdef player
    
    properties
        playerTurn
        board
    end
    
    methods
        
        function obj = player(main)
            obj.board=board();
            temp=thingSpeakRead(main.channelIDStatus,'Readkey',main.readKeyStatus);
            obj.playerTurn=temp(6)+1;
            temp(6)=temp(6)+1;
            thingSpeakWrite(main.channelIDStatus,temp,'Writekey',main.writeKeyStatus);
        end
        
        function total = getPlayerScore(obj)
            temp=obj.board.total("red");
            for(i=1:1:temp)
                total=total+i;
            end
            temp=obj.board.total("yellow");
            for(i=1:1:temp)
                total=total+i;
            end
            temp=obj.board.total("blue");
            for(i=1:1:temp)
                total=total+i;
            end
            temp=obj.board.total("green");
            for(i=1:1:temp)
                total=total+i;
            end
            total=total-(5*obj.board.playerPenalties);
        end
        
    end
    
end