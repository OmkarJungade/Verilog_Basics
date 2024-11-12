`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2024 11:23:40
// Design Name: 
// Module Name: Game_of_Life
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


module Game_of_Life(
    input clk,                                                  // Clock input
    input reset,                                                // Reset to the game 
    input [9:0] x,                                              // VGA X-Coordinate
    input [9:0] y,                                              // VGA Y-Coordinate
    input vga_valid,                                            // VGA Declaration State 
    output reg alive                                            // Output to determine alive cell
    );
    
    // Grid size
    parameter GRID_WIDTH = 80;
    parameter GRID_HEIGHT = 80;
    
    integer i, j, count, neighbors;
    
    
    reg [GRID_WIDTH - 1:0] grid [GRID_HEIGHT -1 :0];            // Declare grid state
    
    // Grid process and next state calculation
    always @(posedge clk or posedge reset) begin
        if (reset == 1) begin
            // Initialize with glider pattern
            grid[10] = 80'b00000000000000000000111000000000000000000000000000000000000000000000000000000000000000000000;
            // Different patterns can be created by assigning different bits 0 and 1.
        end
        else begin
            // Implement Game of Life here
            for (i = 0; i < GRID_HEIGHT; i=i+1) begin
                for (j = 0; j < GRID_WIDTH; j=j+1) begin
                    count = 0;
                    // Check all 8 surrounding neighbors for alive or dead case. Count the total alive members.
                    if (i > 0 && j > 0 && grid[i-1][j-1] == 1) 
                        count = count + 1;
                    if (i > 0 && grid[i-1][j] == 1) 
                        count = count + 1;
                    if (i > 0 && j < GRID_WIDTH-1 && grid[i-1][j+1] == 1) 
                        count = count + 1;
                    if (j > 0 && grid[i][j-1] == 1) 
                        count = count + 1;
                    if (j < GRID_WIDTH-1 && grid[i][j+1] == 1) 
                        count = count + 1;
                    if (i < GRID_HEIGHT-1 && j > 0 && grid[i+1][j-1] == 1) 
                        count = count + 1;
                    if (i < GRID_HEIGHT-1 && grid[i+1][j] == 1) 
                        count = count + 1;
                    if (i < GRID_HEIGHT-1 && j < GRID_WIDTH-1 && grid[i+1][j+1] == 1) 
                        count = count + 1;
                        
                   // Check for Conway's Rules
                   if (grid[i][j] == 1) begin
                        if (count < 2 || count > 3)              // If <2, under population. If >3, over population,
                            grid[i][j] = 0;                      // cell dies
                   end
                   else begin
                        if (count == 3)                         // For exactly 3 neighbors,
                            grid[i][j] = 1;                     // cell becomes alive
                   end
               end
            end    
        end     
    end
    
    
     // Output the current state of the cell for VGA
    always @(posedge clk) begin
        if (vga_valid) begin
            if (x < GRID_WIDTH && y < GRID_HEIGHT) begin
                alive = grid[y][x];                            // Output the state of the cell
            end else begin
                alive = 0;                                     // Default to dead outside the grid
            end
        end
    end
    
endmodule
