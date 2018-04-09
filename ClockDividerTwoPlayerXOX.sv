`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2016 11:58:31 AM
// Design Name: 
// Module Name: ClockDividerTwoPlayerXOX
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


module ClockDividerTwoPlayerXOX( input clk, input start, output logic newClock

    );
    
    always@(posedge clk)
    if (start)
        newClock = 1'b1;
    else
        newClock = 1'b0;
    
endmodule
