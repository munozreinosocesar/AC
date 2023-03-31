#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <omp.h>

int main(int argc, char** argv){
	int suma=0;
	struct timespec cgt1, cgt2; double ncgt;
	int **matrix1=NULL, **matrix2 = NULL, **salida = NULL;

	if (argc<2){
		printf("Faltan nª componentes del vector\n");
		exit(-1);
	}

	unsigned int N = atoi(argv[1]);

	matrix1 = (int**) malloc(N*sizeof(int*));
	matrix2 = (int**) malloc(N*sizeof(int*));
	salida = (int**) malloc(N*sizeof(int*));

	if((matrix1 == NULL) || (matrix2 == NULL) || (salida == NULL)){
		printf("Error en la reserva de espacio para los vectores\n");
		exit(-2);
	}

	// RESERVAMOS MEMORIA PARA LA MATRIZ
	for (int i = 0;i < N;i++){
		matrix1[i] = (int*)malloc(N*sizeof(int));
		matrix2[i] = (int*)malloc(N*sizeof(int));
		salida[i] = (int*)malloc(N*sizeof(int));
		if(matrix1[i] == NULL) perror("Error: ");
		if(matrix2[i] == NULL) perror("Error: ");
		if(salida[i] == NULL) perror("Error: ");
	}

	//INICIALIZAMOS MATRIZ Y VECTOR
	#pragma omp parallel for
	for(int i = 0;i < N;i++){
		for(int j = 0;j < N;j++){
				matrix1[i][j]=i+j;
				matrix2[i][j]=i+j;
		}
	}

	clock_gettime(CLOCK_REALTIME,&cgt1);

	//MULTIPLICACIÓN
	#pragma omp parallel for reduction(+:suma)
	for(int i = 0; i< N; i++){
		for(int j = 0; j< N; j++){
			for(int z=0; z<N; z++){
				salida[i][j] += matrix1[i][z]*matrix2[z][i];
			}
		}
	}
	clock_gettime(CLOCK_REALTIME,&cgt2);
/*
	//SALIDA
	printf("Matriz resultante: ");
	printf("\n");
	for(int i = 0;i < N;i++){
		for(int j=0;j<N;j++){
			printf("%d ",salida[i][j]);
		}
		printf("\n");
	}
*/
	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec) + (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

	printf("\n%11.9f\n",ncgt);

	for (int i = 0; i < N; i++){
    		free(matrix1[i]);
				free(matrix2[i]);
				free(salida[i]);
	}
	free(matrix1);
	free(matrix2);
	free(salida);
	return 0;
}
