`timescale 1ns/100ps

module pe_arr_tb()
integer i;

reg clk;
reg rstn;
reg fire;
reg[7:0] in_w [0:3];
reg[7:0] in_a [0:3];
wire[11:0] outs[0:15];

PE_ARR u0 #(4,4)
           (clk, rstn, fire, in_w, in_a, outs);

initial forever 
begin
    #10 clk = ~clk;
end

initial
begin
    clk = 1;
    rstn = 0;
    #18 rstn = 1;
        fire = 1;
    #2  for(i = 0; i < 4; i++)
        begin
            in_w[i] = i;
            in_a[i] = 8'hff;
        end
    #160 fire = 0;
    #160 fire = 1;
    #160 $stop;
end

endmodule
