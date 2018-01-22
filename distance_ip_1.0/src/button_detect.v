`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/01 10:38:50
// Design Name: 
// Module Name: button_detect
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

module button_detect(
  clk,rst,input_sig,output_sig
    );
   input clk,rst;
   input input_sig;
   output wire output_sig;
   
   reg [1:0] rinput;
   
   
   always @(posedge clk, posedge rst)
   begin 
    if(rst) begin  rinput<=0; end 
    else begin
      rinput[1]<=rinput[0];
      rinput[0]<=input_sig;
    end 
   end

  assign output_sig=(~rinput[1]&&rinput[0])?1:0;
  
endmodule

