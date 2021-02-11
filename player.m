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
        
    end
    
end