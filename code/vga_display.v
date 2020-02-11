module vga_display(
    input clk_vga,//输入vga的时钟，频率为25.175MHz
    input rst,//复位信号，高电平有效
    input [11:0] color_data_in,//从RAM中读取的像素信息
    output reg[18:0] ram_addr,//应该读取的RAM的图片地址，由vga_control给出
    output x_valid,
    output y_valid,
    output reg[3:0] red,
    output reg[3:0] blue,
    output reg[3:0] green
);
    parameter x_before=11'd144;
    parameter y_before=11'd35;
    parameter x_size_pic=11'd640;
    parameter y_size_pic=11'd480;
    
    wire [11:0] x_poi;//输出此时x的坐标
    wire [11:0] y_poi;//输出此时y的坐标
    wire is_display;//表征此时是否能够输出

    vga_control control(clk_vga,rst,x_poi,y_poi,is_display,x_valid,y_valid);

    always@ (*)
    begin
        red=0;
        blue=0;
        green=0;
        if(is_display)
        begin
            if(x_poi-x_before<=x_size_pic&&y_poi-y_before<=y_size_pic)
            begin
            ram_addr=(y_poi-y_before)*x_size_pic+(x_poi-x_before);
            red=color_data_in[11:8];
            green=color_data_in[7:4];
            blue=color_data_in[3:0];
            end
            else
            begin
            red=0;
            green=0;
            blue=0;
            end
        end
    end
endmodule