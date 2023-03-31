#include <stdlib.h>
#include <stdio.h>
#include <time.h>



int main(int argc,char ** argv){
  int N=520000,a=1000;
  struct timespec cgt1, cgt2; double ncgt;
  double y[N];
  double x[N];
  for(int i=0; i<N;i++){
	y[i]=i+1;
	x[i]=i+2;
}
    clock_gettime(CLOCK_REALTIME,&cgt1);

for (int i=0;i<N;i++) y[i]= a*x[i] + y[i];

  clock_gettime(CLOCK_REALTIME,&cgt2);

  ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec) + (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

  printf("\nTamano:%d \nTiempo(seg.):%11.9f\n  y[0]=%f / / y[%d]=%f \n", N,ncgt,y[0],N,y[N-1]);

  return 0;
}
