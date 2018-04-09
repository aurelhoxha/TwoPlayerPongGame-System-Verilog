`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2016 10:36:34 AM
// Design Name: 
// Module Name: disp
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



module disp(input logic buttonLeft1, input logic buttonRight1, start,
            input logic clk, input int f, s, bx, by,
            output logic[7:0][23:0] board 
            );
                             
       logic[7:0][7:0] redLeds , greenLeds ,blueLeds;  
       int location = 0;
    
    
always_comb
begin
    updateColor();      
    updateBoard();
end  


 task updateColor();
   
    for(int i = 0 ; i < 8 ; i++)
    begin
        blueLeds[0][i] <= ( f - i < 2 && i - f < 2 ) ;
        blueLeds[7][i] <= ( s - i < 2 && i - s < 2 ) ;
        
        for(int j = 0 ; j < 8; j++) 
            redLeds[i][j] = ( (i==bx) && (j == by) );
    end 
    
 endtask
 
task updateBoard();
      for(int i = 0; i < 8; i++)
      begin
         int k = 0;
         for(int j = 7; j >= 0; j--)
         begin
              board[i][k] = blueLeds[j][7 - i];
              k++;
         end
         for(int j = 7; j >= 0; j--)
         begin
              board[i][k] = greenLeds[j][7 - i];
              k++;
         end
         for(int j = 7; j >= 0; j--)
         begin
              board[i][k] = redLeds[j][7 - i];
              k++;
         end
         k = 0;
      end
endtask 
    
    
endmodule
