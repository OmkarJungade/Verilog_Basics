`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 11:20:50
// Design Name: 
// Module Name: Comparator_4_bit
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


module Comparator_4_bit(
    input [3:0]A,
    input [3:0]B,
    output Less, output Greater, output Equal);
    
    assign Less = A < B;
    assign Greater = A > B;
    assign Equal = (A == B);
    
endmodule
