module top
  (
   input  clk, //12 MHz clock reference
   input  hsync,
   input  vsync,
   output csync
   );

   wire   clk_pll; // PLL generated clock

   pll mypll (.clock_in(clk), .clock_out(clk_pll));

   // Using 102MHz clk_pll clock
   csync_predictive
     #( .PLL_FREQ( 102000000 ) )
   mysync (
	   .clk(clk_pll),
	   .hsync(hsync),
	   .vsync(vsync),
	   .csync(csync)
	   );
endmodule // top

// Fully generate "expected" csync signal
// Then resynchronizes on hsync and vsync to avoid drift
module csync_predictive
  #(parameter PLL_FREQ = 12e6) // 12MHz default clock frequency
   (
    input  clk,
    input  hsync,
    input  vsync,
    output csync
    );

   localparam FRAME_LINES = 313; // 313 lines per frame Although my
   localparam HSYNC_FREQ  = 15666; // i.e 15.666 KHz horizontal sync
   // scope shows a 15.67 KHz Hsync signal frequency; using 15.666 KHz
   // for HSYNC_FREQ results in rounder numbers.
   localparam PULSE_WIDTH = 5e-6; // 5 us hsync pulse width

   // TODO: round instead of truncate LINE_TICKS to reduce drift
   localparam LINE_TICKS     = $rtoi(PLL_FREQ / HSYNC_FREQ); // per line clocks ticks (i.e dots)
   localparam PULSE_TICKS    = $rtoi(PLL_FREQ * PULSE_WIDTH); // width of hsync pulse
   localparam HSYNC_HIGH_DOT = LINE_TICKS - 2*PULSE_TICKS - 1;
   localparam HSYNC_LOW_DOT  = LINE_TICKS - PULSE_TICKS - 1;
   localparam DOT_COUNTER_WIDTH  = $clog2(LINE_TICKS);
   localparam LINE_COUNTER_WIDTH = $clog2(FRAME_LINES);

   reg [1:0] hreg;
   reg [1:0] vreg;
   reg 	     creg;
   reg [LINE_COUNTER_WIDTH:0] line_cnt;
   reg [DOT_COUNTER_WIDTH:0]  dot_cnt;

   wire 		      hpulse;
   wire 		      vpulse;

   assign hpulse = hreg[1] & ~hreg[0]; // Falling edge
   assign vpulse = vreg[0] & ~vreg[1]; // Rising edge
   assign csync  = creg;

   initial begin
      vreg     = 2'b11;
      creg     = 1;
      line_cnt = 0;
      dot_cnt  = 0;
   end

   always @(posedge clk)
     begin
	// Sampling vsync and hsync signals
        vreg[0] <= vsync;
	vreg[1] <= vreg[0];
        hreg[0] <= hsync;
	hreg[1] <= hreg[0];

	// Update counters
	if (vpulse)
	  line_cnt <= 0; // Resynchronize on vpulse
	if (hpulse)
	  // Resynchronize on hpulse to avoid drift. We're a few ticks
	  // into hsync_low when we see the pulse: FPGA samples the
	  // input signal a few times (maybe 2) before asserting the
	  // high-low transition, then we sample the signal 2 times
	  // with hreg[0] and hreg[1], then we take hpulse into
	  // account.
	  dot_cnt <= HSYNC_LOW_DOT + 5 ;
	else if (dot_cnt == LINE_TICKS-1) // End of line reached
	  begin
	     dot_cnt <= 0;
	     if (line_cnt == FRAME_LINES-1) // End of frame
	       line_cnt <= 0;
	     else
	       line_cnt <= line_cnt + 1;
	  end
	else
	  dot_cnt <= dot_cnt + 1;

	// csync based on counters
	if (dot_cnt < HSYNC_HIGH_DOT)
	  if (line_cnt < FRAME_LINES - 3) // on 2 last lines vsync is low
	    creg <= 1;
	  else // Max line_cnt value is FRAME_LINES-1
	    creg <= 0;
	else
	  if (dot_cnt < HSYNC_LOW_DOT)
	    creg <= 1;
	  else
	    creg <= 0;
     end // always @ (posedge clk)
endmodule // csync_generator
