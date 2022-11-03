def opera(opr, op1, op2):
    toret = 0

    if opr == '+':
        toret = op1 + op2
    elif opr == '-':
        toret = op1 - op2
    elif opr == '*':
        toret = op1 * op2
    elif opr == '/':
        toret = op1 / op2
    elif opr == '^':
        toret = op1 ** op2

    return toret


def es_operador(s):
    toret = False

    if isinstance(s, str):
        s = s.strip()
        toret = s[0] in "+-*/^" if len(s) > 0 else False

    return toret


def es_operando(s):
    toret = True

    try:
        float(s)
    except ValueError:
        toret = False

    return toret


def calcula(terms):
    opr = '+'
    op1 = 0
    op2 = 0

    if len(terms) > 0:
        # Operador
        opr = terms[0]
        del terms[0]

        # Operando 1
        if len(terms) > 0:
            op1 = terms[0]
            del terms[0]
            if es_operador(op1):
                terms.insert( 0, op1 )
                op1 = calcula(terms)

        # Operando 2
        if len(terms) > 0:
            op2 = terms[0]
            del terms[0]
            if es_operador(op2):
                terms.insert(0, op2)
                op2 = calcula(terms)

        return opera(opr, op1, op2)


def scan_simple(s):
    return [float(x) if es_operando(x) else x for x in s.strip().split()]


def scan(s):
    s = s.strip()
    toret = []
    pos = 0
    while pos < len(s):
        x = s[pos]
        if es_operador(x):
            toret.append(x)
        elif str.isdigit(x):
            begin = pos
            while pos < len(s) and not es_operador(s[pos]) and not str.isspace(s[pos]):
                pos += 1
            toret.append(float(s[begin:pos]))
            pos -= 1
        pos += 1
    return toret


def calcula_prefija(s):
    return calcula(scan(s))


if __name__ == "__main__":
    expr = input("Dame una expr. prefija: ")
    print("Resultado: " + str(calcula_prefija(expr)))
