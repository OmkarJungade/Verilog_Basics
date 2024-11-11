`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 10:40:09
// Design Name: 
// Module Name: Logic_Gates_tb
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


module Logic_Gates_tb;
reg A, B;
wire AND, OR, BUFFER, XOR, NAND, NOR, NOT, XNOR;

Logic_Gates uut(.A(A), .B(B), .AND(AND), .OR(OR), .BUFFER(BUFFER), .XOR(XOR), .NAND(NAND), .NOR(NOR), .NOT(NOT), .XNOR(XNOR));

initial begin
    $monitor("A = %b, B = %b | AND = %b, OR = %b, BUFFER = %b, XOR = %b, NAND = %b, NOR = %b,NOT = %b, XNOR = %b", 
                  A, B, AND, OR, BUFFER, XOR, NAND, NOR, NOT, XNOR);

        // Test all combinations of inputs
        A = 0; B = 0; #10; // 00
        A = 0; B = 1; #10; // 01
        A = 1; B = 0; #10; // 10
        A = 1; B = 1; #10; // 11

        // End simulation
        $finish;
    end 
endmodule
