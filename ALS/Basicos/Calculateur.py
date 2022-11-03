def calculette(x, y, op):
    toret = 0
    if op == "+":
        toret = x + y
    elif op == "-":
        toret = x - y
    elif op == "*":
        toret = x * y
    elif op == "/":
        toret = x / y
    elif op == "^":
        toret = x ** y
    else:
        toret = "Operación no valida."
    return "El resultado es: " + str(toret)


def demandeur(s):
    return input(str(s))


val1 = demandeur("Introduce el primer número: ")
val2 = demandeur("Introduce el segundo número: ")
oper = demandeur("Introduce el operador a usar (+,-,*,/,^)")
if isinstance(val1, int) and isinstance(val2, int) and isinstance(oper, str):
    print(calculette(int(val1), int(val2), str(oper)))
else:
    print("Has introducido algun valor no permitido.")
