# ==============================================================
# File generated on Wed Mar 10 10:57:29 +0700 2021
# Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
# SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
# IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# ==============================================================
add_files -tb ../../fir_test.c -cflags { -Wno-unknown-pragmas}
add_files -tb ../../out.gold.dat -cflags { -Wno-unknown-pragmas}
add_files fir.c
set_part xc7k160tfbg484-2
create_clock -name default -period 10
