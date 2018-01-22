module distance_echo(
    clk,rst,input_sig,distance
    );
    input clk,rst;
    input input_sig;
    output wire[15:0]distance;
    parameter T1MM=734; //声波1MM所需要走的时间为5.88us，对应734个周期
    
    reg [15:0]dis_count;
    reg [15:0]r_distance;
    reg [9:0]mm_count;
    reg finish_sig;
    reg start_sig;
    reg start_count;
    reg [1:0]r_input;
    
    always @(posedge clk,posedge rst)
    begin 
        if(rst) dis_count<=0;
        else if(finish_sig) ;
        else if(start_sig) dis_count<=0;
        else if(mm_count==T1MM) dis_count<=dis_count+1;
    end 
    
    always @(posedge clk,posedge rst)
    begin 
        if(rst) mm_count<=0;
        else if(mm_count==T1MM) mm_count<=0;
        else if(finish_sig)mm_count<=0;
        else if(start_count) mm_count<=mm_count+1;
    
    end 
    
    always @(posedge clk,posedge rst)
    begin 
        if(rst) begin r_input<=0;  end 
         else begin 
            r_input[1]<=r_input[0];
            r_input[0]<=input_sig;
         end 
    end 
    
    reg [3:0]mode;
    always @(posedge clk,posedge rst)
    begin 
        if(rst) begin  finish_sig<=0; start_sig<=0; start_count<=0; mode<=0; end 
        else begin 
        case(mode)
            4'd0: if(~r_input[1]&&r_input[0]) begin  mode<=mode+1; start_sig<=1;   end 
            4'd1: begin start_sig<=0; start_count<=1;  mode<=mode+1; end 
            4'd2: if(r_input[1]&&~r_input[0]) begin mode<=mode+1; start_count<=0; finish_sig<=1; end 
            4'd3: begin mode<=0; finish_sig<=0;  end 
        endcase 
        end 
    end 
    
    always @(posedge clk,posedge rst)
    begin 
        if(rst) r_distance<=0;
        else if(finish_sig) r_distance<=dis_count;
    end 
    
    assign distance=(r_distance>9999)?9999:r_distance;
    
endmodule