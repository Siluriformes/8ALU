/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    input [23:0] io_dip,
    input [4:0] io_button,
    output reg [7:0] led,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  reg [29:0] M_counter_d, M_counter_q = 1'h0;
  wire [7-1:0] M_seg_display_seg;
  wire [4-1:0] M_seg_display_sel;
  reg [20-1:0] M_seg_display_values;
  multi_seven_seg_2 seg_display (
    .clk(clk),
    .rst(rst),
    .values(M_seg_display_values),
    .seg(M_seg_display_seg),
    .sel(M_seg_display_sel)
  );
  localparam IDLE_state = 4'd0;
  localparam ADDERTEST1_state = 4'd1;
  localparam ADDERERRORTEST_state = 4'd2;
  localparam ADDERERROR_state = 4'd3;
  localparam COMPTEST1_state = 4'd4;
  localparam COMPERRORTEST_state = 4'd5;
  localparam COMPERROR_state = 4'd6;
  localparam BOOLEANTEST1_state = 4'd7;
  localparam BOOLEANERRORTEST_state = 4'd8;
  localparam BOOLEANERROR_state = 4'd9;
  localparam SHIFTTEST1_state = 4'd10;
  localparam SHIFTERRORTEST_state = 4'd11;
  localparam SHIFTERROR_state = 4'd12;
  localparam END_state = 4'd13;
  
  reg [3:0] M_state_d, M_state_q = IDLE_state;
  
  reg [5:0] alufn;
  
  reg [7:0] a;
  
  reg [7:0] b;
  
  reg [7:0] alu;
  
  localparam X = 5'h1b;
  
  wire [5-1:0] M_decdigit_out3;
  wire [5-1:0] M_decdigit_out2;
  wire [5-1:0] M_decdigit_out1;
  wire [5-1:0] M_decdigit_out0;
  reg [8-1:0] M_decdigit_in;
  reg [1-1:0] M_decdigit_n;
  dec_digit_3 decdigit (
    .in(M_decdigit_in),
    .n(M_decdigit_n),
    .out3(M_decdigit_out3),
    .out2(M_decdigit_out2),
    .out1(M_decdigit_out1),
    .out0(M_decdigit_out0)
  );
  
  wire [8-1:0] M_alu1_alu;
  wire [1-1:0] M_alu1_z;
  wire [1-1:0] M_alu1_v;
  wire [1-1:0] M_alu1_n;
  reg [6-1:0] M_alu1_alufn;
  reg [8-1:0] M_alu1_a;
  reg [8-1:0] M_alu1_b;
  alu_4 alu1 (
    .alufn(M_alu1_alufn),
    .a(M_alu1_a),
    .b(M_alu1_b),
    .alu(M_alu1_alu),
    .z(M_alu1_z),
    .v(M_alu1_v),
    .n(M_alu1_n)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_counter_d = M_counter_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led[1+5-:6] = 6'h00;
    M_seg_display_values = {M_decdigit_out3, M_decdigit_out2, M_decdigit_out1, M_decdigit_out0};
    io_seg = ~M_seg_display_seg;
    io_sel = ~M_seg_display_sel;
    b = io_dip[0+7-:8];
    a = io_dip[8+7-:8];
    alufn = io_dip[16+0+5-:6];
    M_alu1_alufn = alufn;
    M_alu1_a = a;
    M_alu1_b = b;
    alu = M_alu1_alu;
    io_led[16+7-:8] = alufn;
    io_led[8+7-:8] = io_dip[8+7-:8];
    io_led[0+7-:8] = io_dip[0+7-:8];
    led[7+0-:1] = M_alu1_v;
    led[0+0-:1] = M_alu1_n;
    M_decdigit_in = alu;
    if (alufn[4+1-:2] == 2'h0) begin
      M_decdigit_n = M_alu1_n;
    end else begin
      M_decdigit_n = 1'h0;
    end
    
    case (M_state_q)
      IDLE_state: begin
        M_counter_d = 1'h0;
        if (io_button[1+0-:1] == 1'h1) begin
          M_state_d = ADDERTEST1_state;
        end
      end
      ADDERTEST1_state: begin
        M_alu1_alufn = 6'h01;
        M_alu1_a = 8'h05;
        M_alu1_b = 8'h08;
        io_led[16+7-:8] = 8'h01;
        io_led[8+7-:8] = 8'h05;
        io_led[0+7-:8] = 8'h08;
        M_seg_display_values[15+4-:5] = 4'hf;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[27+0-:1] == 1'h1 && alu == 8'h03) begin
          M_counter_d = 1'h0;
          M_state_d = ADDERERRORTEST_state;
        end else begin
          if (M_counter_q[27+0-:1] == 1'h1 && alu != 8'h03) begin
            M_counter_d = 1'h0;
            M_state_d = ADDERERROR_state;
          end
        end
      end
      ADDERERRORTEST_state: begin
        M_alu1_alufn = 6'h00;
        M_alu1_a = 8'h05;
        M_alu1_b = 8'h07;
        alu = M_alu1_alu + 1'h1;
        io_led[8+7-:8] = 8'h07;
        io_led[0+7-:8] = 8'h05;
        M_decdigit_in = alu;
        M_seg_display_values[15+4-:5] = 4'hf;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[27+0-:1] == 1'h1 && alu == 8'h0c) begin
          M_counter_d = 1'h0;
          M_state_d = COMPTEST1_state;
        end else begin
          if (M_counter_q[27+0-:1] == 1'h1 && alu != 8'h0c) begin
            M_counter_d = 1'h0;
            M_state_d = ADDERERROR_state;
          end
        end
      end
      ADDERERROR_state: begin
        M_counter_d = 1'h0;
        M_seg_display_values = 20'h7b98c;
        if (io_button[1+0-:1] == 1'h1) begin
          M_state_d = COMPTEST1_state;
        end
      end
      COMPTEST1_state: begin
        M_alu1_alufn = 6'h33;
        M_alu1_a = 8'hb4;
        M_alu1_b = 8'hb4;
        alu = M_alu1_alu;
        io_led[16+7-:8] = 6'h33;
        io_led[8+7-:8] = 8'hb4;
        io_led[0+7-:8] = 8'hb4;
        M_seg_display_values[15+4-:5] = 5'h10;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[27+0-:1] == 1'h1 && alu == 8'h01) begin
          M_counter_d = 1'h0;
          M_state_d = COMPERRORTEST_state;
        end else begin
          if (M_counter_q[27+0-:1] == 1'h1 && alu != 8'h01) begin
            M_counter_d = 1'h0;
            M_state_d = COMPERROR_state;
          end
        end
      end
      COMPERRORTEST_state: begin
        M_alu1_alufn = 6'h33;
        M_alu1_a = 8'h0f;
        M_alu1_b = 8'h0f;
        alu = 1'h1 ^ M_alu1_alu;
        io_led[16+7-:8] = 6'h33;
        io_led[8+7-:8] = 8'h0f;
        io_led[0+7-:8] = 8'h0f;
        M_decdigit_in = alu;
        M_seg_display_values[15+4-:5] = 5'h10;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[27+0-:1] == 1'h1 && alu == 8'h01) begin
          M_counter_d = 1'h0;
          M_state_d = BOOLEANTEST1_state;
        end else begin
          if (M_counter_q[27+0-:1] == 1'h1 && alu != 8'h01) begin
            M_counter_d = 1'h0;
            M_state_d = COMPERROR_state;
          end
        end
      end
      COMPERROR_state: begin
        M_seg_display_values = 20'h8398c;
        if (io_button[1+0-:1] == 1'h1) begin
          M_state_d = BOOLEANTEST1_state;
        end
      end
      BOOLEANTEST1_state: begin
        M_alu1_alufn = 6'h18;
        M_alu1_a = 8'hb4;
        M_alu1_b = 8'hed;
        alu = M_alu1_alu;
        io_led[16+7-:8] = 6'h18;
        io_led[8+7-:8] = 8'hed;
        io_led[0+7-:8] = 8'hb4;
        M_seg_display_values[15+4-:5] = 5'h08;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[27+0-:1] == 1'h1 && alu == 8'ha4) begin
          M_counter_d = 1'h0;
          M_state_d = BOOLEANERRORTEST_state;
        end else begin
          if (M_counter_q[27+0-:1] == 1'h1 && alu != 8'ha4) begin
            M_counter_d = 1'h0;
            M_state_d = BOOLEANERROR_state;
          end
        end
      end
      BOOLEANERRORTEST_state: begin
        M_alu1_alufn = 6'h18;
        M_alu1_a = 8'hd4;
        M_alu1_b = 8'h00;
        alu = M_alu1_alu + 1'h1;
        io_led[16+7-:8] = 6'h18;
        io_led[8+7-:8] = 8'h33;
        io_led[0+7-:8] = 8'h00;
        M_seg_display_values[15+4-:5] = 5'h08;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[27+0-:1] == 1'h1 && alu == 8'h00) begin
          M_counter_d = 1'h0;
          M_state_d = SHIFTTEST1_state;
        end else begin
          if (M_counter_q[27+0-:1] == 1'h1 && alu != 8'h00) begin
            M_counter_d = 1'h0;
            M_state_d = BOOLEANERROR_state;
          end
        end
      end
      BOOLEANERROR_state: begin
        M_seg_display_values = 20'h4398c;
        if (io_button[1+0-:1] == 1'h1) begin
          M_state_d = SHIFTTEST1_state;
        end
      end
      SHIFTTEST1_state: begin
        M_alu1_alufn = 6'h20;
        M_alu1_a = 8'h0f;
        M_alu1_b = 8'h04;
        alu = M_alu1_alu;
        io_led[16+7-:8] = 6'h20;
        io_led[8+7-:8] = 8'h04;
        io_led[0+7-:8] = 8'h0f;
        M_seg_display_values[15+4-:5] = 5'h05;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[27+0-:1] == 1'h1 && alu == 8'hf0) begin
          M_counter_d = 1'h0;
          M_state_d = SHIFTERRORTEST_state;
        end else begin
          if (M_counter_q[27+0-:1] == 1'h1 && alu != 8'hf0) begin
            M_counter_d = 1'h0;
            M_state_d = SHIFTERROR_state;
          end
        end
      end
      SHIFTERRORTEST_state: begin
        M_alu1_alufn = 6'h21;
        M_alu1_a = 8'h68;
        M_alu1_b = 8'h02;
        alu = M_alu1_alu + 1'h1;
        io_led[16+7-:8] = 6'h21;
        io_led[8+7-:8] = 8'h02;
        io_led[0+7-:8] = 8'h68;
        M_decdigit_in = alu;
        M_seg_display_values[15+4-:5] = 5'h05;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[27+0-:1] == 1'h1 && alu == 8'h1a) begin
          M_counter_d = 1'h0;
          M_state_d = END_state;
        end else begin
          if (M_counter_q[27+0-:1] == 1'h1 && alu != 8'h1a) begin
            M_counter_d = 1'h0;
            M_state_d = SHIFTERROR_state;
          end
        end
      end
      SHIFTERROR_state: begin
        M_seg_display_values = 20'h2b98c;
        if (io_button[1+0-:1] == 1'h1) begin
          M_state_d = END_state;
        end
      end
      END_state: begin
        M_seg_display_values = 20'h001ae;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[27+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_state_d = IDLE_state;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule
