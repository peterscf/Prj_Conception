//test Cordic

#include <stdio.h>
#include <math.h>


#define N 6
#define B 7
#define TAILLE_MAX 8

#define PI 3.14159265
 
//void cellule(int* x, int* y, int* z, int tani, int i);

int main(void){
 
int x,y,z,i,teta;
double rad,a_x,a_y;
int tan0[] ={45,26,14,7,3,1};
FILE* file_x;
FILE* file_y;
 
	file_x=fopen("simu_in_x.dat","w+");
	file_y=fopen("simu_in_y.dat","w+");
if (file_x !=NULL && file_y !=NULL){
i=0;
  for (teta = -180; teta< 180; teta++){
	z=0;
	rad = teta*PI/180;	
 	a_x = cos (rad);
	a_y = sin (rad);
	x= (int)(a_x*(0x1<<B));
 	y= (int)(a_y*(0x1<<B));
	
// ecriture dans fichier en formats 8bits signé 
		fprintf(file_x,"%.2X\n",x);
		fprintf(file_y,"%.2X\n",y);
	i++;
	}
}
else {
	if(file_x==NULL)printf("erreur impossible de cree simu_in_x.dat\n");
       	else if(file_y==NULL)printf("erreur impossible de cree simu_in_y.dat\n");
	}


}//fin programme

