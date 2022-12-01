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
  reg [23:0] u; // @[Scan.scala 43:18]
  reg [23:0] v; // @[Scan.scala 44:18]
  reg [23:0] m; // @[Scan.scala 45:18]
  wire [24:0] _u_T = {u, 1'h0}; // @[Scan.scala 48:13]
  wire [24:0] _GEN_12 = {{24'd0}, io_u_bit}; // @[Scan.scala 48:19]
  wire [24:0] _u_T_1 = _u_T | _GEN_12; // @[Scan.scala 48:19]
  wire [24:0] _v_T = {v, 1'h0}; // @[Scan.scala 49:13]
  wire [24:0] _GEN_13 = {{24'd0}, io_v_bit}; // @[Scan.scala 49:19]
  wire [24:0] _v_T_1 = _v_T | _GEN_13; // @[Scan.scala 49:19]
  wire [23:0] _T = u & m; // @[Scan.scala 40:47]
  wire  _T_1 = _T == 24'h0; // @[Scan.scala 40:52]
  wire [23:0] _T_2 = v & m; // @[Scan.scala 40:47]
  wire  _T_3 = _T_2 == 24'h0; // @[Scan.scala 40:52]
  wire [24:0] _m_T = {m, 1'h0}; // @[Scan.scala 52:12]
  wire [23:0] u0 = ~_T_1 & (_T_3 | v > u) ? v : u; // @[Scan.scala 57:57 58:10]
  wire [23:0] v0 = ~_T_1 & (_T_3 | v > u) ? u : v; // @[Scan.scala 57:57 59:10]
  wire [23:0] _T_13 = u0 & m; // @[Scan.scala 40:47]
  wire  _T_14 = _T_13 == 24'h0; // @[Scan.scala 40:52]
  wire [23:0] _u_T_4 = m - 24'h1; // @[Scan.scala 41:65]
  wire [23:0] _u_T_5 = ~_u_T_4; // @[Scan.scala 41:60]
  wire [23:0] _GEN_14 = {{1'd0}, u0[23:1]}; // @[Scan.scala 41:58]
  wire [23:0] _u_T_6 = _GEN_14 & _u_T_5; // @[Scan.scala 41:58]
  wire [23:0] _u_T_8 = u0 - v0; // @[Scan.scala 66:26]
  wire [23:0] _GEN_15 = {{1'd0}, _u_T_8[23:1]}; // @[Scan.scala 41:58]
  wire [23:0] _u_T_13 = _GEN_15 & _u_T_5; // @[Scan.scala 41:58]
  wire [23:0] _GEN_2 = _T_14 ? _u_T_6 : _u_T_13; // @[Scan.scala 63:28 64:9 66:9]
  wire [24:0] _GEN_3 = _T_1 & _T_3 ? _m_T : {{1'd0}, m}; // @[Scan.scala 45:18 51:49 52:7]
  wire [23:0] _GEN_4 = _T_1 & _T_3 ? v : v0; // @[Scan.scala 44:18 51:49 62:7]
  wire [23:0] _GEN_5 = _T_1 & _T_3 ? u : _GEN_2; // @[Scan.scala 43:18 51:49]
  wire [24:0] _GEN_6 = io_done ? {{1'd0}, m} : _GEN_3; // @[Scan.scala 45:18 50:26]
  wire [23:0] _GEN_7 = io_done ? v : _GEN_4; // @[Scan.scala 44:18 50:26]
  wire [23:0] _GEN_8 = io_done ? u : _GEN_5; // @[Scan.scala 43:18 50:26]
  wire [24:0] _GEN_9 = io_ld ? _u_T_1 : {{1'd0}, _GEN_8}; // @[Scan.scala 47:16 48:7]
  wire [24:0] _GEN_10 = io_ld ? _v_T_1 : {{1'd0}, _GEN_7}; // @[Scan.scala 47:16 49:7]
  wire [24:0] _GEN_11 = io_ld ? {{1'd0}, m} : _GEN_6; // @[Scan.scala 47:16 45:18]
  wire [24:0] _GEN_16 = reset ? 25'h0 : _GEN_9; // @[Scan.scala 43:{18,18}]
  wire [24:0] _GEN_17 = reset ? 25'h0 : _GEN_10; // @[Scan.scala 44:{18,18}]
  wire [24:0] _GEN_18 = reset ? 25'h1 : _GEN_11; // @[Scan.scala 45:{18,18}]
  assign io_z_bit = u[23]; // @[Scan.scala 70:16]
  assign io_done = u == v | v == 24'h0; // @[Scan.scala 71:22]
  always @(posedge clock) begin
    u <= _GEN_16[23:0]; // @[Scan.scala 43:{18,18}]
    v <= _GEN_17[23:0]; // @[Scan.scala 44:{18,18}]
    m <= _GEN_18[23:0]; // @[Scan.scala 45:{18,18}]
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
  u = _RAND_0[23:0];
  _RAND_1 = {1{`RANDOM}};
  v = _RAND_1[23:0];
  _RAND_2 = {1{`RANDOM}};
  m = _RAND_2[23:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
