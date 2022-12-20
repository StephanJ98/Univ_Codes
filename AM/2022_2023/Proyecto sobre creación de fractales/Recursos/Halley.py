#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Nov  6 12:26:49 2019
@author: joseangelcidaraujo
"""


import numpy as np
from sympy import Symbol, Derivative, simplify, lambdify
import matplotlib.pyplot as plt

# Definimos as funcións cuxas raíces queremos aproximar:

z = Symbol('z')
f = (z**3)*(z+5)*(z-5)
derf = Derivative(f, z, 1).doit()
derderf = Derivative(derf, z, 1).doit()

# Definimos a fórmula do método que queremos implementar. Neste exemplo
# tratase do Método de Newton. Para implementar outro metodo debemos definir
# a fórmula correspondente:
g = z-((2*f*derf)/((2*derf**2)-(f*derderf)))

# Número máximo de iteracións para o método elexido:
maxiter = 30

# O fractal representarase no rectángulo [a,b]x[c,d]:
a = -10
b = 10
c = -10
d = 10

# Número de puntos usados nos eixos OX e OY para representar o fractal: canto
# maior sexa o número de puntos mais preciso sera o gráfico, pero tamén mais
# tempo se necesitará para levar a cabo os cálculos.
npuntos = 1000

################### NON MODIFICAR ESTA PARTE DO PROGRAMA #####################
##############################################################################

ff = lambdify(z, f, "numpy")
gg = lambdify(z, g, "numpy")
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
        while (n < maxiter and z != complex(0, 0) and abs(ff(z)) > tol):
            z = gg(z)
            n = n+1
        fractal[j, i] = float(n)

##############################################################################
##############################################################################

print('A función utilizada é: f(z)=', f)
print('A súa derivada é: derf(z)=', simplify(derf))
print('A súa derivada é: derderf(z)=', simplify(derderf))
print('A función do método de Halley é: g(z)=', simplify(g))

# A continuación represéntase a imaxen fractal: recoméndase buscar unha gama de
# cores atractiva.
plt.imshow(fractal, cmap='coolwarm', extent=(a, b, c, d))
plt.colorbar()
plt.xlabel("x")
plt.ylabel("y")

# A continuación gárdase a imaxen do fractal nun ficheiro: cambiar o nome do
# ficheiro según o método usado
plt.savefig('fractal_Halley.png', dpi=2000)
plt.show()
