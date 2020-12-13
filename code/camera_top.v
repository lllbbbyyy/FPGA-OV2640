module camera_top(
        //摄像头对外接口
        output       sio_c,//摄像头sio_c信号
        inout        sio_d,//摄像头sio_d信号
        output       reset,//reset信号，需要拉高，否则会重置寄存器
        output       pwdn,//pwdn信号，拉低，关闭耗电模式
        output       xclk,//xclk信号，可不接
        input        pclk,href,vsync,//用于控制图像数据传输的三组信号
        input  [7:0] camera_data ,//图像数据信号
        //VGA对外接口
        output [3:0]  red_out,green_out,blue_out,//rgb像素信息
        output x_valid,//行时序信号
        output y_valid,//场时序信号
        //时钟
        input  clk,//接板内始终，100mhz
        //复位接口
        input rst,//高电平有效
        //蓝牙串口
        input get_bluetooth,//接pmod
        //数码管接口
        output [6:0] display//对应数码管接口
    );

    wire [7:0]out_bluetooth;//蓝牙数据传输
    bluetooth bt(.clk(clk),.rst(rst),.get(get_bluetooth),.out(out_bluetooth));

    display7 dis(.iData(out_bluetooth[3:0]),.oData(display));
    wire clk_vga ;//vga时钟 24mhz
    wire clk_init_reg;//初始化寄存器的时钟，25mhz

    clk_wiz_0 div(.clk_in1(clk),.clk_out1(clk_vga),.clk_out2(clk_init_reg));

    camera_init init(.clk(clk_init_reg),.sio_c(sio_c),.sio_d(sio_d),.reset(reset),.pwdn(pwdn),.rst(rst),.xclk(xclk));

    wire [11:0] ram_data;//写数据
    wire  wr_en;//缓存写有效
    wire [18:0] ram_addr;//写地址
    camera_get_pic get_pic(.rst(rst),.pclk(pclk),.href(href),.vsync(vsync),.data_in(camera_data),.data_out(ram_data),.wr_en(wr_en),.out_addr(ram_addr));

    wire [11:0]   rd_data;//读数据
    wire [18:0]   rd_addr;//读地址

   blk_mem_gen_0 buffer(.clka(clk),.ena(1),.wea(wr_en),.addra(ram_addr),.dina(ram_data),.clkb(clk),.enb(1),.addrb(rd_addr),.doutb(rd_data));

    wire [11:0]deald_color;//处理后的数据信号
    deal_pic deal(.clk(clk),.in_rgb(rd_data),.oper(out_bluetooth),.out_rgb(deald_color));
    vga_display vga(.clk_vga(clk_vga),.rst(rst),.color_data_in(deald_color),.ram_addr(rd_addr),.x_valid(x_valid),.y_valid(y_valid),.red(red_out),.green(green_out),.blue(blue_out));
    
endmodule
