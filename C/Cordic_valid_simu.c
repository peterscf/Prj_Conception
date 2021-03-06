//version 11/05/2017
//compute data de matlab comme un Cordic !! et sortie dans un fichier;
//compile "gcc -g <fichier.c> -o <exe> -lm"
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>


#define TAILLE_MAX 50
#define TAILLE_MAX_FILE 11000
#define N 6
#define B 7

#define PI 3.14159265
 
void cellule(int* x, int* y, int* z, int tani, int i);

int main(void){
 
int x,y,z,i,j,k,teta,res, nb_tst, err, err_1, b,end;
double rad,a_x,a_y;
int tan0[] ={45,26,14,7,3,1};
char str [TAILLE_MAX], file_name[TAILLE_MAX],write_str[TAILLE_MAX]; 
char time[TAILLE_MAX_FILE][10];
double I[TAILLE_MAX_FILE];
double Q[TAILLE_MAX_FILE];

char* errCheck;

FILE* fichier_I=NULL;
FILE* fichier_Q=NULL;

FILE* file_x=NULL;
FILE* file_y=NULL;

FILE* out_file=NULL;




fichier_I=fopen("./../Matlab/Iout.txt","r");
fichier_Q=fopen("./../Matlab/Qout.txt","r");

if (fichier_I != NULL && fichier_Q !=NULL){
    //recuperation des donne des fichiers
    i=0;
    while(fgets(str, TAILLE_MAX, fichier_I)!=NULL){
        char* p_virg=strchr(str,',');
        I[i]= strtold((p_virg+1),&errCheck);
        if (errCheck == p_virg+1){
            printf("Converssion Error:%s\ni=%d\n",p_virg+1,i);
        }
        //printf("conversion p_vir= %sI[%d]=%lf\n\n",p_virg+1,i,I[i]);
        i++;
    }
    fclose(fichier_I);
    i=0;
    while(fgets(str, TAILLE_MAX, fichier_Q)!=NULL){
        char* p_virg=strchr(str,',');
        Q[i]= strtold((p_virg+1),&errCheck);
        *p_virg='\0';
        //récuperation de la chaine de caract
         strcpy(time[i],str) ;
        if (errCheck == p_virg+1){
            printf("Converssion Error:%s\ni=%d\n",p_virg+1,i);
        } 
        //printf("conversion p_vir= %s Q[%d]=%lf\n\n",p_virg+1,i,Q[i]);
        i++;
    }
    fclose(fichier_Q);
    end=i;
    printf("fin fichier I et Q debut cordic\n");
    printf("lancement de la generation des fichiers de verif \n");
    out_file=fopen("./simu_file/Z_out_C.txt","w+");
   file_x=fopen("./simu_file/x_simu.dat","w+");
   file_y=fopen("./simu_file/y_simu.dat","w+"); 
   if(out_file == NULL){
            printf("erreur impossible de cree %s \n",file_name);
        }
        else{
            for (j=0;j<end;j++){
                z=0;
                a_x = I[j];
                a_y = Q[j];
                x= (int)(a_x*(0x1<<B));
                y= (int)(a_y*(0x1<<B));
                fprintf(file_x,"%.2X\n",x);
		fprintf(file_y,"%.2X\n",y);
		if (x < 0){
			x=-x;
			y=-y;
			if (y<0)z=180; //y deja inverser
			else z= -180;			
		}
		for (i=0;i<N;i++){
                    cellule(&x,&y,&z,tan0[i],i);
                }
                fprintf(out_file,"%d\n",z);
            }
            fclose(out_file);
        }
}//fin if file
else{
    if (fichier_I == NULL){
        printf("Impossible d'ouvrir les fichier Iout.txt\n");
    }
    if (fichier_Q == NULL){  
        printf("Impossible d'ouvrir les fichier Qout.txt\n");
    }
}
printf("Fin de Programme \n\n");
}//fin main

void cellule(int* x, int* y, int* z, int tani, int i){

	int xk=*x;
	int yk=*y;
	int zk=*z;
	
	//printf(" //CELLULE// Entree:\nxk=%d \nyk=%d \n zk=%d\n" ,xk,yk, zk);
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
	//printf("//CELLULE// Sortie:\nx=%d \ny=%d \n z=%d\n" ,*x,*y, *z);

}
