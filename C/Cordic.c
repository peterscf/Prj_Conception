//test Cordic

#include<stdio.h>
#include<math.h>

#define N 6
#define B 6

void cellule(int* x, int* y, int* z, int tani, int i);

int main(void){

int x,y,z,i;
int tan0[] ={45,26,14,7,3,1};
 z=0;
 x=(int)(0.5*(0x1<<B));
 y=(int)(-0.86*(0x1<<B));
	
	printf("lancement du test N=%d\n",N);
	for (i=0;i<N;i++){
		cellule(&x,&y,&z,tan0[i],i);
	}
	//printf("valeur de sortie z: Ox%x \n",z);
	printf("valeur de sortie z: %d \n",z);

}

void cellule(int* x, int* y, int* z, int tani, int i){

	int xk=*x;
	int yk=*y;
	int zk=*z;
	
	printf("Entree:\nxk=%d \nyk=%d \n zk=%d\n" ,xk,yk, zk);
	if (yk > 0){
		*x=xk+(yk>>i);
		*y=yk-(xk>>i);
		*z=zk+tani;
	}
	else if (yk < 0){
		*x=xk-(yk>>i);
		*y=yk+(xk>>i);
		*z=zk-tani;
	}
	printf("Sortie:\nx=%d \ny=%d \n z=%d\n" ,*x,*y, *z);

}
