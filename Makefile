.phony: sim prog clean

sim: testbench.vcd
	gtkwave $<

prog: design.bin
	iceprog $<

test: test.bin
	iceprog $<

testbench.exe: testbench.sv design.sv
	iverilog -o $@ $^

%.vcd: %.exe
	./$<

%.blif: %.sv
	yosys -p "synth_ice40 -blif $@" $<

%.asc: %.blif %.pcf
	arachne-pnr -d 1k -p $(word 2,$^) $(word 1,$^) -o $@

%.bin: %.asc
	icepack $< $@

clean:
	rm -f *.exe *.bin *.vcd *.blif *.asc
