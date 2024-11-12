`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2024 21:52:22
// Design Name: 
// Module Name: VGA_Controller
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


module VGA_Controller(
    input clk,                // 100 MHz clock
    input reset,              // Reset signal
    output reg h_sync,        // Horizontal sync pulse
    output reg v_sync,        // Vertical sync pulse
    output reg [9:0] x,       // Pixel X-Coordinate
    output reg [9:0] y,       // Pixel Y-Coordinate
    output reg vga_valid      // VGA Declaration state
);

    // VGA timing constants for 640x480 @ 60Hz
    parameter H_SYNC_CYCLES = 96;
    parameter H_BACK_PORCH = 48;
    parameter H_ACTIVE_VIDEO = 640;
    parameter H_FRONT_PORCH = 16;
    parameter V_SYNC_CYCLES = 2;
    parameter V_BACK_PORCH = 33;
    parameter V_ACTIVE_VIDEO = 480;
    parameter V_FRONT_PORCH = 10;

    // Counters
    reg [9:0] h_count = 0;
    reg [9:0] v_count = 0;

    // Generate horizontal and vertical sync signals
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            h_count <= 0;
            v_count <= 0;
            h_sync <= 0;
            v_sync <= 0;
            x <= 0;
            y <= 0;
            vga_valid <= 0;
        end else begin
            // Horizontal counter
            if (h_count < (H_SYNC_CYCLES + H_BACK_PORCH + H_ACTIVE_VIDEO + H_FRONT_PORCH - 1))
                h_count <= h_count + 1;
            else begin
                h_count <= 0;
                // Vertical counter
                if (v_count < (V_SYNC_CYCLES + V_BACK_PORCH + V_ACTIVE_VIDEO + V_FRONT_PORCH - 1))
                    v_count <= v_count + 1;
                else
                    v_count <= 0;
            end
            
            // Horizontal sync signal
            if (h_count < H_SYNC_CYCLES)
                h_sync <= 0;  // Low for sync pulse
            else
                h_sync <= 1;  // High otherwise

            // Vertical sync signal
            if (v_count < V_SYNC_CYCLES)
                v_sync <= 0;  // Low for sync pulse
            else
                v_sync <= 1;  // High otherwise

            // VGA valid signal
            if (h_count >= (H_SYNC_CYCLES + H_BACK_PORCH) && h_count < (H_SYNC_CYCLES + H_BACK_PORCH + H_ACTIVE_VIDEO) &&
                v_count >= (V_SYNC_CYCLES + V_BACK_PORCH) && v_count < (V_SYNC_CYCLES + V_BACK_PORCH + V_ACTIVE_VIDEO)) begin
                vga_valid <= 1;
                x <= h_count - (H_SYNC_CYCLES + H_BACK_PORCH);  // X coordinate for active video
                y <= v_count - (V_SYNC_CYCLES + V_BACK_PORCH);  // Y coordinate for active video
            end else begin
                vga_valid <= 0;
                x <= 0;
                y <= 0;
            end
        end
    end
endmodule
