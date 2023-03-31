#include <stdlib.h>
#include <stdio.h>
#include <time.h>


struct{
  int a;
  int b;
}   s[5000];

int R[40000];

int main(int argc,char ** argv){
  int ii,i,X1,X2;
  struct timespec cgt1, cgt2; double ncgt;

  for(int i=0;i<5000;i++){
    s[i].a=i;
    s[i].b=i+1;
  }
  
  clock_gettime(CLOCK_REALTIME,&cgt1);

  for(ii=0;ii<40000;ii++){
    X1=0;X2=0;
    for(i=0;i<5000;i++) X1+=2*s[i].a+ii;
    for(i=0;i<5000;i++) X2+=3*s[i].b-ii;

    if(X1<X2) R[ii]=X1; else R[ii]=X2;
  }

  clock_gettime(CLOCK_REALTIME,&cgt2);

  ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec) + (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

  printf("\nTiempo(seg.):%11.9f\n  R[0]=%d / / R[39999]=%d \n", ncgt,R[0],R[39999]);

  return 0;
}
