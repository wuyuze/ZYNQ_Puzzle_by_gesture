
module button_delay(
  clk,rst,input_sig,output_sig
    );
   input clk,rst;
   input input_sig;
   output output_sig;

   parameter T10MS=1_249_999;

   reg [20:0]count;
   reg count_sig;
   reg r_output;

   always @(posedge clk,posedge rst)
   begin 
    if(rst) begin  count<=0; end 
    else if(count==T10MS) begin  count<=0;  end 
    else if(count_sig) begin count<=count+1; end
   end 

   reg [2:0]mode;
   
   always @(posedge clk,posedge  rst)
   begin
    if(rst) begin mode<=0; count_sig<=0;  r_output<=0;end 
    else begin 
      case(mode)

      3'd0:if(input_sig)begin count_sig<=1; mode<=mode+1;end else begin count_sig<=0; end 
      3'd1:if(count==T10MS) begin r_output<=1; count_sig<=0; mode<=mode+1; end
      3'd2: begin  mode<=mode+1; r_output<=0;  end 
      3'd3: mode<=0;
      endcase 

end     
   end 

   assign output_sig=r_output;

endmodule
















