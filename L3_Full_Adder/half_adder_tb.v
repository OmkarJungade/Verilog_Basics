`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2024 16:56:51
// Design Name: 
// Module Name: half_adder_tb
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


module Full_Adder_tb;

reg A, B, C_in;
wire Sum, C_out;

Full_Adder uut(.A(A), .B(B), .C_in(C_in), .Sum(Sum), .C_out(C_out));

initial begin
    $monitor("A = %b|B = %b|CarryIn = %b|Sum = %b|CarryOut = %b", A,B,C_in,Sum,C_out);
        A = 0; B = 0; C_in = 0; #10;
        A = 0; B = 0; C_in = 1; #10;
        A = 0; B = 1; C_in = 0; #10;
        A = 0; B = 1; C_in = 1; #10;
        A = 1; B = 0; C_in = 0; #10;
        A = 1; B = 0; C_in = 1; #10;
        A = 1; B = 1; C_in = 0; #10;
        A = 1; B = 1; C_in = 1; #10;
        $finish;
    end
endmodule
