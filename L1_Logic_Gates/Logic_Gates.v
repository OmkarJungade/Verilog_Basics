`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 10:36:19
// Design Name: 
// Module Name: Logic_Gates
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


module Logic_Gates(
    input A,
    input B,
    output AND, output OR, output BUFFER, output XOR, output NAND, output NOR, output NOT, output XNOR);
    assign AND = A&B;
    assign OR = A|B;
    assign BUFFER = A;
    assign XOR = ((A&(~B))|((~A)&B));
    assign NAND = ~(A&B);
    assign NOR = ~(A|B);
    assign NOT = ~A;
    assign XNOR = ((A&B)|((~A)&(~B)));
endmodule
