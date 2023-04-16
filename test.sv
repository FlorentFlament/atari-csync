module test
  #(parameter CNT_WIDTH = 26)
   (
    input  clk,
    output led
    );

   reg [CNT_WIDTH:0] counter;

   assign led  = counter[CNT_WIDTH-1];

   initial
     begin
	counter = 0;
     end

   always @(posedge clk)
     begin
	counter <= counter + 1;
     end
endmodule // csync_generator
