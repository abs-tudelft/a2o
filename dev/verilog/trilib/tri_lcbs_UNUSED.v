// © IBM Corp. 2022
// Licensed under the Apache License, Version 2.0 (the "License"), as modified by
// the terms below; you may not use the files in this repository except in
// compliance with the License as modified.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
//
// Modified Terms:
//
//    1) For the purpose of the patent license granted to you in Section 3 of the
//    License, the "Work" hereby includes implementations of the work of authorship
//    in physical form.
//
//    2) Notwithstanding any terms to the contrary in the License, any licenses
//    necessary for implementation of the Work that are available from OpenPOWER
//    via the Power ISA End User License Agreement (EULA) are explicitly excluded
//    hereunder, and may be obtained from OpenPOWER under the terms and conditions
//    of the EULA.
//
// Unless required by applicable law or agreed to in writing, the reference design
// distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License
// for the specific language governing permissions and limitations under the License.
//
// Additional rights, including the ability to physically implement a softcore that
// is compliant with the required sections of the Power ISA Specification, are
// available at no cost under the terms of the OpenPOWER Power ISA EULA, which can be
// obtained (along with the Power ISA) here: https://openpowerfoundation.org.

`timescale 1 ns / 1 ns

// *!****************************************************************
// *! FILENAME    : tri_lcbs.v
// *! DESCRIPTION : Wrapper for slat LCB
// *!****************************************************************

`include "tri_a2o.vh"

module tri_lcbs (
   vd,
   gd,
   delay_lclkr,
   clk,
   rst,
   force_t,
   thold_b,
   dclk,
   lclk
);
   inout      vd;
   inout      gd;
   input      delay_lclkr;
   input      clk;
   input      rst;
   input      force_t;
   input      thold_b;
   output     dclk;
   output[0:`NCLK_WIDTH-1]  lclk;

   //  tri_lcbs

   (* analysis_not_referenced="true" *)
   wire       unused;

   assign unused = vd | gd | delay_lclkr | force_t;

   // No scan chain in this methodology
   assign dclk = thold_b;
   assign lclk = {clk, rst, {`NCLK_WIDTH-2{1'b0}}};
endmodule
