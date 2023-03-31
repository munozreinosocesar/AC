#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#define N 512
int matrix1[N][N],matrix2[N][N],salida[N][N];

int main(int argc, char** argv){
	int suma=0;
	struct timespec cgt1, cgt2; double ncgt;

	//INICIALIZAMOS MATRIZ Y VECTOR
	for(int i = 0;i < N;i++){
		for(int j = 0;j < N;j++){
				matrix1[i][j]=i+j;
				matrix2[i][j]=i+j;
		}
	}

	clock_gettime(CLOCK_REALTIME,&cgt1);

	//TRASPUESTA
	for(int i=0;i<N;i++){
		for(int j=0;j<N;j++){
			int aux=matrix2[i][j];
				matrix2[i][j]=matrix2[j][i];
				matrix2[j][i]=aux;
		}
	}

	//MULTIPLICACIÓN
	for(int i = 0; i < N; i++){
		for(int j = 0; j < N; j++){
			for(int z = 0; z < N; z++){
				salida[i][j] += matrix1[i][z]*matrix2[j][z];
			}
		}
	}

	clock_gettime(CLOCK_REALTIME,&cgt2);

	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec) + (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

	printf("\nTiempo(seg.):%11.9f\n  Tamaño:%u\n salida[0][0]=%d / / salida[%d][%d]=%d \n", ncgt,N,salida[0][0],N-1,N-1,salida[N-1][N-1]);

	return 0;
}
