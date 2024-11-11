`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2024 01:39:03
// Design Name: 
// Module Name: Encoder_8x3_noprior_tb
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


module Encoder_8x3_noprior_tb;

reg [7:0] A;
reg En;
wire [2:0] Out;
Encoder_8x3_no_prior uut(.A(A), .En(En), .Out(Out));
initial begin
A=8'b00000000;
En=1'b1;
    #10 A=8'b00000001; //Input 1
    #10 A=8'b00000010; //Input 2
    #10 A=8'b00000100; //Input 3
    #10 A=8'b00001000; //Input 4
    #10 A=8'b00010000; //Input 5
    #10 A=8'b00100000; //Input 6
    #10 A=8'b01000000; //Input 7
    #10 A=8'b10000000; //Input 8
    #10 A=8'b00110001; //Multiple Inputs
end
always #100 En=~En;
initial #120 $stop;
endmodule
