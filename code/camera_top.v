module camera_top(
    input clk,//时钟信号100MHz
    input rst,//复位信号，高电平有效
    //摄像头接口
    output sio_c,
    inout sio_d,
    output reset,
    output pwdn,
    output xclk,
    input pclk,
    input href,
    input vsync,
    input [7:0]camera_data,
    //vga接口
    output [3:0]red_out,
    output [3:0]green_out,
    output [3:0]blue_out,
    output x_valid,
    output y_valid
);


    wire clk_vga,clk_init_reg;
    clk_wiz_0 div(.clk_in1(clk),.clk_out1(clk_vga),.clk_out2(clk_init_reg));//时钟分频，ip核
    camera_init init(.clk(clk_init_reg),.sio_c(sio_c),.sio_d(sio_d),.reset(reset),.pwdn(pwdn),.rst(rst),.xclk(xclk));
    
    wire [11:0]ram_data;
    wire wr_en;
    wire [18:0]ram_addr;
   camera_get_pic get_pic(.rst(rst),.pclk(pclk),.href(href),.vsync(vsync),.data_in(camera_data),.data_out(ram_data),.wr_en(wr_en),.out_addr(ram_addr));
    
    wire [11:0]rd_addr;
    wire [18:0]rd_data; 
    blk_mem_gen_0 buffer(.clka(clk),.ena(1),.wea(wr_en),.addra(ram_addr),.dina(ram_data),.clkb(clk),.enb(1),.addrb(rd_addr),.doutb(rd_data));
    vga_display vga(.clk_vga(clk_vga),.rst(rst),.color_data_in(rd_data),.ram_addr(rd_addr),.x_valid(x_valid),.y_valid(y_valid),.red(red_out),.green(green_out),.blue(blue_out));
endmodule