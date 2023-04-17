.phony: clean \
	csync-predictive-prog \
	csync-predictive-sim \
	csync-predictive-ta \
	csync-pulse-prog \
	csync-pulse-sim \
	csync-and-prog \
	csync-xor-prog \
	test-prog \
#

clean:
	rm -f *.exe *.bin *.vcd *.blif *.asc

#################
# Special cases #
#################

csync-predictive.blif: csync-predictive.sv pll.sv
	yosys -p "synth_ice40 -top top -blif $@" $^

#################
# Generic rules #
#################

# Simulation

%-testbench.exe: %-testbench.sv %.sv
	iverilog -o $@ $^

%.vcd: %.exe
	./$<

%-sim: %-testbench.vcd
	gtkwave $<

# FPGA programming

%.blif: %.sv
	yosys -p "synth_ice40 -blif $@" $<

%.asc: %.blif %.pcf
	arachne-pnr -d 1k -p $(word 2,$^) $(word 1,$^) -o $@

%.bin: %.asc
	icepack $< $@

%-prog: %.bin
	iceprog $<

# Timing analysis

%-ta: %.asc
	icetime -d hx1k $<
