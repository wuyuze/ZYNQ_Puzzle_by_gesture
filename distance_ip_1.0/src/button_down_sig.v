module button_down_sig(
  clk,rst,button_in,output_sig
    );
   input clk,rst;
   input button_in;
   output output_sig;
   wire button_out;
   button_detect U_detect( clk,rst_,button_in,button_out);
   button_delay U_delay(clk,rst_,button_out,output_sig);

endmodule