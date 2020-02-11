//用于控制当前的位置信号，保证信号可以正确显示到显示屏的正确位置
module vga_control(
    input vga_clk,//时钟周期
    input rst,//清零信号，高电平有效
    output reg[11:0] x_poi,//输出此时x的坐标
    output reg[11:0] y_poi,//输出此时y的坐标
    output is_display,//表征此时是否能够输出
    output x_valid,//行有效信号`
    output y_valid//列有效信号
);
    //行参数
    parameter x_sync=11'd96;
    parameter x_before=11'd144;
    parameter x_beside_after=11'd784;
    parameter x_all=11'd800;
    //列参数
    parameter y_sync=11'd2;
    parameter y_before=11'd35;
    parameter y_beside_after=11'd515;
    parameter y_all=11'd525;
    //
    assign is_display=((x_poi>=x_before)&&(x_poi<x_beside_after)
    &&(y_poi>=y_before)&&(y_poi<y_beside_after))?1:0;
    
    assign x_valid=(x_poi<x_sync)?0:1;//行同步信号拉低时段
    assign y_valid=(y_poi<y_sync)?0:1;//场同步信号拉低时段
    
    always @ (posedge vga_clk)//判断此时是否可以进行绘制图像
    begin
        if(rst)//清零信号
        begin
            x_poi<=0;
            y_poi<=0;
        end
        else
        begin
            if(x_poi==x_all-1)
            begin
                x_poi<=0;
                if(y_poi==y_all-1)
                begin
                    y_poi<=0;
                end
                else
                begin
                    y_poi<=y_poi+1;
                end
            end
            else
            begin
                x_poi<=x_poi+1;
            end
        end
    end
endmodule