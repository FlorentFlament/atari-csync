// Testbench
`timescale 1us/1us

module test_csync_pulse;
   reg  clk;
   reg  hsync;
   reg  vsync;
   wire csync;

   // Instantiate design under test
   csync_pulse #(
		 .CNT_WIDTH (5)
		 ) DUT (
			.clk(clk),
			.hsync(hsync),
			.vsync(vsync),
			.csync(csync)
			);

   initial begin
      // Dump waves
      $dumpfile("csync-pulse-testbench.vcd");
      $dumpvars(0, test_csync_pulse);

      // Initial values
      vsync = 1;
      hsync = 1;
      clk = 0;

      oneline;
      endofline;
      oneline;
      endofline;
      oneline;
      endofline;
      oneline;
      vsync = 0;
      endofline;

      oneline;
      endofline;
      oneline;
      endofline;
      oneline;
      endofline;
      oneline;
      vsync = 1;
      endofline;
      
      oneline;
      endofline;
      oneline;
      endofline;
      oneline;
      endofline;
      oneline;
      vsync = 0;
      endofline;
   end // initial begin

   task oneline;
      integer i;
      for (i=0; i<32; i=i+1)
	begin
	   #1 clk = 1;
	   #1 clk = 0;
	end
   endtask // oneline

   task endofline;
      integer i;
      begin
	 hsync = 0;
	 for (i=0; i<8; i=i+1)
	   begin
	      #1 clk = 1;
	      #1 clk = 0;
	   end
	 hsync = 1;
      end
   endtask // endofline
   
endmodule
