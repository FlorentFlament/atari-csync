// Testbench
module test;
   reg  clk;
   reg  hsync;
   reg  vsync;
   wire csync;

   reg 	hsync_r0;
   reg 	hsync_r1;
   reg 	hsync_r2;
   reg 	hsync_r3;
   reg 	vsync_r0;
   reg 	vsync_r1;
   reg 	vsync_r2;
   reg 	vsync_r3;
   
   // Instantiate design under test
   csync_generator mydut(.clk(clk), .hsync(hsync), .vsync(vsync), .csync(csync));

   always @(posedge clk)
     begin
	hsync_r0 <= hsync;
	hsync_r1 <= hsync_r0;
	hsync_r2 <= hsync_r1;
	hsync_r3 <= hsync_r2;
	vsync_r0 <= vsync;
	vsync_r1 <= vsync_r0;
	vsync_r2 <= vsync_r1;
	vsync_r3 <= vsync_r2;
     end
   
   initial begin
      // Dump waves
      $dumpfile("testbench.vcd");
      $dumpvars(0, test);

      vsync = 1;
      hsync = 1;
      clk = 0;
      #1 clk = 1;
      #1 clk = 0;

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
      vsync = 1;
      endofline;
      oneline;
      endofline;
      
      oneline;
      vsync = 0;
      endofline;
      oneline;
      endofline;

      oneline;
      vsync = 1;
      endofline;
      oneline;
      endofline;      
   end // initial begin

   task oneline;
      integer i;
      for (i=0; i<10; i=i+1) begin
	 #1 clk = 1;
	 #1 clk = 0;
      end
   endtask // oneline

   task endofline;
      begin
	 hsync = 0;
	 #1 clk = 1;
	 #1 clk = 0;
	 #1 clk = 1;
	 #1 clk = 0;
	 hsync = 1;
      end
   endtask // endofline
   
endmodule // test
