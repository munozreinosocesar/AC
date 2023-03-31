#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num() 0
#endif

int main(int argc, char ** argv){
  int i,n=200, chunk;
  int a[n], suma=0;
  omp_sched_t kind;
  if(argc<3){
    fprintf(stderr,"\nFalta chunk\n");
    exit(-1);
  }
  n = atoi(argv[1]);
  if(n>200) n=200;
  chunk = atoi(argv[2]);

  for(i=0;i<n;i++){
    a[i]=i;
  }

  #pragma omp parallel
  {
  #pragma omp for firstprivate(suma) \
          lastprivate(suma) schedule(dynamic,chunk)
    for(i=0;i<n;i++){
      suma += a[i];
      printf("thread %d suma a[%d] suma=%d\n", omp_get_thread_num(),i,suma);

    }
    #pragma omp single
    {
      printf("ANTES DE LA MODIFICACIÓN");
      omp_get_schedule(&kind, &chunk);
      printf("\nLa variable dyn-var:%d\n La variable nthreads-var:%d\n La variable thread-limit-var:%d\n La variable run-sched-var:%d \n\n",omp_get_dynamic(),omp_get_max_threads(),omp_get_thread_limit(),kind);
      omp_set_dynamic(9);
      omp_set_num_threads(15);
      omp_set_schedule(3, 3);
      printf("DESPUÉS DE LA MODIFICACIÓN");
      omp_get_schedule(&kind, &chunk);
      printf("\nLa variable dyn-var:%d\n La variable nthreads-var:%d\n La variable thread-limit-var:%d\n La variable run-sched-var:%d \n\n",omp_get_dynamic(),omp_get_max_threads(),omp_get_thread_limit(),kind);
    }
  }
}
