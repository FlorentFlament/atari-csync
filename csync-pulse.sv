// Generates clean csync pulse when seeing hsync pulse
// vsync is used when no pulse is being sent
//
// a pulse is --__ for a total of 10us (i.e 120 ticks at 12MHz)
// plus we need 3us i.e 36 ticks before to be late enough to know vsync level.
// nearest power of 2 are 64 ticks wait + 64 ticks up + 64 ticks down
module csync_pulse
  #(parameter CNT_WIDTH = 7)
   (
    input  clk,
    input  hsync,
    input  vsync,
    output csync
    );

   reg [1:0]         hreg;
   reg [1:0]         vreg;
   reg 		     creg;
   reg [CNT_WIDTH:0] counter;
   wire 	     hpulse;

   assign hpulse = hreg[1] & ~hreg[0];
   assign csync  = creg;

   initial begin
      hreg    = 2'b11;
      vreg    = 2'b11;
      creg    = 1;
      counter = 192; // i.e end of cycle
   end

   always @(posedge clk)
     begin
        hreg[0] <= hsync;
        vreg[0] <= vsync;
	hreg[1] <= hreg[0];
	vreg[1] <= vreg[0];

        if (hpulse)
	  counter <= 0;
	else if (counter < 192) // 192 ticks pulse cycle
	  counter <= counter + 1;
	else
	  counter <= counter;

	if (counter < 64)
	  creg <= vreg[1];
	else if (counter < 128)
	  creg <= 1;
	else if (counter < 192)
	  creg <= 0;
	else
	  creg <= vreg[1];
     end // always @ (posedge clk)
endmodule
