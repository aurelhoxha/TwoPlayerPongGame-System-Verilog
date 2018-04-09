`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2016 10:58:22 PM
// Design Name: 
// Module Name: TwoPlayerXOXSimpleGame
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


module TwoPlayerXOXSimpleGame(input logic start,input logic clk,input [1:0] rows, columns,
                             output logic[7:0][23:0] board );
                             
       logic[7:0][7:0] redLeds , greenLeds ,blueLeds;  
       logic[8:0] blueColor = 9'b0;
       logic[8:0] redColor = 9'b0;
           logic colorBlue = 1;
           logic colorRed = 0;
           logic colorFlag  = 0;
           int flag1 = 0;
           int flag2 = 0;
           int flag3 = 0;
           int flag4 = 0;
           int flag5 = 0;
           int flag6 = 0;
           int flag7 = 0;
           int flag8 = 0;
           int flag9 = 0;
       
  //initializes the grid 3X3 with green divisions and empty squares     
  always_comb
       begin 
           for( int i = 0 ; i < 8 ; i++)
           begin 
               for(int j = 0 ; j < 8 ; j++)
               begin
                   if (j == 2 | j == 5 | i ==2 | i == 5)
                   greenLeds[i][j] = 1;
                   else 
                   greenLeds[i][j] = 0;
                   
                   blueLeds[i][j] = 0;
                   redLeds[i][j] = 0;
                  
               end
           end
      end
      
    always_ff@(posedge clk ) //posedge reset khudi dala hai
       begin
               if (start)
                    begin
                    if(rows == 2'b01 & columns == 2'b01)
                        begin
                        flag1 =  1;
                        //ColorUpdate();
                        if (colorFlag == 0)
                        begin
                        blueColor[0] = 1;
                        colorFlag = 1;
                        end
                        else
                        begin
                        redColor[0] = 1;
                        colorFlag = 0;
                        end
                        //colorFlag = ~colorFlag;
                        end                         
                    else if (rows == 2'b10 & columns == 2'b01)
                        begin
                        flag2 = 1;
                        //ColorUpdate();
                        if (colorFlag == 0)
                        begin
                        blueColor[1] = 1;
                        colorFlag = 1;
                        end
                        else
                        begin
                        redColor[1] = 1;
                        colorFlag = 0;
                        end
                        end
                    else if ( rows == 2'b11 & columns == 2'b01)
                        begin
                        flag3 = 1;
                        if (colorFlag == 0)
                        begin
                        blueColor[2] = 1;
                        colorFlag = 1;
                        end
                        else
                        begin
                        redColor[2] = 1;
                        colorFlag = 0;
                        end
                        end
                    else if (rows == 2'b01 & columns == 2'b10)
                        begin
                        flag4 = 1;
                        if (colorFlag == 0)
                        begin
                        blueColor[3] = 1;
                        colorFlag = 1;
                        end
                        else
                        begin
                        redColor[3] = 1;
                        colorFlag = 0;
                        end
                        end
                    else if ( rows == 2'b10 & columns == 2'b10 )
                        begin
                        flag5 = 1;
                        if (colorFlag == 0)
                        begin
                        blueColor[4] = 1;
                        colorFlag = 1;
                        end
                        else
                        begin
                        redColor[4] = 1;
                        colorFlag = 0;
                        end
                        end
                    else if ( rows == 2'b11 & columns == 2'b10 )
                        begin
                        flag6 = 1;
                        if (colorFlag == 0)
                        begin
                        blueColor[5] = 1;
                        colorFlag = 1;
                        end
                        else
                        begin
                        redColor[5] = 1;
                        colorFlag = 0;
                        end
                        end
                    else if ( rows == 2'b01 & columns == 2'b11)
                        begin
                        flag7 =1;
                        if (colorFlag == 0)
                        begin
                        blueColor[6] = 1;
                        colorFlag = 1;
                        end
                        else
                        begin
                        redColor[6] = 1;
                        colorFlag = 0;
                        end
                        end
                    else if ( rows == 2'b10 & columns == 2'b11 )
                        begin
                        flag8 = 1;
                        if (colorFlag == 0)
                        begin
                        blueColor[7] = 1;
                        colorFlag = 1;
                        end
                        else
                        begin
                        redColor[7] = 1;
                        colorFlag = 0;
                        end
                        end     
                    else if ( rows == 2'b11 & columns == 2'b11)
                        begin
                        flag9 = 1;
                        if (colorFlag == 0)
                        begin
                        blueColor[8] = 1;
                        colorFlag = 1;
                        end
                        else
                        begin
                        redColor[8] = 1;
                        colorFlag = 0;
                        end
                        end
                    else flag1 = flag1;
                    
                    end
       end
       
       
      always_comb
           begin
               // ColorUpdate();   
                updateColor();      
                updateBoard();
           end 
                   
task updateColor();
    begin
    
    if ( flag1 > 0 )
        //if (colorBlue > 0)
        begin
        blueLeds[1][1] = blueColor[0];
        blueLeds[1][0] = blueColor[0];
        blueLeds[0][1] = blueColor[0];
        blueLeds[0][0] = blueColor[0];
       //end
       // else
           // begin
            redLeds[1][1] = redColor[0];
            redLeds[1][0] = redColor[0];
            redLeds[0][1] = redColor[0];
            redLeds[0][0] = redColor[0];
            end
        
     if (flag2 > 0)
        //if (colorBlue > 0)
            begin
            blueLeds[3][1] = blueColor[1];
            blueLeds[3][0] = blueColor[1];
            blueLeds[4][1] = blueColor[1];
            blueLeds[4][0] = blueColor[1];
            //end
       // else
          //  begin
            redLeds[3][1] = redColor[1];
            redLeds[3][0] = redColor[1];
            redLeds[4][1] = redColor[1];
            redLeds[4][0] = redColor[1];
            end
     if (flag3 > 0)
      //  if(colorBlue > 0)
            begin
            blueLeds[6][1] = blueColor[2]; 
            blueLeds[6][0] = blueColor[2];
            blueLeds[7][1] = blueColor[2];
            blueLeds[7][0] = blueColor[2];
           /* end
        else
            begin*/
            redLeds[6][1] = redColor[2];
            redLeds[6][0] = redColor[2];
            redLeds[7][1] = redColor[2];
            redLeds[7][0] = redColor[2];
            end
     if (flag4 > 0)
       // if (colorBlue > 0)  
            begin
            blueLeds[1][3] = blueColor[3];
            blueLeds[1][4] = blueColor[3];
            blueLeds[0][3] = blueColor[3];
            blueLeds[0][4] = blueColor[3];
            /*end
        else
            begin*/
            redLeds[1][3] = redColor[3];
            redLeds[1][4] = redColor[3];
            redLeds[0][3] = redColor[3];
            redLeds[0][4] = redColor[3];
            end
     if (flag5 > 0)
       // if (colorBlue > 0) 
            begin
            blueLeds[3][3] = blueColor[4];
            blueLeds[3][4] = blueColor[4];
            blueLeds[4][3] = blueColor[4];
            blueLeds[4][4] = blueColor[4];
          /*  end
        else
            begin*/
            redLeds[3][3] = redColor[4];
            redLeds[3][4] = redColor[4];
            redLeds[4][3] = redColor[4];
            redLeds[4][4] = redColor[4];
            end
       
     if (flag6 >0)
       // if (colorBlue > 0) 
        begin
        blueLeds[6][3] = blueColor[5];
        blueLeds[6][4] = blueColor[5];
        blueLeds[7][3] = blueColor[5];
        blueLeds[7][4] = blueColor[5];
       /* end
        else
        begin*/
        redLeds[6][3] = redColor[5];
        redLeds[6][4] = redColor[5];
        redLeds[7][3] = redColor[5];
        redLeds[7][4] = redColor[5];
        end
     if (flag7 > 0)
       // if ( colorBlue > 0 )
        begin
        blueLeds[1][6] = blueColor[6];
        blueLeds[1][7] = blueColor[6];
        blueLeds[0][6] = blueColor[6];
        blueLeds[0][7] = blueColor[6];
       /* end
        else
        begin*/
        redLeds[1][6] = redColor[6];
        redLeds[1][7] = redColor[6];
        redLeds[0][6] = redColor[6];
        redLeds[0][7] = redColor[6];
        end
     if (flag8 > 0)
       // if ( colorBlue > 0 )
        begin
        blueLeds[3][6] = blueColor[7];
        blueLeds[3][7] = blueColor[7];
        blueLeds[4][6] = blueColor[7];
        blueLeds[4][7] = blueColor[7];
        /*end
        else*/
        redLeds[3][6] = redColor[7];
        redLeds[3][7] = redColor[7];
        redLeds[4][6] = redColor[7];
        redLeds[4][7] = redColor[7];
        end
     if (flag9 > 0)
     //if (colorBlue>0)
        begin
        blueLeds[6][6] = blueColor[8];
        blueLeds[6][7] = blueColor[8];
        blueLeds[7][6] = blueColor[8];
        blueLeds[7][7] = blueColor[8];
       /* end 
     else
        begin*/
        redLeds[6][6] = redColor[8];
        redLeds[6][7] = redColor[8];
        redLeds[7][6] = redColor[8];
        redLeds[7][7] = redColor[8];                
        end
        end
 // end
endtask 

task ColorUpdate();
begin
    int sum = flag1 + flag2 + flag3 + flag4 + flag5 + flag6 + flag7 + flag8 + flag9;
    
    if (sum % 2 == 1)
        begin
        colorBlue = 1;
        colorRed = 0;
        colorFlag = 1;
        end
    else
    begin
    colorFlag = 0;
    colorBlue = 0;
    colorRed = 1;
    end
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
