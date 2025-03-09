// Clock signal
set_property PACKAGE_PIN W5 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk}]
//Buttons
set_property PACKAGE_PIN W19 [get_ports {call_button}]
set_property IOSTANDARD LVCMOS33 [get_ports {call_button}]
set_property PACKAGE_PIN T17 [get_ports {cancel_button}]
set_property IOSTANDARD LVCMOS33 [get_ports {cancel_button}]
//LED
set_property PACKAGE_PIN U16 [get_ports {light_state}]
set_property IOSTANDARD LVCMOS33 [get_ports {light_state}]