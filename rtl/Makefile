pe: 
	iverilog -o pe.vvp pe.sv

test_pe:
	iverilog -o pe_tb.vvp pe.sv pe_tb.sv; vvp pe_tb.vvp

pe_lin:
	iverilog -o pe.vvp pe.sv pe_lin.sv

test_pe_lin:
	iverilog -o pe_lin_tb.vvp pe.sv pe_lin.sv pe_lin_tb.sv; vvp pe_lin_tb.vvp

clean:
	rm -f *.vvp
