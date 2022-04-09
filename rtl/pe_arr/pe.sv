`timescale 1 ns/1 ps

module PE (
	input clk, 
	input rstn,
	input fire, 
	input [7:0] in_w, 
	input [7:0] in_a, 
	output reg out_f,
	output reg [7:0] out_a,
	output reg [7:0] out_w,
	output reg [11:0] out);
	
	always_ff @ (posedge clk) begin
		if (!rstn) begin
			out_a <= 0;
			out_w <= 0;
			out_f <= 0;
			out <= 0;
		end else begin
			if (fire) begin
				out <= out + (in_w * in_a);
				out_a <= in_a;
				out_w <= in_w;
			end
			out_f <= fire;
		end
	end	
endmodule
