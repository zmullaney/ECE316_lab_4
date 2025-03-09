`timescale 1ns / 1ps

module rising_edge_det (
    input clk,
    input signal,
    input reset,
    output reg outedge
);

    wire slow_clk; 
    
    reg [1:0] state; 
    reg [1:0] next_state;

    // Clock divider instance
    clkdiv cl(clk, reset, slow_clk); 

    // Combinational logic
    always @(*) begin
        case (state)
            2'b00: begin
                outedge = 1'b0;
                if (signal)
                    next_state = 2'b01;
                else 
                    next_state = 2'b00;
            end

            2'b01: begin
                outedge = 1'b1;  // Generate rising edge pulse
                next_state = 2'b10; 
            end

            2'b10: begin
                outedge = 1'b0; 
                if (~signal)
                    next_state = 2'b00;
                else 
                    next_state = 2'b10;
            end

            default: begin
                next_state = 2'b00;
                outedge = 1'b0; 
            end
        endcase
    end

    // Sequential logic
    always @(posedge slow_clk or posedge reset) begin 
        if (reset) begin
            state <= 2'b00;
            outedge <= 1'b0;  // Ensure outedge is properly initialized
        end 
        else begin
            state <= next_state; 
        end
    end
    
endmodule
