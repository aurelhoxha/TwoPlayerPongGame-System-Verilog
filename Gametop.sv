`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2016 01:40:05 PM
// Design Name: 
// Module Name: Gametop
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


module Gametop(output logic shcp, stcp, mr, oe, ds,[7:0] rowsOut, 
               input logic basysClk, input logic [1:0] rows, columns, input logic start);
               
    logic clk;
   // logic [5:0] score;
    logic [7:0][23:0] board;
    logic [7:0][7:0] red, green, blue;


    ClockDividerTwoPlayerXOX divide_for_game(basysClk, start, clk);
    
   
    Matrix led_module(basysClk, board, rowsOut, shcp, stcp, mr, oe, ds);
    TwoPlayerXOXSimpleGame XOXGameFirstVersion(start,clk,rows, columns, board);
     
   
    
    endmodule