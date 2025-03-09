`timescale 1ns / 1ps

module tb_rising_edge_det; 

    reg clk; 
    reg signal; 
    reg reset; 
    wire outedge; 

    rising_edge_det u1 (
        .clk(slow_clk), 
        .signal(signal), 
        .reset(reset), 
        .outedge(outedge)
    ); 

    // Clock Generation
    always #5 clk = ~clk; 

    // Test Sequence
    initial begin
        clk = 0; 
        signal = 0; 
        reset = 1; 

        #20 reset = 0;  // Release reset

        #50 signal = 1;  // Rising edge
        #50 signal = 0;  // Falling edge
        #50 signal = 1;  // Another rising edge
        #50 reset = 1;   // Reset again
        #50 reset = 0;   // Release reset
        #100;            // Wait to observe final behavior

        $finish;
    end

endmodule
