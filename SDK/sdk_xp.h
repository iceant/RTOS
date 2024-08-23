#ifndef INCLUDED_SDK_XP_H
#define INCLUDED_SDK_XP_H

////////////////////////////////////////////////////////////////////////////////
////

typedef unsigned char * sdk_xp_t;

////////////////////////////////////////////////////////////////////////////////
////
/* z = x + y + carry */
int sdk_xp_add(int n, sdk_xp_t z, sdk_xp_t x, sdk_xp_t y, int carry);
/* z = x - y - borrow */
int sdk_xp_sub(int n, sdk_xp_t z, sdk_xp_t x, sdk_xp_t y, int borrow);
/* z = z + x * y */
int sdk_xp_mul(sdk_xp_t z, int n, sdk_xp_t x, int m, sdk_xp_t y);
/* q = x/y, r = x mod y, q and x have n digits, r and y have m digits
 * if y is 0, return 0 and leave q and r unchanged;
 * otherwise return 1
 */
int sdk_xp_div(int n, sdk_xp_t q, sdk_xp_t x, int m, sdk_xp_t y, sdk_xp_t r,sdk_xp_t tmp);
/*
 * set z[0..n-1] to x+y and return the carry-out of the most significant digit.
 */
int sdk_xp_sum     (int n, sdk_xp_t z, sdk_xp_t x, int y);
/*
 * set z[0..n-1] to x-y and returns the borrow-out of the most significant digit.
 */
int sdk_xp_diff    (int n, sdk_xp_t z, sdk_xp_t x, int y);
/*
 * set z[0..n-1] to x*y and returns the carry-out of the most significant digit.
 * the carry can be as large as 2^8 -1
 */
int sdk_xp_product (int n, sdk_xp_t z, sdk_xp_t x, int y);
/*
 * set z[0..n-1] to x/y and returns the remainder, x mod y
 * the remainder can be as large as y-1
 * y must not exceed 2^8 -1
 */
int sdk_xp_quotient(int n, sdk_xp_t z, sdk_xp_t x, int y);
/*
 * set z[0..n-1] to ~x+carry and return the carry-out of the most significant digit
 */
int sdk_xp_neg(int n, sdk_xp_t z, sdk_xp_t x, int carry);

int sdk_xp_cmp(int n, sdk_xp_t x, sdk_xp_t y);

void sdk_xp_lshift(int n, sdk_xp_t z, int m, sdk_xp_t x, int s, int fill);

void sdk_xp_rshift(int n, sdk_xp_t z, int m, sdk_xp_t x, int s, int fill);

int sdk_xp_length (int n, sdk_xp_t x);

unsigned long sdk_xp_fromint(int n, sdk_xp_t z, unsigned long u);

unsigned long sdk_xp_toint  (int n, sdk_xp_t x);

int   sdk_xp_fromstr(int n, sdk_xp_t z, const char *str, int base, char **end);

char *sdk_xp_tostr  (char *str, int size, int base, int n, sdk_xp_t x);

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
 * 32bit 整数取值范围: [-2147483648, +2147483647] 或者无符号整数 [0, 4294967295]
 * ndigit 无符号整数 x 用多项式表示: x = x[n-1]*b^(n-1) + x[n-2]b^(n-2)+...+x[1]b^1+x[0]
 * 在32bit CPU中，n=32, b=2; 每个 x[i] 由32个Bit中的一个表示
 *
 * 如果 b=10那么每个 b 都是一个 0..9之间的数字，并且 x 用一个数组表示:
 * 例如 2147483647
 * unsigned char x[] = {7, 4, 6, 3, 8, 4, 7, 4, 1, 2};
 *
 * 选择一个较大的基数可以节省内存，因为基数越大，数字就越大。
 * 例如，如果b是= 65,536，每个数字是0和65,535之间的数字，只需要2位（4个字节）就可以表示2147,483,647：
 * unsigned short x[] = { 65535,32767 };
 *
 *
 */

#endif /* INCLUDED_SDK_XP_H */
