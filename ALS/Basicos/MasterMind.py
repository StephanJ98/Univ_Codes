import random


def piensa_numero():
    random.seed()
    return random.randint(1, 100)


def pide_numero():
    return input("Introduce un número:")


val = piensa_numero()
tries = 0
print("He pensado en un número entre 1 y 100... Cual es?")
while True:
    el = int(pide_numero())
    if  el < val:
        print("Es mayor")
    elif el > val:
        print("Es menor")
    else:
        print("Lo has encontrado en " + str(tries) + " intentos.")
        break
    tries += 1
