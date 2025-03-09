`timescale 1ns / 1ps

module time_mux_state_machine(
    input clk, 
    input reset, 
    input [6:0] in0, 
    input [6:0] in1, 
    input [6:0] in2, 
    input [6:0] in3, 
    output reg [3:0] an,
    output reg [6:0] sseg
);

reg [1:0] state;
reg [1:0] next_state;
wire clk_slow; // Slow clock signal from clkdiv

// Instantiate clkdiv
clkdiv my_clkdiv (
    .clk(clk),
    .reset(reset),
    .clk_out(clk_slow)
);

always @(*) begin
    case(state) // State transition logic
        2'b00 : next_state = 2'b01;
        2'b01 : next_state = 2'b10;
        2'b10 : next_state = 2'b11; 
        2'b11 : next_state = 2'b00; 
    endcase
end

always @(*) begin 
    case (state) // Multiplexing logic
        2'b00 : begin sseg = in0;     an = 4'b1110; end
        2'b01 : begin sseg = in1;     an = 4'b1101; end
        2'b10 : begin sseg = in2;     an = 4'b1011; end
        2'b11 : begin sseg = in3;     an = 4'b0111; end
        default: begin sseg = 4'b0000; an = 4'b1111; end    
    endcase
end

// Use slow clock for state transitions
always @(posedge clk_slow or posedge reset) begin
    if (reset)
        state <= 2'b00; 
    else 
        state <= next_state; 
end

endmodule
