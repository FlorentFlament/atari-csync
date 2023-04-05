.phony: sim prog clean

sim: testbench.vcd
	gtkwave $<

prog: design.bin
	iceprog $<

testbench.exe: testbench.sv design.sv
	iverilog -o $@ $^

testbench.vcd: testbench.exe
	./$<

design.blif: design.sv
	yosys -p "synth_ice40 -blif $@" $<

design.asc: design.blif pins.pcf
	arachne-pnr -d 1k -p pins.pcf design.blif -o $@

design.bin: design.asc
	icepack $< $@

clean:
	rm -f *.exe *.bin *.vcd *.blif *.asc
