`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2016 10:32:44 AM
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


module ClockDividerTwoPlayerXOX( input clk, input start,
                                 input int player1Score,
                                 input int player2Score,
                                 output logic newClock

                                );
    
    int n = 0;
    
    always@(posedge clk)
     
    if (n > 40000000 && !start ) 
    begin 
        newClock = 1'b1;
        n = 0; 
    end
    

    else if(!start) 
    begin
        newClock = 1'b0;
        n++;
    end
    
    
endmodule
