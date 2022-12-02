module ScanBinary(
  input   clock,
  input   reset,
  input   io_ld,
  input   io_u_bit,
  input   io_v_bit,
  output  io_z_bit,
  output  io_done
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [11:0] u; // @[Scan.scala 50:14]
  reg [11:0] v; // @[Scan.scala 51:14]
  reg [11:0] m; // @[Scan.scala 52:14]
  wire [11:0] _isEven_u_T = u & m; // @[Scan.scala 37:47]
  wire  isEven_u = _isEven_u_T == 12'h0; // @[Scan.scala 37:52]
  wire [11:0] _isEven_v_T = v & m; // @[Scan.scala 37:47]
  wire  isEven_v = _isEven_v_T == 12'h0; // @[Scan.scala 37:52]
  wire [12:0] _u_T = {u, 1'h0}; // @[Scan.scala 58:13]
  wire [12:0] _GEN_13 = {{12'd0}, io_u_bit}; // @[Scan.scala 58:19]
  wire [12:0] _u_T_1 = _u_T | _GEN_13; // @[Scan.scala 58:19]
  wire [12:0] _v_T = {v, 1'h0}; // @[Scan.scala 59:13]
  wire [12:0] _GEN_14 = {{12'd0}, io_v_bit}; // @[Scan.scala 59:19]
  wire [12:0] _v_T_1 = _v_T | _GEN_14; // @[Scan.scala 59:19]
  wire  _T = isEven_u & isEven_v; // @[Scan.scala 62:25]
  wire [12:0] _m_T = {m, 1'h0}; // @[Scan.scala 63:12]
  wire [11:0] u0 = ~isEven_u & (isEven_v | v > u) ? v : u; // @[Scan.scala 71:47 72:10]
  wire [11:0] v0 = ~isEven_u & (isEven_v | v > u) ? u : v; // @[Scan.scala 71:47 73:10]
  wire  isEven_u0 = ~isEven_u & (isEven_v | v > u) ? isEven_v : isEven_u; // @[Scan.scala 71:47 74:17]
  wire  u_mask_vec_0 = m[0]; // @[Scan.scala 39:22]
  wire  u_mask_vec_1 = m[1]; // @[Scan.scala 39:22]
  wire  u_mask_vec_2 = m[2]; // @[Scan.scala 39:22]
  wire  u_mask_vec_3 = m[3]; // @[Scan.scala 39:22]
  wire  u_mask_vec_4 = m[4]; // @[Scan.scala 39:22]
  wire  u_mask_vec_5 = m[5]; // @[Scan.scala 39:22]
  wire  u_mask_vec_6 = m[6]; // @[Scan.scala 39:22]
  wire  u_mask_vec_7 = m[7]; // @[Scan.scala 39:22]
  wire  u_mask_vec_8 = m[8]; // @[Scan.scala 39:22]
  wire  u_mask_vec_9 = m[9]; // @[Scan.scala 39:22]
  wire  u_mask_vec_10 = m[10]; // @[Scan.scala 39:22]
  wire  u_mask_vec_11 = m[11]; // @[Scan.scala 39:22]
  wire  u_inv_mask_vec__1 = u_mask_vec_1 | u_mask_vec_0; // @[Scan.scala 43:38]
  wire  u_inv_mask_vec__2 = u_mask_vec_2 | u_inv_mask_vec__1; // @[Scan.scala 43:38]
  wire  u_inv_mask_vec__3 = u_mask_vec_3 | u_inv_mask_vec__2; // @[Scan.scala 43:38]
  wire  u_inv_mask_vec__4 = u_mask_vec_4 | u_inv_mask_vec__3; // @[Scan.scala 43:38]
  wire  u_inv_mask_vec__5 = u_mask_vec_5 | u_inv_mask_vec__4; // @[Scan.scala 43:38]
  wire  u_inv_mask_vec__6 = u_mask_vec_6 | u_inv_mask_vec__5; // @[Scan.scala 43:38]
  wire  u_inv_mask_vec__7 = u_mask_vec_7 | u_inv_mask_vec__6; // @[Scan.scala 43:38]
  wire  u_inv_mask_vec__8 = u_mask_vec_8 | u_inv_mask_vec__7; // @[Scan.scala 43:38]
  wire  u_inv_mask_vec__9 = u_mask_vec_9 | u_inv_mask_vec__8; // @[Scan.scala 43:38]
  wire  u_inv_mask_vec__10 = u_mask_vec_10 | u_inv_mask_vec__9; // @[Scan.scala 43:38]
  wire  u_inv_mask_vec__11 = u_mask_vec_11 | u_inv_mask_vec__10; // @[Scan.scala 43:38]
  wire [5:0] u_inv_mask_lo = {u_inv_mask_vec__5,u_inv_mask_vec__4,u_inv_mask_vec__3,u_inv_mask_vec__2,u_inv_mask_vec__1,
    u_mask_vec_0}; // @[Scan.scala 45:33]
  wire [11:0] u_inv_mask = {u_inv_mask_vec__11,u_inv_mask_vec__10,u_inv_mask_vec__9,u_inv_mask_vec__8,u_inv_mask_vec__7,
    u_inv_mask_vec__6,u_inv_mask_lo}; // @[Scan.scala 45:33]
  wire [11:0] _GEN_15 = {{1'd0}, u0[11:1]}; // @[Scan.scala 46:15]
  wire [11:0] _u_T_3 = _GEN_15 & u_inv_mask; // @[Scan.scala 46:15]
  wire [11:0] _u_T_5 = u0 - v0; // @[Scan.scala 81:26]
  wire [11:0] _GEN_16 = {{1'd0}, _u_T_5[11:1]}; // @[Scan.scala 46:15]
  wire [11:0] _u_T_7 = _GEN_16 & u_inv_mask; // @[Scan.scala 46:15]
  wire [11:0] _GEN_3 = isEven_u0 ? _u_T_3 : _u_T_7; // @[Scan.scala 78:22 79:9 81:9]
  wire [12:0] _GEN_4 = isEven_u & isEven_v ? _m_T : {{1'd0}, m}; // @[Scan.scala 52:14 62:38 63:7]
  wire [11:0] _GEN_5 = isEven_u & isEven_v ? v : v0; // @[Scan.scala 51:14 62:38 77:7]
  wire [11:0] _GEN_6 = isEven_u & isEven_v ? u : _GEN_3; // @[Scan.scala 50:14 62:38]
  wire [12:0] _GEN_7 = io_done ? {{1'd0}, m} : _GEN_4; // @[Scan.scala 52:14 61:25]
  wire [11:0] _GEN_8 = io_done ? v : _GEN_5; // @[Scan.scala 51:14 61:25]
  wire [11:0] _GEN_9 = io_done ? u : _GEN_6; // @[Scan.scala 50:14 61:25]
  wire [12:0] _GEN_10 = io_ld ? _u_T_1 : {{1'd0}, _GEN_9}; // @[Scan.scala 57:15 58:7]
  wire [12:0] _GEN_11 = io_ld ? _v_T_1 : {{1'd0}, _GEN_8}; // @[Scan.scala 57:15 59:7]
  wire [12:0] _GEN_12 = io_ld ? 13'h1 : _GEN_7; // @[Scan.scala 57:15 60:7]
  assign io_z_bit = u[11]; // @[Scan.scala 85:16]
  assign io_done = u == v | v == 12'h0; // @[Scan.scala 86:22]
  always @(posedge clock) begin
    u <= _GEN_10[11:0];
    v <= _GEN_11[11:0];
    m <= _GEN_12[11:0];
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~io_ld & ~io_done & ~_T & ~reset) begin
          $fwrite(32'h80000002,"%x %x\n",u,v); // @[Scan.scala 69:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  u = _RAND_0[11:0];
  _RAND_1 = {1{`RANDOM}};
  v = _RAND_1[11:0];
  _RAND_2 = {1{`RANDOM}};
  m = _RAND_2[11:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
