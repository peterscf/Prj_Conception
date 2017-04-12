
//compute data de matlab comme un Cordic !! et sortie dans un fichier;

#include <stdio.h>
#include <math.h>


#define N 6
//#define B 6

#define PI 3.14159265
 
void cellule(int* x, int* y, int* z, int tani, int i);

int main(void){
 
int x,y,z,i,teta,res, nb_tst, err, err_1, b;
double rad,a_x,a_y;
int tan0[] ={45,26,14,7,3,1};

for (b=4;b<16;b++){
//init des variables
res=0;
err=0;
err_1=0;
nb_tst=0;
  
  for (teta = -90; teta< 90; teta +=2){
	z=0;
	rad = teta*PI/180;	
 	a_x = cos (rad);
	a_y = sin (rad);
	x= (int)(a_x*(0x1<<b));
 	y= (int)(a_y*(0x1<<b));
	
	//printf("lancement du test N=%d\n",N);
	for (i=0;i<N;i++){
		cellule(&x,&y,&z,tan0[i],i);
	}
	//printf("\nvaleur a_x=%lf\ta_y=%lf \n",a_x,a_y);
	//printf("\nvaleur x=%d\ty=%d \n",x,y);
	printf("valeur de sortie z: %d teta=%d \n",z,teta);
	if (teta == z){
		res++;
	}
	else if((teta+1) == z || (teta-1)==z){
		err_1++;
	}
	else{
		err++;
	}
	nb_tst++;
  }
/*	printf("/////////////////////////////////////////////////////////////////////\n");
	printf("resultat pour N= %d, B=%d:\n",N,b);
	printf("nb tests: %d\n",nb_tst);
	printf("nb_juste: %d\n",res);
	printf("nb erreur +- 1°: %d\n",err_1);
	printf("nb erreur: %d\n",err);
	printf("erreur: %d %\n\n",(((err+err_1)*100)/nb_tst));*/
}
}

void cellule(int* x, int* y, int* z, int tani, int i){

	int xk=*x;
	int yk=*y;
	int zk=*z;
	
	//printf("Entree:\nxk=%d \nyk=%d \n zk=%d\n" ,xk,yk, zk);
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
	//printf("Sortie:\nx=%d \ny=%d \n z=%d\n" ,*x,*y, *z);

}
