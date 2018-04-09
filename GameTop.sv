`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2016 10:31:11 AM
// Design Name: 
// Module Name: GameTop
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

module Gametop(input logic basysClk, input logic  buttonLeft1, buttonRight1, buttonLeft2, buttonRight2, start, reset,
                output logic shcp, stcp, mr, oe, ds,a, q, c, d, e, f, g, dp,[7:0] rowsOut,  [3:0]an
               );
               
    logic clk;
   // logic [5:0] score;
    logic [7:0][23:0] board;
    logic [7:0][7:0] red, green, blue;
    
    int first, second, bx, by;
    int player1Score;
    int player2Score;

    logic [7:0] secondPos;
    logic [7:0][7:0] b;
    //int first;

    int t = 5;
    
    
  
            
    ClockDividerTwoPlayerXOX divide_for_game(basysClk, start,player1Score,player2Score, clk);
    
     sample s (clk, start, reset, t, buttonLeft1, buttonRight1, buttonLeft2, buttonRight2, bx, by, first, second, player1Score, player2Score );      
     
    int  player1Score1 = player1Score / 10;
    int  player1Score2 = player1Score % 10;
     
    int  player2Score1 = player2Score / 10 ;
    int  player2Score2 = player2Score % 10;

    SevSeg_4digit seven( basysClk, player1Score2, player1Score1, player2Score2, player2Score1,    // 4 values for 4 digits (decimal value)
    a, q, c, d, e, f, g, dp, //individual LED output for the 7-segment along with the digital point
    an );   
     
    disp( buttonLeft1, buttonRight1, start, clk, first, second, bx, by, board );
        
    Matrix led_module(basysClk, board, rowsOut, shcp, stcp, mr, oe, ds);
    
    
endmodule
 
 
 
module sample(input logic clk, input logic start, input logic reset, input int t, input logic buttonLeft1, buttonRight1, buttonLeft2, buttonRight2, output int bX, bY, first, second, player1Score, player2Score );
  
  int temp1 = 5;
  int temp2 = 5;
  int ballX = 5, ballY = 6, up = -1, right = 1;
  
  always@(posedge clk) begin
        bX <= ballX;
        bY <= ballY;
        first <= temp1;
        second <= temp2;
              
   end
    
    
    always@(posedge clk)
    begin
    
    
        if( buttonLeft1 && (temp1 > 1) )
            temp1 <= temp1 - 1 ;
            
        if( buttonLeft2 && (temp2 > 1) )
            temp2 <= temp2 - 1;
            
        if( buttonRight1 && (temp1 < 6) ) 
            temp1 <= temp1 + 1;
            
        if( buttonRight2 && (temp2 < 6) )
            temp2 <= temp2 + 1;
        if( reset )
            begin 
            temp1 <= 5;
            temp2 <= 5;
            ballX <= 5;
            ballY <= 6;
            player1Score = 0;
            player2Score = 0;
            end
        if(player1Score == 99 || player2Score == 99 )
        begin
        player1Score = 0;
        player2Score = 0;
        end

        if(ballX == 6 && (up == 1 ) ) begin
             up <= -1;
            
            if( ballY - temp2 == 2 && right == -1  ) 
                right <= 1; 
            else if (ballY - temp2 == -2 && right == 1)
                right <= -1;
            else if( ballY - temp2 == 1 && right == 0 )
                right <= 1;
            else if( ballY - temp2 == -1 && right == 0 )
                right <= -1;    
            else if( ( ballY - temp2 == 1 && right == -1 ) )
                    right <= 0;
            else if( ballY - temp2 == -1 && right == 1 )
                   right <= 0;
        end
        
        else if( ballX == 1 &&  (up == -1) ) begin
             up <= 1;
            
            if( (ballY - temp1 == 2 && right == -1) )
                right <= 1;
            else if( ballY - temp1 == -2 && right == 1) 
                right <= -1;
                
            else if( ballY - temp1 == 1 && right == 0 )
                right <= 1;
            else if( ballY - temp1 == -1 && right == 0 )
                right <= -1;  
                
            else if( ( ballY - temp1 == 1 && right == -1 ) )
                    right <= 0;
            else if( ballY - temp1 == -1 && right == 1 )
                   right <= 0;
                    
         end
         
         
         if( ballX != 7 && ballX != 0 )
         begin
            ballX <= ballX + up;
            ballY <= ballY + right;
         end
         
         else if(ballX == 7)
         begin
            if( (ballY - temp2 < 2) && (temp2 - ballY <2) )
                begin
                ballX <= ballX + up;
                ballY <= ballY + right;
                end
                else
                begin
                ballX <= 2;
                ballY <= 1;
                player2Score++;  
                up = 1;
                right = 0;
                end  
         end
         
        else if(ballX == 0)
          begin
             if( (ballY - temp1 < 2) && (temp1 - ballY <2) )
                 begin
                 ballX <= ballX + up;
                 ballY <= ballY + right;
                 end
                 else
                 begin
                 ballX <= 5;
                 ballY <= 5;
                 player1Score++;
                 up = -1;
                 right = 0;
                 end  
          end
         
         
         if(ballY == 6 && right == 1 ) 
             right <= -1;
         else if( ballY == 1 && right == -1 )
             right <= 1;
                       
         

    end  
endmodule
