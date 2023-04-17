// Fully generate csync signal, just syncing on vsync
// Hsync signal frequency is 15.67KHz
// With a clock at 12MHz, it makes 775.8 ticks per line
module gen_sync
   (
    input  clk,
    input  hsync,
    input  vsync,
    output csync
    );
   reg [1:0] hreg;
   reg [1:0] vreg;
   reg 	     creg;
   reg [8:0] line_cnt;
   reg [9:0] dot_cnt;

   wire      hpulse;
   wire      vpulse;

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
	// Sampling vsync
        vreg[0] <= vsync;
	vreg[1] <= vreg[0];
        hreg[0] <= hsync;
	hreg[1] <= hreg[0];

	// Update counters
	if (vpulse)
	     line_cnt <= 0; // Resynchronize on vpulse
	if (hpulse)
	     dot_cnt <= 709 ; // Resynchronize on hpulse (avoids drift)
	else if (dot_cnt == 765)
	  begin
	     if (line_cnt == 312)
	       line_cnt <= 0;
	     else
	       line_cnt <= line_cnt + 1;
	     dot_cnt <= 0;
	  end
	else
	  dot_cnt <= dot_cnt + 1;

	// csync based on counters
	if (dot_cnt > 645)
	  if (dot_cnt <= 705)
	    creg <= 1;
	  else
	    creg <= 0;
	else
	  if (line_cnt < 310)
	    creg <= 1;
	  else // Max line value is 312
	    creg <= 0;

     end // always @ (posedge clk)
endmodule // csync_generator
