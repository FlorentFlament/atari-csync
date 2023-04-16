.phony: clean \
	gen-sync-prog \
	gen-sync-sim \
	csync-pulse-prog \
	csync-pulse-sim \
	csync-and-prog \
	csync-xor-prog \
	test-prog \
#

clean:
	rm -f *.exe *.bin *.vcd *.blif *.asc

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

