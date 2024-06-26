#pragma line 1 "E:/CMC/HLS2018/ug871-design-files/Introduction/lab3/fir.c"
#pragma line 1 "E:/CMC/HLS2018/ug871-design-files/Introduction/lab3/fir.c" 1
#pragma line 1 "<built-in>" 1
#pragma line 1 "<built-in>" 3
#pragma line 147 "<built-in>" 3
#pragma line 1 "<command line>" 1
#pragma line 1 "<built-in>" 2
#pragma line 1 "E:/CMC/HLS2018/ug871-design-files/Introduction/lab3/fir.c" 2
#pragma line 46 "E:/CMC/HLS2018/ug871-design-files/Introduction/lab3/fir.c"
#pragma line 1 "E:/CMC/HLS2018/ug871-design-files/Introduction/lab3/fir.h" 1
#pragma line 50 "E:/CMC/HLS2018/ug871-design-files/Introduction/lab3/fir.h"
typedef int coef_t;
typedef int data_t;
typedef int acc_t;
#pragma empty_line
void fir (
  data_t *y,
  coef_t c[11 +1],
  data_t x
  );
#pragma line 47 "E:/CMC/HLS2018/ug871-design-files/Introduction/lab3/fir.c" 2
#pragma empty_line
void fir (
  data_t *y,
  coef_t c[11],
  data_t x
  ) {
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
  static data_t shift_reg[11];
  acc_t acc;
  data_t data;
  int i;
#pragma empty_line
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
