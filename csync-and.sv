// Just performs and between hsync and vsync to generate csync
module csync_and
  (
    input  hsync,
    input  vsync,
    output csync
   );
   assign csync = hsync & vsync;
endmodule
