/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_4 (
    input [5:0] alufn,
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] alu,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  wire [8-1:0] M_adder1_sum;
  wire [1-1:0] M_adder1_z;
  wire [1-1:0] M_adder1_v;
  wire [1-1:0] M_adder1_n;
  reg [6-1:0] M_adder1_alufn;
  reg [8-1:0] M_adder1_a;
  reg [8-1:0] M_adder1_b;
  adder_8 adder1 (
    .alufn(M_adder1_alufn),
    .a(M_adder1_a),
    .b(M_adder1_b),
    .sum(M_adder1_sum),
    .z(M_adder1_z),
    .v(M_adder1_v),
    .n(M_adder1_n)
  );
  
  wire [8-1:0] M_compare1_cmp;
  reg [6-1:0] M_compare1_alufn;
  reg [1-1:0] M_compare1_z;
  reg [1-1:0] M_compare1_v;
  reg [1-1:0] M_compare1_n;
  comparator_9 compare1 (
    .alufn(M_compare1_alufn),
    .z(M_compare1_z),
    .v(M_compare1_v),
    .n(M_compare1_n),
    .cmp(M_compare1_cmp)
  );
  
  wire [8-1:0] M_boolean1_boole;
  reg [6-1:0] M_boolean1_alufn;
  reg [8-1:0] M_boolean1_a;
  reg [8-1:0] M_boolean1_b;
  boolean_10 boolean1 (
    .alufn(M_boolean1_alufn),
    .a(M_boolean1_a),
    .b(M_boolean1_b),
    .boole(M_boolean1_boole)
  );
  
  wire [8-1:0] M_shifter1_shift;
  reg [6-1:0] M_shifter1_alufn;
  reg [8-1:0] M_shifter1_a;
  reg [8-1:0] M_shifter1_b;
  shifter_11 shifter1 (
    .alufn(M_shifter1_alufn),
    .a(M_shifter1_a),
    .b(M_shifter1_b),
    .shift(M_shifter1_shift)
  );
  
  always @* begin
    M_adder1_a = a;
    M_adder1_b = b;
    M_adder1_alufn = alufn;
    M_compare1_alufn = alufn;
    M_compare1_v = M_adder1_v;
    M_compare1_n = M_adder1_n;
    M_compare1_z = M_adder1_z;
    M_boolean1_a = a;
    M_boolean1_b = b;
    M_boolean1_alufn = alufn;
    M_shifter1_a = a;
    M_shifter1_b = b;
    M_shifter1_alufn = alufn;
    
    case (alufn[4+1-:2])
      2'h0: begin
        alu = M_adder1_sum;
      end
      2'h1: begin
        alu = M_boolean1_boole;
      end
      2'h2: begin
        alu = M_shifter1_shift;
      end
      2'h3: begin
        alu = M_compare1_cmp;
      end
      default: begin
        alu = 8'h00;
      end
    endcase
    v = M_adder1_v;
    n = M_adder1_n;
    z = M_adder1_z;
  end
endmodule
