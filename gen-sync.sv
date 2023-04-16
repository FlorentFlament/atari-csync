// Fully generate csync signal, just syncing on vsync
module gen_sync
   (
    input  clk,
    input  vsync,
    output csync
    );
   reg [1:0] vreg;
   reg 	     creg;
   reg [8:0] line_cnt;
   reg [9:0] dot_cnt;

   wire      vpulse;

   assign vpulse = vreg[0] & ~vreg[1];
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

	// Update counters
	if (vpulse)
	  begin
	     line_cnt <= 0;
	     dot_cnt <= 100; // That's when the pulse arrives
	  end
	else if (dot_cnt == 765)
	  begin
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
	  else
	    creg <= 0;

     end // always @ (posedge clk)
endmodule // csync_generator
