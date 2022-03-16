module PE (
	input clk, 
	input rstn,
	input fire, 
	input[7:0] in_w, 
	input[7:0] in_a, 
	output out_f,
	output[7:0] out_a,
	output[11:0] out);

	reg out_f;
	reg[7:0] out_a;
	reg[11:0] out;
	
	always_ff @ (posedge clk) begin
		if (!rstn) begin
			out_a <= 0;
			out_f <= 0;
			out <= 0;
		end else begin
			if (fire) begin
				out <= out + (in_w * in_a);
				out_a <= in_a;
			end
			out_f <= fire;
		end
	end	
endmodule
