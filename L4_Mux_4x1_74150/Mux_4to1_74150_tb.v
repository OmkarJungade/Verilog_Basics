`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2024 18:21:37
// Design Name: 
// Module Name: Mux_4to1_74150_tb
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


module Mux_4to1_74150_tb;

reg [3:0]A;
reg [1:0]Sel;

wire Out;

Mux_4to1_74150 uut(.A(A), .Sel(Sel), .Out(Out));

initial begin
    A = 4'b1010; Sel = 2'b00; #10;
    $display("sel=%b, out=%b (Expected: 1)", Sel, Out);
     
    A = 4'b1010; Sel = 2'b01; #10;
    $display("sel=%b, out=%b (Expected: 0)", Sel, Out);
    
    A = 4'b1010; Sel = 2'b10; #10;
    $display("sel=%b, out=%b (Expected: 1)", Sel, Out);
    
    A = 4'b1010; Sel = 2'b11; #10;
    $display("sel=%b, out=%b (Expected: 0)", Sel, Out);
    $finish;
    end
endmodule
