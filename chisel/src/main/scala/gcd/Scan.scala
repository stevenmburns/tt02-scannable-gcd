package gcd

import chisel3._

class ScanIfc(val n : Int) extends Module {
  val io = IO(new Bundle {
    val ld = Input(Bool())
    val u_bit = Input(Bool())
    val v_bit = Input(Bool())
    val z_bit = Output(Bool())
    val done = Output(Bool())
  })
}

class Scan(n : Int) extends ScanIfc(n) {
  val u = RegInit(0.U(n.W))
  val v = RegInit(0.U(n.W))

  io.z_bit := u(n-1)
  when (io.ld) {
    u := (u << 1) | io.u_bit
    v := (v << 1) | io.v_bit
  } .elsewhen (u > v) {
    u := u - v
  } .otherwise {
    v := v - u
  }

  io.done := v === 0.U
}

object MainScan extends App {
  emitVerilog(new Scan(32))
}

class ScanBinary(n : Int) extends ScanIfc(n) {
  def isEven( u : UInt, m : UInt) : Bool = (u & m) === 0.U
  def shiftRight( u : UInt, m : UInt) : UInt = {
    val mask_vec = m.asBools
    val inv_mask_vec = Wire(Vec(n, Bool()))
    inv_mask_vec(0) := mask_vec(0)
    for { k <- 1 until n } {
      inv_mask_vec(k) := mask_vec(k) | inv_mask_vec(k-1)
    }
    val inv_mask = inv_mask_vec.asUInt
    ( u >> 1) & inv_mask
  }

  val u = RegInit(0.U(n.W))
  val v = RegInit(0.U(n.W))
  val m = RegInit(1.U(n.W))

  val isEven_u = isEven( u, m)
  val isEven_v = isEven( v, m)


  when( io.ld) {
    u := (u << 1) | io.u_bit
    v := (v << 1) | io.v_bit
  } .elsewhen ( io.done) {
  } .elsewhen ( isEven_u && isEven_v) {
    m := m << 1
  } .otherwise {
    val u0 = WireInit(u)
    val v0 = WireInit(v)
    val isEven_u0 = WireInit(isEven_u)

    when ( !isEven_u && ( isEven_v || v > u)) {
      u0 := v
      v0 := u
      isEven_u0 := isEven_v
    }

    v := v0
    when (isEven_u0) {
      u := shiftRight( u0, m)
    } .otherwise {
      u := shiftRight( u0-v0, m)
    }
  }

  io.z_bit := u(n-1)
  io.done := u === v || v === 0.U
}

object MainScanBinary extends App {
  emitVerilog(new ScanBinary(16))
}
