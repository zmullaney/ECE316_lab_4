## SWITCH
set_property PACKAGE_PIN V17 [get_ports {signal}]	
## Sets the switch to use 3.3V logic				
	set_property IOSTANDARD LVCMOS33 [get_ports {signal}]   

## Clock signal - Uncomment if needed (will be used in future labs)
set_property PACKAGE_PIN W5 [get_ports {clk}]							
	set_property IOSTANDARD LVCMOS33 [get_ports {clk}]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk}]

##Buttons
set_property PACKAGE_PIN U18 [get_ports {reset}]						
	set_property IOSTANDARD LVCMOS33 [get_ports {reset}]

## LEDs
## Connects the output c in our gate module to pin U16 (LED0 on-board)		
set_property PACKAGE_PIN U16 [get_ports {outedge}]	
### Sets the LED to use 3.3V logic		
	set_property IOSTANDARD LVCMOS33 [get_ports {outedge}]    