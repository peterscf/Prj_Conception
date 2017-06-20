//version 11/05/2017
//compute data de matlab comme un Cordic !! et sortie dans un fichier;
//compile "gcc -g <fichier.c> -o <exe> -lm"
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>


#define TAILLE_MAX 200
#define TAILLE_MAX_FILE 65000
#define N 6
#define B 4
#define G 1
#define PI 3.14159265
 
void cellule(int* x, int* y, int* z, int tani, int i);

int main(int argc, char* argv[]){
 
int x,y,z,i,j,k,teta,res, nb_tst, err, err_1, b,end, val_2;
double rad,a_x,a_y;
int tan0[] ={45,26,14,7,3,1};
char str2 [TAILLE_MAX], str [TAILLE_MAX], file_name[TAILLE_MAX],write_str[TAILLE_MAX]; 
char time[TAILLE_MAX_FILE][100];
double I[TAILLE_MAX_FILE];
double Q[TAILLE_MAX_FILE];

char* errCheck;

FILE* fichier_I=NULL;
FILE* fichier_Q=NULL;
FILE* fichier_B=NULL;

FILE* file_x=NULL;
FILE* file_y=NULL;
FILE* file_b=NULL;
FILE* file_val_b=NULL;


printf("debut programme\n");
fichier_I=fopen("./I_in.txt","r");
fichier_Q=fopen("./Q_in.txt","r");
fichier_B=fopen("./bit_sequence.txt","r");

if (fichier_I != NULL && fichier_Q != NULL && fichier_B != NULL){
    //recuperation des donne des fichiers
    i=0;
    file_b=fopen("./bit_stream.dat","w+");
    file_val_b=fopen("./bit_streamvalid.txt","w+");
    while(fgets(str, TAILLE_MAX, fichier_B)!=NULL){
        char* p_virg=strchr(str,',');
	fprintf(file_b,"%d\n",(int)strtold((p_virg+1),&errCheck));
	if (i%2>0){
		fprintf(file_val_b,"%d%d\n",val_2,(int)strtold((p_virg+1),&errCheck));
		fprintf(file_val_b,"%d%d\n",val_2,(int)strtold((p_virg+1),&errCheck));
		fprintf(file_val_b,"%d%d\n",val_2,(int)strtold((p_virg+1),&errCheck));
		fprintf(file_val_b,"%d%d\n",val_2,(int)strtold((p_virg+1),&errCheck));
		fprintf(file_val_b,"%d%d\n",val_2,(int)strtold((p_virg+1),&errCheck));
	}
	val_2 = (int)strtold((p_virg+1),&errCheck);
	if (errCheck == p_virg+1){
            printf("Converssion Error:%s\ni=%d\n",p_virg+1,i);
        }
        i++;
    }
    fclose(fichier_B);
    fclose(file_b);
    fclose(file_val_b);
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
    //out_file=fopen("./simu_file/Z_out_C.txt","w+");
   file_x=fopen("./I_in.dat","w+");
   file_y=fopen("./Q_in.dat","w+"); 
            for (j=0;j<end;j++){
		a_x=I[j];
		a_y=Q[j];
		x= (int)(a_x*(0x1<<B));
 		y= (int)(a_y*(0x1<<B));
                fprintf(file_x,"%.2X\n",x*G);
		fprintf(file_y,"%.2X\n",y*G);
            }
        }
else{
    if (fichier_I == NULL){
        printf("Impossible d'ouvrir les fichier I_in.txt \n");
    }
    if (fichier_Q == NULL){  
        printf("Impossible d'ouvrir les fichier Q_in.txt\n");
    }
}
printf("Fin de Programme \n\n");
}//fin main
