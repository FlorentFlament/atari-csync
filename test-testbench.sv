module test_test
  #(parameter PLL_FREQ = 102e6) // 102MHz PLL clock_out
   ;
   localparam FRAME_LINES = 313; // 313 lines per frame
   localparam HSYNC_FREQ  = 15666; // i.e 15.666 KHz horizontal sync
   localparam PULSE_WIDTH = 5e-6; // 5 us hsync pulse width
   
   localparam LINE_TICKS  = $rtoi(PLL_FREQ / HSYNC_FREQ); // per line clocks ticks (i.e dots)

   localparam PULSE_TICKS    = $rtoi(PLL_FREQ * PULSE_WIDTH); // width of hsync pulse
   localparam HSYNC_HIGH_DOT = LINE_TICKS - 2*PULSE_TICKS - 1;
   localparam HSYNC_LOW_DOT  = LINE_TICKS - PULSE_TICKS - 1;
   localparam DOT_COUNTER_WIDTH  = $clog2(LINE_TICKS);
   localparam LINE_COUNTER_WIDTH = $clog2(FRAME_LINES);

//   localparam LINE_TICKS  = PLL_FREQ / HSYNC_FREQ + 1; // per line clocks ticks (i.e dots)
//   localparam PULSE_TICKS = PLL_FREQ * PULSE_WIDTH;
//   localparam DOT_COUNTER_WIDTH  = $clog2(LINE_TICKS);
//   localparam LINE_COUNTER_WIDTH = $clog2(FRAME_LINES);
   
   initial begin
      $display("DOT_COUNTER_WIDTH: %d", DOT_COUNTER_WIDTH);
      $display("LINE_COUNTER_WIDTH: %d", LINE_COUNTER_WIDTH);
      $display("LINE_TICKS-1: %d", LINE_TICKS-1);
      $display("FRAME_LINES-1: %d", FRAME_LINES-1);
      $display("HSYNC_HIGH_DOT: %d", HSYNC_HIGH_DOT);
      $display("HSYNC_LOW_DOT: %d", HSYNC_LOW_DOT);
      $display("FRAME_LINES - 3: %d", FRAME_LINES - 3);
   end
endmodule
