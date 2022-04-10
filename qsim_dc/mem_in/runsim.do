##################################################
#  Modelsim do file to run simuilation
#  MS 7/2015
##################################################

vlib work 
vmap work work

# Include Netlist and Testbench
vlog +acc -incr /courses/ee6321/share/ibm13rflpvt/verilog/ibm13rflpvt.v
vlog +acc -incr ../../dc/mem_in/mem_in.nl.v
vlog +acc -incr ../../rtl/mem_in/mem8.v
vlog +acc -incr test_mem_in.v

# Run Simulator 
#Run Simulator 
#SDF from DC is annotated for the timing check 
vsim -voptargs=+acc -t ps -lib work -sdftyp mem_in_0=../../dc/mem_in/mem_in.syn.sdf testbench
 do waveformat.do   
 run -all
