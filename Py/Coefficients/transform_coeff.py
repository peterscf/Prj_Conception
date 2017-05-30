#! /usr/bin/python3

import csv

"""
Pour utiliser le script comme traducteur de chiffre à virgule en binaire virgule fixe il faut fournir un fichier à l'image de coeff.csv

Et lire la dernière ligne console : coeff_transform qui contient pour chaque élément la traduction adaptée

"""



#Mettre ici le nombre de 2 pow -nb_p_neg à utilser
nb_p_neg = 10
#Le gain est une notion spéficique au filtre, il permet d'optimiser l'utilisation de la dynamique qui est a notre disposition
gain = 10


## Spécifique au filtre
coeff = []
coeff_th = [0.08284, 0.03539, 0.04139, 0.04703, 0.05192, 0.05565, 0.05833, 0.0598, 0.0598, 0.05833, 0.05565, 0.05192, 0.04703, 0.04139, 0.03539, 0.08284]

## Ouverture et stockage du fichier
with open("coeff.csv", 'r') as data :
	coeff = data.read().splitlines()

## Str to float
for i in range( len(coeff)):
	coeff[i] = float(coeff[i])

## Appplication du gain
for i in range( len(coeff)):
	coeff[i] *= gain
	coeff_th[i] *= gain	
#print(coeff)


## Calcul des 2 pow - nb_p_neg nommés pas
pas = []
for i in range(nb_p_neg):
	pas.append(2**(-i))

#print(pas)


coeff_transform = []
reste = []
diff = []

#Pour chaque valeur calcul de sa traduction binaire
for i in range( len(coeff) ):
	#Tmp est la traduction binaire
	tmp = ''
	#reste val, la valeur résultante du code binaire
	reste_val = 0
	for j in range( nb_p_neg ):
		#On test si la valeur à coder entre dans le pas considéré
		if coeff[i] > pas[j]:
			# si oui, c'est un "1" et on retire la valeur au coeff pour l'itération suivante.
			tmp += '1'
			coeff[i] -= pas[j]
			reste_val += pas[j]
		else :
			tmp += '0'

	reste.append(coeff[i])
	diff.append(reste_val)
	coeff_transform.append(tmp)

for i in range( len(coeff) ):
	print(' Coeff n°', i+1, '\n Thérique', coeff_th[i], '\n Obtenu  ', str(diff[i])[0:8], '\n Erreur  ', str(((coeff_th[i]-diff[i])/coeff_th[i])*100)[:3], '%\n Binaire ', coeff_transform[i],'\n')


print(coeff_transform)
