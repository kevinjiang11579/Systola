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

    
    assign outs = o0;

    genvar i, j;
    generate
        parameter rows = 4;
        parameter cols = 4;
        wire [7:0] peouts [rows * columns];
        for (i=0; i<rows; i=i+1) begin
            for (j=0; j<cols; j=j+1) begin
                if (j == 0) begin
                    PE PE00 (.clk(clk), .rstn(rstn), .fire(fire), 
                    .in_w(in_w[0]), .in_a(in_a), 
                    .out_f(fo0[0]), .out_a(ao0[0]), .out(o0[0]));
                end else begin
                    PE PE0 (.clk(clk), .rstn(rstn), .fire(fo0[j-1]),
                    .in_w(in_w[j]), .in_a(ao0[j-1]), 
                    .out_f(fo0[j]), .out_a(ao0[j]), .out(o0[j]));
                end
            end
        end
    endgenerate

)
