// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="hamming_window,hls_ip_2018_3,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7k160tfbg484-1,HLS_INPUT_CLOCK=5.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.490000,HLS_SYN_LAT=262,HLS_SYN_TPT=none,HLS_SYN_MEM=1,HLS_SYN_DSP=1,HLS_SYN_FF=216,HLS_SYN_LUT=153,HLS_VERSION=2018_3}" *)

module hamming_window (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        outdata_address0,
        outdata_ce0,
        outdata_we0,
        outdata_d0,
        indata_address0,
        indata_ce0,
        indata_q0
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state8 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [7:0] outdata_address0;
output   outdata_ce0;
output   outdata_we0;
output  [31:0] outdata_d0;
output  [7:0] indata_address0;
output   indata_ce0;
input  [15:0] indata_q0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg outdata_ce0;
reg outdata_we0;
reg indata_ce0;

(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [7:0] window_coeff_address0;
reg    window_coeff_ce0;
wire   [13:0] window_coeff_q0;
reg   [8:0] i_reg_79;
wire   [0:0] tmp_fu_90_p2;
reg   [0:0] tmp_reg_124;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_state6_pp0_stage0_iter4;
wire    ap_block_state7_pp0_stage0_iter5;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] tmp_reg_124_pp0_iter1_reg;
reg   [0:0] tmp_reg_124_pp0_iter2_reg;
reg   [0:0] tmp_reg_124_pp0_iter3_reg;
reg   [0:0] tmp_reg_124_pp0_iter4_reg;
wire   [8:0] i_1_fu_96_p2;
reg    ap_enable_reg_pp0_iter0;
wire   [63:0] tmp_1_fu_102_p1;
reg   [63:0] tmp_1_reg_133;
reg   [63:0] tmp_1_reg_133_pp0_iter1_reg;
reg   [63:0] tmp_1_reg_133_pp0_iter2_reg;
reg   [63:0] tmp_1_reg_133_pp0_iter3_reg;
reg   [63:0] tmp_1_reg_133_pp0_iter4_reg;
reg   [13:0] window_coeff_load_reg_148;
reg  signed [15:0] indata_load_reg_153;
wire  signed [29:0] grp_fu_118_p2;
reg  signed [29:0] tmp_4_reg_168;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
wire    ap_block_pp0_stage0;
wire   [13:0] grp_fu_118_p0;
wire    ap_CS_fsm_state8;
reg   [2:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire   [29:0] grp_fu_118_p00;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
end

hamming_window_wibkb #(
    .DataWidth( 14 ),
    .AddressRange( 256 ),
    .AddressWidth( 8 ))
window_coeff_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(window_coeff_address0),
    .ce0(window_coeff_ce0),
    .q0(window_coeff_q0)
);

hamming_window_mucud #(
    .ID( 1 ),
    .NUM_STAGE( 3 ),
    .din0_WIDTH( 14 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 30 ))
hamming_window_mucud_U1(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_118_p0),
    .din1(indata_load_reg_153),
    .ce(1'b1),
    .dout(grp_fu_118_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state2) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state2)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter5 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_fu_90_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_reg_79 <= i_1_fu_96_p2;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_reg_79 <= 9'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_reg_124 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indata_load_reg_153 <= indata_q0;
        window_coeff_load_reg_148 <= window_coeff_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_fu_90_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_1_reg_133[8 : 0] <= tmp_1_fu_102_p1[8 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_1_reg_133_pp0_iter1_reg[8 : 0] <= tmp_1_reg_133[8 : 0];
        tmp_reg_124 <= tmp_fu_90_p2;
        tmp_reg_124_pp0_iter1_reg <= tmp_reg_124;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        tmp_1_reg_133_pp0_iter2_reg[8 : 0] <= tmp_1_reg_133_pp0_iter1_reg[8 : 0];
        tmp_1_reg_133_pp0_iter3_reg[8 : 0] <= tmp_1_reg_133_pp0_iter2_reg[8 : 0];
        tmp_1_reg_133_pp0_iter4_reg[8 : 0] <= tmp_1_reg_133_pp0_iter3_reg[8 : 0];
        tmp_reg_124_pp0_iter2_reg <= tmp_reg_124_pp0_iter1_reg;
        tmp_reg_124_pp0_iter3_reg <= tmp_reg_124_pp0_iter2_reg;
        tmp_reg_124_pp0_iter4_reg <= tmp_reg_124_pp0_iter3_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_reg_124_pp0_iter3_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_4_reg_168 <= grp_fu_118_p2;
    end
end

always @ (*) begin
    if ((tmp_fu_90_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indata_ce0 = 1'b1;
    end else begin
        indata_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
        outdata_ce0 = 1'b1;
    end else begin
        outdata_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_reg_124_pp0_iter4_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
        outdata_we0 = 1'b1;
    end else begin
        outdata_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        window_coeff_ce0 = 1'b1;
    end else begin
        window_coeff_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((tmp_fu_90_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)) & ~((ap_enable_reg_pp0_iter5 == 1'b1) & (ap_enable_reg_pp0_iter4 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((tmp_fu_90_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((ap_enable_reg_pp0_iter5 == 1'b1) & (ap_enable_reg_pp0_iter4 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign grp_fu_118_p0 = grp_fu_118_p00;

assign grp_fu_118_p00 = window_coeff_load_reg_148;

assign i_1_fu_96_p2 = (i_reg_79 + 9'd1);

assign indata_address0 = tmp_1_fu_102_p1;

assign outdata_address0 = tmp_1_reg_133_pp0_iter4_reg;

assign outdata_d0 = $signed(tmp_4_reg_168);

assign tmp_1_fu_102_p1 = i_reg_79;

assign tmp_fu_90_p2 = ((i_reg_79 == 9'd256) ? 1'b1 : 1'b0);

assign window_coeff_address0 = tmp_1_fu_102_p1;

always @ (posedge ap_clk) begin
    tmp_1_reg_133[63:9] <= 55'b0000000000000000000000000000000000000000000000000000000;
    tmp_1_reg_133_pp0_iter1_reg[63:9] <= 55'b0000000000000000000000000000000000000000000000000000000;
    tmp_1_reg_133_pp0_iter2_reg[63:9] <= 55'b0000000000000000000000000000000000000000000000000000000;
    tmp_1_reg_133_pp0_iter3_reg[63:9] <= 55'b0000000000000000000000000000000000000000000000000000000;
    tmp_1_reg_133_pp0_iter4_reg[63:9] <= 55'b0000000000000000000000000000000000000000000000000000000;
end

endmodule //hamming_window
