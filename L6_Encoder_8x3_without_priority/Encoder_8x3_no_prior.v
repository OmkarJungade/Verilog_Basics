`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2024 01:03:28
// Design Name: 
// Module Name: Encoder_8x3_no_prior
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


module Encoder_8x3_no_prior(
    input [7:0] A,
    input En,
    output reg [2:0] Out
    );
    
always @ (A,En)
begin
    if(En==1'b1)
        case(A)
            8'b00000001 : Out=3'b000;
            8'b00000010 : Out=3'b001;
            8'b00000100 : Out=3'b010;
            8'b00001000 : Out=3'b011;
            8'b00010000 : Out=3'b100;
            8'b00100000 : Out=3'b101;
            8'b01000000 : Out=3'b110;
            8'b10000000 : Out=3'b111;
        endcase
    else
       Out=3'bzzz;
end
endmodule
