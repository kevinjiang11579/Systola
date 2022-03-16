module PE_TB;
	reg clk, rstn, fire;
	reg [7:0] w, a;
	wire [11:0] out;
	wire out_f;
	reg [7:0] out_a;
	reg [7:0] cnt;

	integer i;

	always begin
		#10;
		clk = ~clk;
	end

	always @ (posedge clk) begin
		cnt <= cnt + 1'b1;
	end

	PE dut(clk, rstn, fire, w, a, out_f, out_a, out);

	initial begin
		clk <= 0;
		rstn <= 0;
		cnt <= 0;
		w <= 0;
		a <= 1;
		fire <= 1;

		$display("Initialized");

		#25;
		rstn <= 1;

		for (i=0; i<16; i=i+1) begin
			@(posedge clk);
			$display("i=%d\tout=%d", i, out);

			w <= w + 1;
		end
		$finish;
	end
endmodule



