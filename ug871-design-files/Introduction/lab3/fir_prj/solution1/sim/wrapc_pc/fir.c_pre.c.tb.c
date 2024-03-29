// ==============================================================
// File generated on Wed Mar 10 10:57:31 +0700 2021
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#1 "E:/CMC/HLS2018/ug871-design-files/Introduction/lab3/fir.c"
#1 "E:/CMC/HLS2018/ug871-design-files/Introduction/lab3/fir.c" 1
#1 "<built-in>" 1
#1 "<built-in>" 3
#147 "<built-in>" 3
#1 "<command line>" 1
#1 "<built-in>" 2
#1 "E:/CMC/HLS2018/ug871-design-files/Introduction/lab3/fir.c" 2
#46 "E:/CMC/HLS2018/ug871-design-files/Introduction/lab3/fir.c"
#1 "E:/CMC/HLS2018/ug871-design-files/Introduction/lab3/fir.h" 1
#50 "E:/CMC/HLS2018/ug871-design-files/Introduction/lab3/fir.h"
typedef int coef_t;
typedef int data_t;
typedef int acc_t;

void fir (
  data_t *y,
  coef_t c[11 +1],
  data_t x
  );
#47 "E:/CMC/HLS2018/ug871-design-files/Introduction/lab3/fir.c" 2

void fir (
  data_t *y,
  coef_t c[11],
  data_t x
  ) {




  static data_t shift_reg[11];
  acc_t acc;
  data_t data;
  int i;

  acc=0;
  Shift_Accum_Loop: for (i=11 -1;i>=0;i--) {
 if (i==0) {
   shift_reg[0]=x;
   data = x;
    } else {
   shift_reg[i]=shift_reg[i-1];
   data = shift_reg[i];
    }
    acc+=data*c[i];;
  }
  *y=acc;
}
