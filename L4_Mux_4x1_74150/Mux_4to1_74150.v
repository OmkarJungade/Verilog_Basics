`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2024 17:30:21
// Design Name: 
// Module Name: Mux_4to1_74150
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


module Mux_4to1_74150(
    input [3:0]A, input [1:0]Sel,
    output Out
    );
    
    assign Out = (Sel[1]== 0) ? (Sel[0]== 0 ? A[3]:A[2]) : (Sel[0]== 0 ? A[1]:A[0]);
endmodule
