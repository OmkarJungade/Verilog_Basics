`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2024 22:39:36
// Design Name: 
// Module Name: Top_module
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


module Top_module (
    input clk,                // 100 MHz clock from the FPGA
    input reset,              // Reset signal
    output h_sync,            // VGA horizontal sync
    output v_sync,            // VGA vertical sync
    output [3:0] vga_r,       // VGA Red signal
    output [3:0] vga_g,       // VGA Green signal
    output [3:0] vga_b        // VGA Blue signal
);

    // Signals for VGA controller and Game of Life module
    wire [9:0] x, y;
    wire vga_valid;
    wire alive;

    // Instantiate the VGA controller
    VGA_Controller vga_ctrl(.clk(clk), .reset(reset), .h_sync(h_sync), .v_sync(v_sync), .x(x), .y(y), .vga_valid(vga_valid));

    // Instantiate the Game of Life module
    Game_of_Life game_of_life(.clk(clk), .reset(reset), .x(x), .y(y), .vga_valid(vga_valid), .alive(alive));

    // Set VGA color based on alive/dead cell
    assign vga_r = alive ? 4'b1111 : 4'b0000;   // Red for alive, off for dead
    assign vga_g = alive ? 4'b1111 : 4'b0000;   // Green off
    assign vga_b = 4'b0000;                     // Blue off

endmodule
