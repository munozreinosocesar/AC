#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <omp.h>

int main(int argc, char** argv){
	int suma=0,chunk;
	struct timespec cgt1, cgt2; double ncgt;
	int **matrix=NULL, *vector = NULL, *salida = NULL;

	if (argc<2){
		printf("Primer arg -> N\n");
		exit(-1);
	}

	unsigned int N = atoi(argv[1]);

	vector = (int*) malloc(N*sizeof(int));
	matrix = (int**) malloc(N*sizeof(int*));
	salida = (int*) malloc(N*sizeof(int));

	if((vector == NULL) || (matrix == NULL) || (salida == NULL)){
		printf("Error en la reserva de espacio para los vectores\n");
		exit(-2);
	}

	// RESERVAMOS MEMORIA PARA LA MATRIZ
	#pragma omp parallel for
	for (int i = 0;i < N;i++){
		matrix[i] = (int*)malloc(N*sizeof(int));
		if(matrix[i] == NULL) perror("Error: ");
	}

	//INICIALIZAMOS MATRIZ Y VECTOR
	for(int i = 0;i < N;i++){
		for(int j = 0;j <= i;j++){
				matrix[i][j]=i+j+3;
		}
	}

	for(int i = 0;i < N;i++){
		vector[i] = i;
	}



	clock_gettime(CLOCK_REALTIME,&cgt1);

	//MULTIPLICACIÓN
	#pragma omp parallel for schedule(runtime) reduction(+:suma)
	for(int i = 0; i< N; i++){
		for(int j = 0; j< N; j++){
			suma += matrix[i][j]*vector[j];
		}
		salida[i] = suma;
		suma = 0;
	}
	clock_gettime(CLOCK_REALTIME,&cgt2);


	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec) + (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

	printf("Tiempo(seg.):%11.9f\n  Tamaño:%u\n salida[0]=%d / / salida[%d]=%d \n", ncgt,N,salida[0],N-1,salida[N-1]);

	for (int i = 0; i < N; i++){
    		free(matrix[i]);
	}
	free(matrix);
	free(vector);
	free(salida);
	return 0;
}
