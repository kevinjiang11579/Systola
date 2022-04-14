`timescale 1ns/1ps

module mem_in#(parameter sub_mems = 4, parameter addr_len = 2)
	(Q, clk, CEN, WEN, A, D);
	
	localparam word_len = 32;

	wire [sub_mems-1:0] CEN_sub; 	//chip enables for each mem8
	wire [word_len-1:0] Q_sub [0:sub_mems-1];   	//output from each mem8

	//input and outputs
	input clk;
	input [addr_len+7:0] A;
	input [word_len-1:0] D;
	input CEN;
	input WEN;
	output wire [word_len-1:0] Q;
	//wire [8-1:0] Q_ff;
	reg [addr_len-1:0] A_out;
	//wire [7:0] A_sub;

	//assign A_sub = A[7:0];

	assign Q = Q_sub[A_out];
	genvar i;
	generate
		for(i = 0; i < sub_mems; i = i + 1) begin : generate_mem_8
			mem32 mem32_u(.Q(Q_sub[i]), .CLK(clk), .CEN(CEN_sub[i]), .WEN(WEN), .A(A[7:0]), .D(D));
			assign CEN_sub[i] = ((A[addr_len+7:8] == i) & ~CEN) ? 0 : 1;
		end
	endgenerate

	always @(posedge clk)
	begin
		if(CEN == 0) begin
			A_out <= A[addr_len+7:8];
		end
	end
endmodule
