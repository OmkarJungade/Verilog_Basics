`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 11:23:10
// Design Name: 
// Module Name: Comparator_4_bit_tb
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


module Comparator_4_bit_tb;

reg [3:0] A; 
reg [3:0] B;
wire Less, Equal, Greater;

Comparator_4_bit uut(.A(A), .B(B), .Less(Less), .Greater(Greater), .Equal(Equal));
 initial begin
        $monitor("A = %b, B = %b | less = %b, equal = %b, greater = %b", 
                  A, B, less, equal, greater);

        A = 4'b0000; B = 4'b0000; #10; // 0 vs 0
        A = 4'b0001; B = 4'b0000; #10; // 1 vs 0
        A = 4'b0000; B = 4'b0001; #10; // 0 vs 1
        A = 4'b0010; B = 4'b0010; #10; // 2 vs 2
        A = 4'b0111; B = 4'b1000; #10; // 7 vs 8
        A = 4'b1000; B = 4'b0111; #10; // 8 vs 7

        // End simulation
        $finish;
    end
endmodule
