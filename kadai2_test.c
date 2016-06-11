#include <stdio.h>
#include <stdlib.h>

#define RANGE_MIN -3
#define RANGE_MAX 3


// a > b の引数2つの最大公約数を返す関数
// error -> 0
int calc( int a, int b) {

	int mod;

	// 負の値
	if (a <= 0 || b <= 0) return -1;

	mod = a % b;
	while( mod != 0 ) {
		a = b;
		b = mod;
		mod = a % b;
	}
	return b;
}

int main() {

	int i, j, rtn, rtn_int, rtn2;
	char exec_kadai2[30+1], res_kadai2[20+1];
	FILE *fp;

	for (i = RANGE_MIN; i < RANGE_MAX + 1; i++) {
		for (j = RANGE_MIN; j < RANGE_MAX + 1; j++) {
			sprintf(exec_kadai2,"./kadai2.sh %d %d", i, j);
			rtn = system(exec_kadai2);
			if (rtn != 0) {
				rtn = -1;
			} else {
				if ((fp = fopen("kadai2_result", "r")) == NULL) {
				printf("file open error\n");
				exit -1;
				}
				fgets(res_kadai2, 20, fp);
				rtn = atoi(res_kadai2);
				fclose(fp);
			}
			if ( i > j ) rtn2 = calc(i, j);
			else rtn2 = calc(j, i);

			if (rtn != rtn2) { 
				/* エラー */
				return -1;
				//printf("error:%s\n", exec_kadai2);
			}
		}
	}
	return 0;
}
