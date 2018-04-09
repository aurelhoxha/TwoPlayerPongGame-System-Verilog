`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2016 01:26:03 PM
// Design Name: 
// Module Name: OutputsToBoard
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


module OutputsToBoard(output logic [7:0][23:0] board, input logic clock, 
                      input logic [7:0][7:0] red, green, blue);
    always_ff@(posedge clock)
    begin
    for(int i = 0; i < 8; i++)
    begin
       int k = 0;
       for(int j = 7; j >= 0; j--)
       begin
            board[i][k] <= red[j][7 - i];
            k++;
       end
       for(int j = 7; j >= 0; j--)
       begin
            board[i][k] <= green[j][7 - i];
            k++;
       end
       for(int j = 7; j >= 0; j--)
       begin
            board[i][k] <= blue[j][7 - i];
            k++;
       end
       k = 0;
    end
    end
endmodule
