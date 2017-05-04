//version 04/05/2017
//compute data de matlab comme un Cordic !! et sortie dans un fichier;
//compile "gcc -g Cordic_Mat.c -o Cordic_Mat -lm"
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>


#define TAILLE_MAX 100
#define TAILLE_MAX_FILE 10000
#define N 6
//#define B 6

#define PI 3.14159265
 
void cellule(int* x, int* y, int* z, int tani, int i);

int main(void){
 
int x,y,z,i,j,teta,res, nb_tst, err, err_1, b,end;
double rad,a_x,a_y;
int tan0[] ={45,26,14,7,3,1};
char str [TAILLE_MAX], file_name[TAILLE_MAX];
double I[TAILLE_MAX_FILE];
double Q[TAILLE_MAX_FILE];

char* errCheck;

FILE* fichier_I=NULL;
FILE* fichier_Q=NULL;

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
        printf("conversion p_vir= %sI[%d]=%lf\n\n",p_virg+1,i,I[i]);
        i++;
    }
    fclose(fichier_I);
    i=0;
    while(fgets(str, TAILLE_MAX, fichier_Q)!=NULL){
        char* p_virg=strchr(str,',');
        Q[i]= strtold((p_virg+1),&errCheck);
        if (errCheck == p_virg+1){
            printf("Converssion Error:%s\ni=%d\n",p_virg+1,i);
        } 
        printf("conversion p_vir= %s Q[%d]=%lf\n\n",p_virg+1,i,Q[i]);
        i++;
    }
    fclose(fichier_Q);
    end=i;
    printf("fin fichier I et Q debut cordic\n");

    for (b=16;b>1;b--){
        printf("lancement du test B=%d\n",b);
    	//init des variables
    	res=0;
    	err=0;
    	err_1=0;
    	nb_tst=0;
        sprintf(file_name, "Z_out_%d.txt", b);
        //printf("file_name=%s\n",file_name);
        out_file=fopen(file_name,"w+"); 
        if(out_file == NULL){
            printf("erreur impossible de cree %s \n",file_name);
        }
        else{
            //z=0;
            for (j=0;j<end;j++){
                z=0;
                a_x = I[j];
                a_y = Q[j];
                x= (int)(a_x*(0x1<<b));
                y= (int)(a_y*(0x1<<b));
            
                //printf("lancement du test B=%d\n",b);
               // printf("\nvaleur a_x=%lf\ta_y=%lf \n valeur z= %d",a_x,a_y,z);
                for (i=0;i<N;i++){
                    cellule(&x,&y,&z,tan0[i],i);
                   // printf("cellule %d OK\n\n",i);
                }
                //printf("\nvaleur a_x=%lf\ta_y=%lf \n valeur z= %d",a_x,a_y,z);
                //printf("\nvaleur x=%d\ty=%d \n valeur z=%d",x,y,z);
                fprintf(out_file,"%d\n",z);
            }
            fclose(out_file);
        }
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
}//fin main

void cellule(int* x, int* y, int* z, int tani, int i){

	int xk=*x;
	int yk=*y;
	int zk=*z;
	
//	printf(" //CELLULE// Entree:\nxk=%d \nyk=%d \n zk=%d\n" ,xk,yk, zk);
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
//	printf("//CELLULE// Sortie:\nx=%d \ny=%d \n z=%d\n" ,*x,*y, *z);

}
