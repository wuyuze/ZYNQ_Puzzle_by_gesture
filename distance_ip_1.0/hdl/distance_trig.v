`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/01 10:33:32
// Design Name: 
// Module Name: distance_trig
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



module distance_trig(
clk,rst,trig_sig
    );
     input clk,rst;
     output trig_sig;
     
     reg r_sig;
     reg [23:0] count;
     parameter T100MS=124_999_99;
     parameter T20US=2499;

     always @(posedge clk,posedge rst)
     begin 
        if(rst) count<=0;
        else if(count==T100MS)begin count<=0;  end
        else count<=count+1;
     end

     always @(posedge clk,posedge rst)
     begin
        if(rst) r_sig<=0;
        else if(count<=T20US) r_sig<=1;
        else r_sig<=0;
     end

     assign trig_sig=r_sig;

endmodule
