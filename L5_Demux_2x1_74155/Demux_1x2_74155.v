`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2024 18:54:53
// Design Name: 
// Module Name: Demux_1x2_74155
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


module Demux_1x2_74155(
    input A, input Sel,
    output Y0, output Y1
    );
    
    assign Y0 = Sel == 0 ? A:0;
    assign Y1 = Sel == 1 ? A:0;
    
endmodule
