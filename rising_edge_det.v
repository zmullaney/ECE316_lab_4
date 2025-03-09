`timescale 1ns / 1ps

module rising_edge_det (
    input clk,       // Fast system clock
    input signal,
    input reset,
    output reg outedge
);

    wire slow_clk; 
    reg prev_signal; // Stores previous signal state for edge detection

    // Clock divider instance (provides `slow_clk`)
    clkdiv cl(.clk(clk), .reset(reset), .clk_out(slow_clk)); 

    // Detect rising edge (0 → 1 transition) **on slow clock**
    always @(posedge slow_clk or posedge reset) begin
        if (reset)
            prev_signal <= 0;
        else
            prev_signal <= signal;
    end

    wire signal_rising = (signal == 1'b1) && (prev_signal == 1'b0); // Detect rising edge

    // Generate a 1-cycle pulse on slow_clk rising edge
    always @(posedge slow_clk or posedge reset) begin
        if (reset)
            outedge <= 0;
        else
            outedge <= signal_rising; // `outedge` is high for 1 slow_clk cycle
    end

endmodule
