from math import sqrt


def desviacion_tipica(list, moyenne):
    addition = 0
    for element in list:
        addition += (element - moyenne) ** 2
    return sqrt(addition)


l = []
x = int(float(input("Dame un entero: ")))
while x != 0:
    l.append(x)
    x = int(float(input("Dame un entero: ")))
print(l)
print("Maximo:", max(l))
print("Minimo:", min(l))
print("Media:", sum(l)/len(l))
print("Desviación Típica:", desviacion_tipica(l, sum(l)/len(l)))
