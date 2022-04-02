`timescale 1ns/100ps
`define HALF_CLOCK #10

module pe_arr_tb();
integer i;

reg clk;
reg rstn;
reg fire;
reg[7:0] in_w [0:3];
reg[7:0] in_a [0:3];
wire[11:0] outs [0:15];

PE_ARR #(.rows(4), .cols(4)) 
	dut (clk, rstn, fire, in_w, in_a, outs);

initial forever 
begin
    `HALF_CLOCK clk = ~clk;
end

initial
begin
    clk <= 1;
    rstn <= 0;
    @(negedge clk)
    rstn <= 1;

    for(i = 0; i < 4; i++) begin
        in_w[i] <= i;
        in_a[i] <= 8'd1;
    end

    fire <= 1;

    for(i=0; i<8; i++) begin
        @(posedge clk);
    end
    fire <= 0;
    for(i=0; i<8; i++) begin
        @(posedge clk);
    end
    $finish;
end

endmodule
