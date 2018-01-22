module distance_sensor(
clk,rst,echo_sig,trig_sig,distance
    );
     input clk,rst;
     input echo_sig;
     output wire trig_sig;
     output wire [15:0]distance;
     distance_trig  U_trig(clk,rst,trig_sig);
     distance_echo U_echo(clk,rst,echo_sig,distance);

endmodule
