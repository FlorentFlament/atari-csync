// Testbench
`timescale 100ns/100ns

module test_gen_sync;
   reg  clk;
   reg  vsync;
   wire csync;
   integer i;

   // Instantiate design under test
   csync_predictive DUT (
		 .clk(clk),
		 .vsync(vsync),
		 .csync(csync)
		 );

   initial begin
      // Dump waves
      $dumpfile("csync-predictive-testbench.vcd");
      $dumpvars(0, test_gen_sync);

      // Initial values
      vsync = 0;
      clk = 0;

      #1 clk = 1;
      #1 clk = 0;
      #1 vsync = 1;
      clk = 1;

      for (i=0; i<766*310; i++)
	begin
	   #1 clk = 0;
	   #1 clk = 1;
	end
      vsync = 0;

      for (i=0; i<766*3; i++)
	begin
	   #1 clk = 0;
	   #1 clk = 1;
	end
      vsync = 1;

      for (i=0; i<766*310; i++)
	begin
	   #1 clk = 0;
	   #1 clk = 1;
	end
      vsync = 0;

      for (i=0; i<766*3; i++)
	begin
	   #1 clk = 0;
	   #1 clk = 1;
	end
      vsync = 1;

   end // initial begin
endmodule
