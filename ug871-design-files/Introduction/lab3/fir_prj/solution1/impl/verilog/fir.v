// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="fir,hls_ip_2018_3,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7k160tfbg484-2,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.152000,HLS_SYN_LAT=34,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=3,HLS_SYN_FF=175,HLS_SYN_LUT=183,HLS_VERSION=2018_3}" *)

module fir (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        y,
        y_ap_vld,
        c_address0,
        c_ce0,
        c_q0,
        x
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [31:0] y;
output   y_ap_vld;
output  [3:0] c_address0;
output   c_ce0;
input  [31:0] c_q0;
input  [31:0] x;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg y_ap_vld;
reg c_ce0;

(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [3:0] shift_reg_address0;
reg    shift_reg_ce0;
reg    shift_reg_we0;
reg   [31:0] shift_reg_d0;
wire   [31:0] shift_reg_q0;
wire  signed [31:0] i_cast_fu_132_p1;
reg  signed [31:0] i_cast_reg_181;
wire    ap_CS_fsm_state2;
wire   [0:0] tmp_1_fu_144_p2;
reg   [0:0] tmp_1_reg_190;
wire   [0:0] tmp_fu_136_p3;
wire    ap_CS_fsm_state3;
wire   [4:0] grp_fu_125_p2;
reg   [4:0] i_1_reg_209;
wire   [31:0] acc_1_fu_169_p2;
wire    ap_CS_fsm_state4;
reg   [31:0] acc_reg_91;
wire  signed [4:0] ap_phi_mux_i_phi_fu_108_p4;
reg  signed [4:0] i_reg_104;
reg  signed [31:0] data1_reg_116;
wire   [63:0] tmp_3_fu_150_p1;
wire   [63:0] tmp_4_fu_155_p1;
wire   [63:0] tmp_5_fu_159_p1;
reg  signed [4:0] grp_fu_125_p0;
wire  signed [31:0] tmp_6_fu_163_p0;
wire   [31:0] tmp_6_fu_163_p2;
reg   [3:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 4'd1;
end

fir_shift_reg #(
    .DataWidth( 32 ),
    .AddressRange( 11 ),
    .AddressWidth( 4 ))
shift_reg_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(shift_reg_address0),
    .ce0(shift_reg_ce0),
    .we0(shift_reg_we0),
    .d0(shift_reg_d0),
    .q0(shift_reg_q0)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        acc_reg_91 <= acc_1_fu_169_p2;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        acc_reg_91 <= 32'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_1_reg_190 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        data1_reg_116 <= shift_reg_q0;
    end else if (((tmp_fu_136_p3 == 1'd0) & (tmp_1_fu_144_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        data1_reg_116 <= x;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        i_reg_104 <= i_1_reg_209;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_reg_104 <= 5'd10;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        i_1_reg_209 <= grp_fu_125_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        i_cast_reg_181 <= i_cast_fu_132_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_fu_136_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        tmp_1_reg_190 <= tmp_1_fu_144_p2;
    end
end

always @ (*) begin
    if (((tmp_fu_136_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_fu_136_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        c_ce0 = 1'b1;
    end else begin
        c_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        grp_fu_125_p0 = i_reg_104;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        grp_fu_125_p0 = ap_phi_mux_i_phi_fu_108_p4;
    end else begin
        grp_fu_125_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        shift_reg_address0 = tmp_4_fu_155_p1;
    end else if (((tmp_fu_136_p3 == 1'd0) & (tmp_1_fu_144_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        shift_reg_address0 = 4'd0;
    end else if (((tmp_fu_136_p3 == 1'd0) & (tmp_1_fu_144_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        shift_reg_address0 = tmp_3_fu_150_p1;
    end else begin
        shift_reg_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | ((tmp_fu_136_p3 == 1'd0) & (tmp_1_fu_144_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) | ((tmp_fu_136_p3 == 1'd0) & (tmp_1_fu_144_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)))) begin
        shift_reg_ce0 = 1'b1;
    end else begin
        shift_reg_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        shift_reg_d0 = shift_reg_q0;
    end else if (((tmp_fu_136_p3 == 1'd0) & (tmp_1_fu_144_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        shift_reg_d0 = x;
    end else begin
        shift_reg_d0 = 'bx;
    end
end

always @ (*) begin
    if ((((tmp_1_reg_190 == 1'd0) & (1'b1 == ap_CS_fsm_state3)) | ((tmp_fu_136_p3 == 1'd0) & (tmp_1_fu_144_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)))) begin
        shift_reg_we0 = 1'b1;
    end else begin
        shift_reg_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_fu_136_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        y_ap_vld = 1'b1;
    end else begin
        y_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((tmp_fu_136_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign acc_1_fu_169_p2 = (tmp_6_fu_163_p2 + acc_reg_91);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_phi_mux_i_phi_fu_108_p4 = i_reg_104;

assign c_address0 = tmp_5_fu_159_p1;

assign grp_fu_125_p2 = ($signed(grp_fu_125_p0) + $signed(5'd31));

assign i_cast_fu_132_p1 = i_reg_104;

assign tmp_1_fu_144_p2 = ((i_reg_104 == 5'd0) ? 1'b1 : 1'b0);

assign tmp_3_fu_150_p1 = grp_fu_125_p2;

assign tmp_4_fu_155_p1 = $unsigned(i_cast_reg_181);

assign tmp_5_fu_159_p1 = $unsigned(i_cast_reg_181);

assign tmp_6_fu_163_p0 = c_q0;

assign tmp_6_fu_163_p2 = ($signed(tmp_6_fu_163_p0) * $signed(data1_reg_116));

assign tmp_fu_136_p3 = i_reg_104[32'd4];

assign y = acc_reg_91;

endmodule //fir
