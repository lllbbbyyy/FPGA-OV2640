module camera_get_pic (
    input rst,
    input pclk,
    input href,
    input vsync,
    input [7:0]data_in,//摄像头D[9]到D[2]
    output reg[11:0]data_out,//一个像素点的数据
    output reg wr_en,//处理完毕，写有效使能
    output reg[18:0]out_addr=0//缓存位置
    );


    reg [15:0] rgb565 = 0;
    reg  [18:0] next_addr = 0;
    reg [1:0] status = 0;//每两组数据组合成一个rgb信息，利用一个两位的status不断地移位运算
    
    
    always@ (posedge pclk)
        begin
        if(vsync == 0)//高电平有效
            begin
                out_addr <=0;
                next_addr <= 0;
                status=0;
            end
        else
            begin
                data_out <= {rgb565[15:12],rgb565[10:7],rgb565[4:1]};
                out_addr <= next_addr;
                wr_en <= status[1];
                status <= {status[0], (href && !status[0])};//都是高电平有效
                rgb565 <= {rgb565[7:0], data_in};
                    
                if(status[1] == 1)
                    begin
                        next_addr <= next_addr+1;
                    end
                end
        end

endmodule