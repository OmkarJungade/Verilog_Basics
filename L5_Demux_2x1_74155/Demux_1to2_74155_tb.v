`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2024 19:14:53
// Design Name: 
// Module Name: Demux_1x2_74155_tb
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


module demux_tb;

  reg Sel, A;
  wire Y0, Y1;
  
  demux_2x1_74155 uut(.A(A), .Sel(Sel), .Y0(Y0), .Y1(Y1));
  initial begin
    $monitor("sel = %h: i = %h --> y0 = %h, y1 = %h", Sel, A, Y0, Y1);
    Sel=0; A=0; #10;
    Sel=0; A=1; #10;
    Sel=1; A=0; #10;
    Sel=1; A=1; #10;
    $finish;
  end
endmodule
