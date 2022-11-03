#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Nov  6 12:26:49 2019

@author: joseangelcidaraujo
"""


import numpy as np
from sympy import Symbol, Derivative, simplify
import math
import cmath
import matplotlib.pyplot as plt


# Definimos a función cuxas raíces queremos aproximar:

def f(z):

    return z**5-25

# Definimos a derivada da función anterior. Se fose necesario para algún método
# definiríase de forma similar a segunda derivada.


def derf(z):

    return 5*z**4

# Definimos a fórmula do método que queremos implementar. Neste exemplo
# tratase do Método de Newton. Para implementar outro metodo debemos definir
# a fórmula correspondente:


def g(z):

    return z-f(z)/derf(z)


# Os seguintes parametros poden ser modificados co obxetivo de
# conseguir os mellores graficos posibles:

# Número máximo de iteracións para o método elexido:

maxiter = 30

# O fractal representarase no rectángulo [a,b]x[c,d]:

a = -5
b = 5
c = -5
d = 5

# Número de puntos usados nos eixos OX e OY para representar o fractal: canto
# maior sexa o número de puntos mais preciso sera o gráfico, pero tamén mais
# tempo se necesitará para levar a cabo os cálculos.

npuntos = 2000

################### NON MODIFICAR ESTA PARTE DO PROGRAMA #####################
##############################################################################

fractal = np.zeros((npuntos, npuntos))
x = np.zeros(npuntos)
y = np.zeros(npuntos)
hx = (b-a)/npuntos
hy = (d-c)/npuntos
tol = 1.0e-6

for i in range(0, npuntos):
    x[i] = a+i*hx
    for j in range(0, npuntos):
        y[j] = c+j*hy
        z = complex(x[i], y[j])
        n = 1
        while (n < maxiter and z != complex(0, 0) and abs(f(z)) > tol):
            z = g(z)
            n = n+1
        fractal[j, i] = float(n)

##############################################################################
##############################################################################

z = Symbol('z')
print('A función utilizada é f(z)=', f(z))
print('A función do método é g(z)=', g(z))

# A continuación represéntase a imaxen fractal: recoméndase buscar unha gama de
# cores atractiva.

plt.imshow(fractal, cmap='coolwarm', extent=(a, b, c, d))
plt.colorbar()
plt.xlabel("x")
plt.ylabel("y")

# A continuación gárdase a imaxen do fractal nun ficheiro: cambiar o nome do
# ficheiro según o método usado

plt.savefig('fractal_Newton.png', dpi=2000)
plt.show()
