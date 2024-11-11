`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.10.2024 15:48:20
// Design Name: 
// Module Name: D_Flip_Flop_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module D_Flip_Flop_tb;

reg D, Clk, Reset;
wire Q;

D_Flip_Flop uut(.D(D), .Clk(Clk), .Reset(Reset), .Q(Q));

initial begin
    Clk = 0;                // Define Clock Pulse
    forever #5 Clk = ~Clk;  // Define Clock Cycle
    end

initial begin
    Reset = 1; D <= 0; #10;  // Initializa the system
    
    Reset = 0; #10;
    
    // Use sample values
    D = 1; #10;     // 1 -> 0
    D = 0; #10;     // 0 -> 1
    D = 1; #10;
    D = 0; #10;
    $finish;
    end
 
 initial begin
    $monitor("Time: %0dns, D: %b, Clk: %b, Reset: %b, Q: %b", $time, D, Clk, Reset, Q);
    end
endmodule
