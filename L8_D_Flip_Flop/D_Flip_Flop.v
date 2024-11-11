`timescale 1ns / 1ps

module D_Flip_Flop(
    input D, input Clk, input Reset,
    output reg Q
    );
    
    always @(posedge Clk)
    begin
        if (Reset == 1)
            Q <= 0;
        else
            Q <= D;
        end
endmodule
