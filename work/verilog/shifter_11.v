/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shifter_11 (
    input [5:0] alufn,
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] shift
  );
  
  
  
  always @* begin
    
    case (alufn[0+1-:2])
      2'h0: begin
        shift = a << b[0+2-:3];
      end
      2'h1: begin
        shift = a >> b[0+2-:3];
      end
      2'h3: begin
        shift = $signed(a) >>> b[0+2-:3];
      end
      default: begin
        shift = a;
      end
    endcase
  end
endmodule
