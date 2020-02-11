module bluetooth(
    input clk,
    input rst,
    input get,
    output reg [7:0] out
);
    parameter bps=10417;//对应9600波特率
    reg [14:0] count_1;//每一位中的计数器
    reg [3:0] count_2;//每一组数据的计数器
    reg buffer_0,buffer_1,buffer_2;//除去滤波
    wire buffer_en;//检测到边沿
    reg add_en;//加法使能信号

    always @ (posedge clk)
    begin
        if(rst)
        begin
            buffer_0<=1;
            buffer_1<=1;
            buffer_2<=1;
        end
        else
        begin
            buffer_0<=get;
            buffer_1<=buffer_0;
            buffer_2<=buffer_1;
        end
    end

    assign buffer_en=buffer_2&~buffer_1;

    always @ (posedge clk)
    begin
        if(rst)
        begin
            count_1<=0;
        end
        else if(add_en)
        begin
            if(count_1==bps-1)
            begin
                count_1<=0;
            end
            else
            begin
                count_1<=count_1+1;
            end
        end
    end

    always @ (posedge clk)
    begin
        if(rst)
        begin
            count_2<=0;
        end
        else if(add_en&&count_1==bps-1)//如果每一位加
        begin
            if(count_2==8)
            begin
                count_2<=0;
            end
            else
            begin
                count_2<=count_2+1;
            end
        end
    end

    always @ (posedge clk)
    begin
        if(rst)
        begin
            add_en<=0;
        end
        else if(buffer_en)
        begin
            add_en<=1;
        end
        else if(add_en&&count_2==8&&count_1==bps-1)
        begin
            add_en<=0;
        end
    end
    
    always @ (posedge clk)
    begin
        if(rst)
        begin
            out<=0;
        end
        else if(add_en&&count_1==bps/2-1&&count_2!=0)
        begin
            out[count_2-1]<=get;
        end
    end
    
endmodule