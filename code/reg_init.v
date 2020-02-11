module reg_init(
    input clk,
    input rst,
    output reg [15:0]data_out,
    output reg_ok,
    input sccb_ok
);
    parameter num_reg=175+1;
    reg [10:0] count=0;

    always @ (posedge clk)
    begin
        if(rst)
            count<=0;
        else if(reg_ok&&sccb_ok)
            count<=count+1;
    end

    assign reg_ok=count<=num_reg;

    always @ (posedge clk)
    case (count)
    8'h00:
    data_out <= 16'hFF01;
    8'h01 :
    data_out <= 16'h1280;
    8'h02 :
    data_out <= 16'hFF00;
    8'h03 :
    data_out <= 16'h2CFF;
    8'h04 :
    data_out <= 16'h2EDF;
    8'h05 :
    data_out <= 16'hFF01;
    8'h06 :
    data_out <= 16'h3C32;
    8'h07 :
    data_out <= 16'h1101;
    8'h08 :
    data_out <= 16'h0902;
    8'h09 :
    data_out <= 16'h0420;
    8'h0A :
    data_out <= 16'h13E5;
    8'h0B :
    data_out <= 16'h1448;
    8'h0C :
    data_out <= 16'h2C0C;
    8'h0D :
    data_out <= 16'h3378;
    8'h0E :
    data_out <= 16'h3A33;
    8'h0F :
    data_out <= 16'h3BFB;
    8'h10 :
    data_out <= 16'h3E00;
    8'h11 :
    data_out <= 16'h4311;
    8'h12 :
    data_out <= 16'h1610;
    8'h13 :
    data_out <= 16'h3992;
    8'h14 :
    data_out <= 16'h35DA;
    8'h15 :
    data_out <= 16'h221A;
    8'h16 :
    data_out <= 16'h37C3;
    8'h17 :
    data_out <= 16'h2300;
    8'h18 :
    data_out <= 16'h34C0;
    8'h19 :
    data_out <= 16'h361A;
    8'h1A :
    data_out <= 16'h0688;
    8'h1B :
    data_out <= 16'h07C0;
    8'h1C :
    data_out <= 16'h0D87;
    8'h1D :
    data_out <= 16'h0E41;
    8'h1E :
    data_out <= 16'h4C00;
    8'h1F :
    data_out <= 16'h4800;
    8'h20 :
    data_out <= 16'h5B00;
    8'h21 :
    data_out <= 16'h4203;
    8'h22 :
    data_out <= 16'h4A81;
    8'h23 :
    data_out <= 16'h2199;
    8'h24 :
    data_out <= 16'h2440;
    8'h25 :
    data_out <= 16'h2538;
    8'h26 :
    data_out <= 16'h2682;
    8'h27 :
    data_out <= 16'h5C00;
    8'h28 :
    data_out <= 16'h6300;
    8'h29 :
    data_out <= 16'h4600;
    8'h2A :
    data_out <= 16'h0C3C;
    8'h2B :
    data_out <= 16'h6170;
    8'h2C :
    data_out <= 16'h6280;
    8'h2D :
    data_out <= 16'h7C05;
    8'h2E :
    data_out <= 16'h2080;
    8'h2F :
    data_out <= 16'h2830;
    8'h30 :
    data_out <= 16'h6C00;
    8'h31 :
    data_out <= 16'h6D80;
    8'h32 :
    data_out <= 16'h6E00;
    8'h33 :
    data_out <= 16'h7002;
    8'h34 :
    data_out <= 16'h7194;
    8'h35 :
    data_out <= 16'h73C1;
    8'h36 :
    data_out <= 16'h1240;
    8'h37 :
    data_out <= 16'h1711;
    8'h38 :
    data_out <= 16'h1839;
    8'h39 :
    data_out <= 16'h1900;
    8'h3A :
    data_out <= 16'h1A3C;
    8'h3B :
    data_out <= 16'h3209;
    8'h3C :
    data_out <= 16'h37C0;
    8'h3D :
    data_out <= 16'h4FCA;
    8'h3E :
    data_out <= 16'h50A8;
    8'h3F :
    data_out <= 16'h5A23;
    8'h40 :
    data_out <= 16'h6D00;
    8'h41 :
    data_out <= 16'h3D38;
    8'h42 :
    data_out <= 16'hFF00;
    8'h43 :
    data_out <= 16'hE57F;
    8'h44 :
    data_out <= 16'hF9C0;
    8'h45 :
    data_out <= 16'h4124;
    8'h46 :
    data_out <= 16'hE014;
    8'h47 :
    data_out <= 16'h76FF;
    8'h48 :
    data_out <= 16'h33A0;
    8'h49 :
    data_out <= 16'h4220;
    8'h4A :
    data_out <= 16'h4318;
    8'h4B :
    data_out <= 16'h4C00;
    8'h4C :
    data_out <= 16'h87D5;
    8'h4D :
    data_out <= 16'h883F;
    8'h4E :
    data_out <= 16'hD703;
    8'h4F :
    data_out <= 16'hD910;
    8'h50 :
    data_out <= 16'hD382;
    8'h51 :
    data_out <= 16'hC808;
    8'h52 :
    data_out <= 16'hC980;
    8'h53 :
    data_out <= 16'h7C00;//////
    8'h54 :
    data_out <= 16'h7D00;///////
    8'h55 :
    data_out <= 16'h7C03;////////
    8'h56 :
    data_out <= 16'h7D48;/////////
    8'h57 :
    data_out <= 16'h7D48;/////////
    8'h58 :
    data_out <= 16'h7C08;////////
    8'h59 :
    data_out <= 16'h7D20;
    8'h5A :
    data_out <= 16'h7D10;
    8'h5B :
    data_out <= 16'h7D0E;
    8'h5C :
    data_out <= 16'h9000;
    8'h5D :
    data_out <= 16'h910E;
    8'h5E :
    data_out <= 16'h911A;
    8'h5F :
    data_out <= 16'h9131;
    8'h60 :
    data_out <= 16'h915A;
    8'h61 :
    data_out <= 16'h9169;
    8'h62 :
    data_out <= 16'h9175;
    8'h63 :
    data_out <= 16'h917E;
    8'h64 :
    data_out <= 16'h9188;
    8'h65 :
    data_out <= 16'h918F;
    8'h66 :
    data_out <= 16'h9196;
    8'h67 :
    data_out <= 16'h91A3;
    8'h68 :
    data_out <= 16'h91AF;
    8'h69 :
    data_out <= 16'h91C4;
    8'h6A :
    data_out <= 16'h91D7;
    8'h6B :
    data_out <= 16'h91E8;
    8'h6C :
    data_out <= 16'h9120;
    8'h6D :
    data_out <= 16'h9200;
    8'h6E :
    data_out <= 16'h9306;
    8'h6F :
    data_out <= 16'h93E3;
    8'h70 :
    data_out <= 16'h9305;
    8'h71 :
    data_out <= 16'h9305;
    8'h72 :
    data_out <= 16'h9300;
    8'h73 :
    data_out <= 16'h9304;
    8'h74 :
    data_out <= 16'h9300;
    8'h75 :
    data_out <= 16'h9300;
    8'h76 :
    data_out <= 16'h9300;
    8'h77 :
    data_out <= 16'h9300;
    8'h78 :
    data_out <= 16'h9300;
    8'h79 :
    data_out <= 16'h9300;
    8'h7A :
    data_out <= 16'h9300;

    8'h7B :
    data_out <= 16'h9600;
    8'h7C :
    data_out <= 16'h9708;
    8'h7D :
    data_out <= 16'h9719;
    8'h7E :
    data_out <= 16'h9702;
    8'h7F :
    data_out <= 16'h970C;
    8'h80 :
    data_out <= 16'h9724;
    8'h81 :
    data_out <= 16'h9730;
    8'h82 :
    data_out <= 16'h9728;
    8'h83 :
    data_out <= 16'h9726;
    8'h84 :
    data_out <= 16'h9702;
    8'h85 :
    data_out <= 16'h9798;
    8'h86 :
    data_out <= 16'h9780;
    8'h87 :
    data_out <= 16'h9700;
    8'h88 :
    data_out <= 16'h9700;
    8'h89 :
    data_out <= 16'hC3ED;
    8'h8A :
    data_out <= 16'hA400;
    8'h8B :
    data_out <= 16'hA800;///////
    8'h8C :
    data_out <= 16'hC511;////////
    8'h8D :
    data_out <= 16'hC651;/////////
    8'h8E :
    data_out <= 16'hBF80;/////////
    8'h8F :
    data_out <= 16'hC710;////////
    8'h90 :
    data_out <= 16'hB666;
    8'h91 :
    data_out <= 16'hB8A5;
    8'h92 :
    data_out <= 16'hB764;
    8'h93 :
    data_out <= 16'hB97C;
    8'h94 :
    data_out <= 16'hB3AF;
    8'h95 :
    data_out <= 16'hB497;
    8'h96 :
    data_out <= 16'hB5FF;
    8'h97 :
    data_out <= 16'hB0C5;
    8'h98 :
    data_out <= 16'hB194;
    8'h99 :
    data_out <= 16'hB20F;
    8'h9A :
    data_out <= 16'hC45C;
    8'h9B :
    data_out <= 16'hC050;
    8'h9C :
    data_out <= 16'hC13C;
    8'h9D :
    data_out <= 16'h8C00;
    8'h9E :
    data_out <= 16'h863D;
    8'h9F :
    data_out <= 16'h5000;
    8'hA0 :
    data_out <= 16'h51A0;
    8'hA1 :
    data_out <= 16'h5278;
    8'hA2 :
    data_out <= 16'h5300;
    8'hA3 :
    data_out <= 16'h5400;
    8'hA4 :
    data_out <= 16'h5500;
    8'hA5 :
    data_out <= 16'h5AA0;
    8'hA6 :
    data_out <= 16'h5B78;
    8'hA7 :
    data_out <= 16'h5C00;
    8'hA8 :
    data_out <= 16'hD382;
    8'hA9 :
    data_out <= 16'hC3ED;
    8'hAA :
    data_out <= 16'h7F00;
    8'hAB :
    data_out <= 16'hDA08;
    8'hAC :
    data_out <= 16'hE51F;
    8'hAD :
    data_out <= 16'hE167;
    8'hAE :
    data_out <= 16'hE000;
    8'hAF :
    data_out <= 16'hDD7F;
    8'hB0 :
    data_out <= 16'h0500;
    endcase
endmodule