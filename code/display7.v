module display7(input [3:0] iData,
    output reg [6:0] oData
    );
    always @(*)
    begin
        if(iData==0)
            oData=7'b1000000;
        else if(iData==1)
            oData=7'b1111001;
        else if(iData==2)
            oData=7'b0100100;
        else if(iData==3)
            oData=7'b0110000;
        else if(iData==4)
            oData=7'b0011001;
        else if(iData==5)
            oData=7'b0010010;
        else if(iData==6)
            oData=7'b0000010;
        else if(iData==7)
            oData=7'b1111000;  
        else if(iData==8)
            oData=7'b0000000;  
        else if(iData==9)
            oData=7'b0010000;                                                      
    end
endmodule