`timescale 1ns/1ps
`define HALF_CLOCK_PERIOD #2
`define QSIM_OUT_FN "./qsim.out"
`define INPUT_FN "./input.out"

module testbench();

        wire [7:0] Q;
	reg CLK;
        reg CEN;
   	reg WEN;
	reg [14:0] A;
	reg [7:0] D;
   
	integer read_out_qsim;
	integer input_qsim;

	integer i;
	integer qsim_out_file;
	integer input_file;
	integer ret_read;

	integer error_count = 0;

	mem_in mem_in_0 ( .Q(Q), .clk(CLK), .CEN(CEN), .WEN(WEN), .A(A), .D(D) );

	always begin
		`HALF_CLOCK_PERIOD;
		CLK = ~CLK;
	end

	initial begin
		// File IO
		qsim_out_file = $fopen(`QSIM_OUT_FN,"w");
		if (!qsim_out_file) begin
			$display("Couldn't create the output file.");
			$finish;
		end

		input_file = $fopen(`INPUT_FN,"r");
		if (!input_file) begin
			$display("Couldn't open the input file.");
			$finish;
		end

		   $dumpfile("./mem_in.vcd");
		   $dumpvars(0, testbench.mem_in_0);

		// register setup
		CLK = 0;
		CEN = 1;
		@(posedge CLK);
		#1;

		// release resetn
		CEN = 0;
		WEN = 0;      
		
		for (i=0 ; i<32768; i=i+1) begin
			A = i;
			ret_read = $fscanf(input_file, "%d", input_qsim);
			D = input_qsim;	
			@(posedge CLK);
			#1;
		end
		WEN = 1;
		//repoen to reset cursor
		$fclose(input_file);
		input_file = $fopen(`INPUT_FN,"r");
		if (!input_file) begin
			$display("Couldn't open the input file.");
			$finish;
		end
		
		for (i=0 ; i<32768; i=i+1) begin
			A = i;
			@(posedge CLK);
			$fwrite(qsim_out_file, "%0d\n", read_out_qsim);
			ret_read = $fscanf(input_file, "%d", input_qsim);
			if (read_out_qsim != input_qsim) begin
				error_count = error_count + 1;
			end
		end
		@(posedge CLK);		

		// Any mismatch b/w input data and read data
 		if (error_count > 0) begin
			$display("The read data DO NOT match with the input data :( ");
		end
		else begin
			$display("The read data DO match with the input data :) ");
		end
		// finishing this testbench
		$fclose(qsim_out_file);
		$fclose(input_file);

	        $dumpall;
	        $dumpflush;

		$finish;
	end 

endmodule // testbench

