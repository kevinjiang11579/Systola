pe: 
	iverilog -g2012 -o pe.vvp pe.sv

test_pe:
	iverilog -g2012 -o pe_tb.vvp pe.sv pe_tb.sv; vvp pe_tb.vvp

pe_lin:
	iverilog -g2012 -o pe.vvp pe.sv pe_lin.sv

test_pe_lin:
	iverilog -g2012 -o pe_lin_tb.vvp pe.sv pe_lin.sv pe_lin_tb.sv; vvp pe_lin_tb.vvp

clean:
	rm -f *.vvp
