module PE_lin(
    input clk,
    input rstn,
    input fire,
    input[7:0] in_w [3:0],
	input[7:0] in_a [3:0],
	output[11:0] outs [3:0]);

    wire fo0[3:0];
    wire fo1[3:0];
    wire fo2[3:0];
    wire fo3[3:0];

    wire[7:0] ao0[3:0];
    wire[7:0] ao1[3:0];
    wire[7:0] ao2[3:0];
    wire[7:0] ao3[3:0];

    wire[11:0] o0[3:0];
    wire[11:0] o1[3:0];
    wire[11:0] o2[3:0];
    wire[11:0] o3[3:0];


    PE PE00 (.clk(clk), .rstn(rstn), .fire(fire), 
                .in_w(in_w[0]), .in_a(in_a[0]), 
                .out_f(fo[0]), .out_a(ao0[0]), .out(o[0])
                );
    genvar i;
    generate
        for (i=0; i<3; i=i+1) begin
            PE PE0 (.clk(clk), .rstn(rstn), .fire(fo[0]),
                .in_w(in_w[1]), .in_a(in_a[1]), 
                .out_f(o[1]), .out_a(ao0[1]), .out(o[1])
                );
        end
    endgenerate

)