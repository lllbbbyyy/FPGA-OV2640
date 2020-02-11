set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets pclk];     

set_property PACKAGE_PIN  J15  [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

set_property PACKAGE_PIN  E3  [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

set_property PACKAGE_PIN  H16  [get_ports sio_c]
set_property IOSTANDARD LVCMOS33 [get_ports sio_c]

set_property PULLUP TRUE [get_ports sio_d]
set_property PACKAGE_PIN  H14  [get_ports sio_d]
set_property IOSTANDARD LVCMOS33 [get_ports sio_d]

set_property PACKAGE_PIN  D17  [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

set_property PACKAGE_PIN  C17  [get_ports pwdn]
set_property IOSTANDARD LVCMOS33 [get_ports pwdn]

set_property PACKAGE_PIN  F16  [get_ports xclk]
set_property IOSTANDARD LVCMOS33 [get_ports xclk]

set_property PACKAGE_PIN  F13  [get_ports pclk]
set_property IOSTANDARD LVCMOS33 [get_ports pclk]

set_property PACKAGE_PIN  G16  [get_ports href]
set_property IOSTANDARD LVCMOS33 [get_ports href]

set_property PACKAGE_PIN  G13  [get_ports vsync]
set_property IOSTANDARD LVCMOS33 [get_ports vsync]

set_property PACKAGE_PIN  D18  [get_ports {camera_data[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {camera_data[0]}]

set_property PACKAGE_PIN  E17  [get_ports {camera_data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {camera_data[1]}]

set_property PACKAGE_PIN  E18  [get_ports {camera_data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {camera_data[2]}]

set_property PACKAGE_PIN  F18  [get_ports {camera_data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {camera_data[3]}]

set_property PACKAGE_PIN  G17  [get_ports {camera_data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {camera_data[4]}]

set_property PACKAGE_PIN  G18  [get_ports {camera_data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {camera_data[5]}]

set_property PACKAGE_PIN  D14  [get_ports {camera_data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {camera_data[6]}]

set_property PACKAGE_PIN  E16  [get_ports {camera_data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {camera_data[7]}]

set_property PACKAGE_PIN  A3  [get_ports {red_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red_out[0]}]

set_property PACKAGE_PIN  B4  [get_ports {red_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red_out[1]}]

set_property PACKAGE_PIN  C5  [get_ports {red_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red_out[2]}]

set_property PACKAGE_PIN  A4  [get_ports {red_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red_out[3]}]

set_property PACKAGE_PIN  C6  [get_ports {green_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green_out[0]}]

set_property PACKAGE_PIN  A5  [get_ports {green_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green_out[1]}]

set_property PACKAGE_PIN  B6  [get_ports {green_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green_out[2]}]

set_property PACKAGE_PIN  A6  [get_ports {green_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green_out[3]}]

set_property PACKAGE_PIN  B7  [get_ports {blue_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blue_out[0]}]

set_property PACKAGE_PIN  C7  [get_ports {blue_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blue_out[1]}]

set_property PACKAGE_PIN  D7  [get_ports {blue_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blue_out[2]}]

set_property PACKAGE_PIN  D8  [get_ports {blue_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blue_out[3]}]

set_property PACKAGE_PIN  B11  [get_ports x_valid]
set_property IOSTANDARD LVCMOS33 [get_ports x_valid]

set_property PACKAGE_PIN  B12  [get_ports y_valid]
set_property IOSTANDARD LVCMOS33 [get_ports y_valid]