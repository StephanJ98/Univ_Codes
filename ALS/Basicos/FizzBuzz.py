def pide_numero():
    return input("Dame un número:")


def evaluator(x):
    toret = ""
    if (int(x) % 3 == 0) & (int(x) % 5 == 0):
        toret = "FizzBuzz"
    elif int(x) % 3 == 0:
        toret = "Buzz"
    elif int(x) % 5 == 0:
        toret = "Fizz"
    else:
        toret = str(x)
    return  str(toret)


num = 1
while int(num) >= 0:
    num = pide_numero()
    print(evaluator(num))
