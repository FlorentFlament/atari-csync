module csync_generator(clk, hsync, vsync, csync);
   input  clk;
   input  hsync;
   input  vsync;
   output csync;

   reg 	  hreg0;
   reg 	  hreg1;
   reg 	  vreg0;
   reg [1:0] counter;
   reg       creg;
   wire      hpulse;

   assign hpulse = hreg1 & ~hreg0;
   assign csync = creg;

   initial begin
      hreg0 = 1;
      hreg1 = 1;
      vreg0 = 1;
      counter = 0;
      creg = 1;
   end

   always @(posedge clk)
     begin
        hreg0 <= hsync;
        hreg1 <= hreg0;
        vreg0 <= vsync;

        if (hpulse) begin
           counter <= 3;
           creg <= 1;
        end

        else begin
           if (counter > 0)
             counter <= counter - 1;
           case(counter)
             0: creg <= vreg0;
             1: creg <= 0;
             2: creg <= 0;
             3: creg <= 1;
           endcase // case (counter)
        end // else: !if(hpulse)
     end // always @ (posedge clk)
endmodule // csync_generator
