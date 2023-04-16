// Generates clean csync pulse when seeing hsync pulse
// vsync is used when no pulse is being sent
module csync_pulse
  #(parameter CNT_WIDTH = 8)
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
      counter = 2**(CNT_WIDTH-1);
   end

   always @(posedge clk)
     begin
        hreg[0] <= hsync;
        vreg[0] <= vsync;
	hreg[1] <= hreg[0];
	vreg[1] <= vreg[0];

        if (hpulse)
	  counter <= 0;
	else if (counter[CNT_WIDTH-1] == 0)
	  counter <= counter + 1;
	else
	  counter <= counter;

	if (counter[CNT_WIDTH-1] == 1)
	  creg <= vreg[1];
	else if (counter[CNT_WIDTH-2] == 0)
	  creg <= 1;
	else
	  creg <= 0;
     end // always @ (posedge clk)
endmodule
