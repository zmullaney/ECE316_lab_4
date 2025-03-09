`timescale 1ns / 1ps

module tb_time_multiplexing_main;

    // Testbench signals
    reg clk;
    reg reset;
    reg [15:0] sw;  // Switch input
    wire [3:0] an;  // Anode output
    wire [6:0] sseg; // 7-segment display output
    
    // Instantiate the main multiplexing module
    time_multiplexing_main uut (
        .clk(clk),
        .reset(reset),
        .sw(sw),
        .an(an),
        .sseg(sseg)
    );

    // Clock generation
    always #5 clk = ~clk; // 10ns clock period (100MHz simulated)

    // Test stimulus
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        sw = 16'h1234; // Input switches set to 0x1234
        
        #20 reset = 0; // Release reset after 20ns
        
        // Wait for some clock cycles to observe transitions
        #100;
        
        // Change switch inputs
        sw = 16'hABCD; 
        #100;

        // Activate reset again to see the effect
        reset = 1;
        #20 reset = 0;

        // Run simulation for some more time
        #200;

        // Finish simulation
        $finish;
    end

endmodule
