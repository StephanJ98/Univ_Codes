def factorial_recursiva(n):
    if n == 1:
        toret = 1
    else:
        toret = n * factorial_recursiva(n - 1)
    return toret


print("El factorial recursivo de 3 es:", factorial_recursiva(3))