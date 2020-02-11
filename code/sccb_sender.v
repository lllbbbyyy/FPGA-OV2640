module sccb_sender(
    input clk,//时钟信号，传入25MHz,内部自行分频
    input rst,//复位信号，高电平有效
    inout sio_d,
    output reg sio_c,
    input reg_ok,//说明reg_init模块已经完成，可以发送下一个数据
    output reg sccb_ok=0,//向外传输，告诉reg_init sccb已经发送完毕
    input [7:0]slave_id,
    input [7:0]reg_addr,
    input [7:0]value
);
    reg [20:0]count=0;//计数器
    
    always @ (posedge clk)
    begin
        if(count==0)
            count<=reg_ok;//当reg_ok有效时，开始计数，否则为0，一直等待
        else
            if(count[20:11]==31)//31个周期
                count<=0;
            else
                count<=count+1;
    end

    always @ (posedge clk)
    begin
        sccb_ok<=(count==0)&&(reg_ok==1);
    end

    reg sio_d_send;//发送信号
    always @ (posedge clk)
    begin
        if(count[20:11]==0)
            sio_c<=1;
        else if(count[20:11]==1)
        begin
            if(count[10:9]==2'b11)//设置缓冲延时
                sio_c<=0;
            else
                sio_c<=1;
        end
        else if(count[20:11]==29)
        begin
            if(count[10:9]==2'b00)
                sio_c<=0;
            else
                sio_c<=1;
        end
        else if(count[20:11]==30||count[20:11]==31)
            sio_c<=1;
        else//产生分布均匀的时钟信号
        begin
            if(count[10:9]==2'b00)
                sio_c<=0;
            else if(count[10:9]==2'b01)
                sio_c<=1;
            else if(count[10:9]==2'b01)
                sio_c<=1;
            else if(count[10:9]==2'b11)
                sio_c<=0;
        end
    end

    always @ (posedge clk)
    begin
        if(count[20:11]==10||count[20:11]==19||count[20:11]==28)
            sio_d_send<=0;//此时为ack时间，don't care位
        else
            sio_d_send<=1;
    end

    reg [31:0] data_temp;
    always @ (posedge clk)
    begin
        if(rst)
            data_temp<=32'hffffffff;
        else
        begin
            if(count==0&&reg_ok==1)
                data_temp<={2'b10,slave_id,1'bx,reg_addr,1'bx,value,1'bx,3'b011};
            else if(count[10:0]==0)
                data_temp<={data_temp[30:0],1'b1};//串行赋值法
        end
    end

    assign sio_d=sio_d_send?data_temp[31]:'bz;
endmodule