module PE (
	input clk, 
	input rstn,
	input fire, 
	input[7:0] in_w, 
	input[7:0] in_a, 
	output[7:0] out_a);

	reg[7:0] out_a;

	always @ (posedge clk) begin
		if (!rstn) begin
			out_a <= 0;
		end else begin
			out_a <= out_a + (in_w * in_a);
		end
	end	
endmodule
