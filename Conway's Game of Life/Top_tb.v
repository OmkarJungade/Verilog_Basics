`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2024 23:15:58
// Design Name: 
// Module Name: Top_tb
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


module Top_tb;

    reg clk;
    reg reset;
    wire h_sync, v_sync;
    wire [3:0] vga_r, vga_g, vga_b;

    // Instantiate the top module
    Top_module uut(.clk(clk), .reset(reset), .h_sync(h_sync), .v_sync(v_sync), .vga_r(vga_r), .vga_g(vga_g), .vga_b(vga_b));

    // Clock generation
    always begin
        clk = 0; #5;
        clk = 1; #5;
    end

    // Test stimulus
    initial begin
        reset = 1;
        #10;
        reset = 0;
        
        // Add more stimulus here to observe the behavior of Game of Life
        //monitor display
        $monitor("Time = %0t, vga_r = %b, vga_g = %b, vga_b = %b, h_sync = %b, v_sync = %b", 
                 $time, vga_r, vga_g, vga_b, h_sync, v_sync);

        // End simulation after a certain time
        #5000;
        $finish;
    end
endmodule
