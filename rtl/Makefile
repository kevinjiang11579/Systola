pe: 
	iverilog -o pe.vvp pe.sv

pe_test:
	iverilog -o pe_tb.vvp pe.sv pe_tb.sv; vvp pe_tb.vvp

clean:
	rm -f *.vvp


