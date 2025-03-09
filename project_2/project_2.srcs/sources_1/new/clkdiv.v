`timescale 1ns / 1ps

module clkdiv(
    input clk,
    input reset, 
    output reg clk_out
); 

    reg [26:0] COUNT;

    always @(posedge clk)        
    begin
    if (reset)
    
        COUNT <= 0;
    else   
        COUNT <= COUNT + 1;
    end
        
    always @(posedge clk)  
    begin
        clk_out <= COUNT[26];
    end

endmodule