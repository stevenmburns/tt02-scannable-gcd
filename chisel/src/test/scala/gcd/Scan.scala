// See README.md for license details.

package gcd

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.experimental.BundleLiterals._
import scala.util.Random

object Fib {
  def apply(n: Int): BigInt =
    ((0 until n).foldLeft((BigInt(0),BigInt(1))){
      case ((f0,f1), _) => (f1,f0+f1)
    })._1
}

object GCD {
  @annotation.tailrec
  def apply(u: BigInt, v: BigInt): BigInt =
    if (v == 0) u else GCD(v, u % v)
}

class ScanTester(factory : () => ScanIfc) extends AnyFreeSpec with ChiselScalatestTester {

  val rnd = new Random()

  "Gcd should calculate proper greatest common denominator" in {
    test(factory()) { dut =>
      dut.io.ld.poke(true.B)

      val n = dut.n

      def example(u : BigInt, v : BigInt): BigInt = {

        for {k <- 0 until n} {
          val u_bit = (u & (BigInt(1)<<(n-1-k))) != 0
          val v_bit = (v & (BigInt(1)<<(n-1-k))) != 0
          // println(s"scanin $k ${u_bit} ${v_bit}")

          dut.io.u_bit.poke(u_bit.B)
          dut.io.v_bit.poke(v_bit.B)
          dut.clock.step()
          // println(s"scanin $k ${dut.io.u.peek()} ${dut.io.v.peek()}")
        }

        dut.io.ld.poke(false.B)

        //println(s"Working on u = $u v = $v...")

        var count = 0

        while (!dut.io.done.peek().litToBoolean && count < 1000) {
          dut.clock.step()
          count += 1
        }
        //println(s"count $count")

        dut.io.ld.poke(true.B)

        var result = 0
        for {k <- 0 until n} {
          // println(s"$k ${dut.io.z_bit.peek().litToBoolean}")
          result = result << 1 | (if (dut.io.z_bit.peek().litToBoolean) 1 else 0)
          dut.clock.step()
        }

        println(s"u = $u v = $v result = $result count = $count")
        result

      }
      assert( example(10, 5) == 5)

      assert( example(3*4*5, 2*5) == 2*5)

      assert( example(Fib(10), Fib(11)) == GCD(10, 11))

      for { _ <- 0 until 100 } {

        val u = BigInt(n, rnd)
        val v = BigInt(n, rnd)

        assert(example(u, v) == GCD(u, v))

      }




    }
  }
}

class ScanTest12 extends ScanTester(() => new Scan(12))
class ScanBinaryTest12 extends ScanTester(() => new ScanBinary(12))
