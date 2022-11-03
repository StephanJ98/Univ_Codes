def es_anagrama(s1, s2):
    s1.sort()
    s2.sort()
    pos = 0
    trouve = True
    while pos < len(s1) and trouve:
        if s1[pos] == s2[pos]:
            pos = pos + 1
        else:
            trouve = False
    return trouve


def inp():
    toret = input("Introduce una cadena (Sin espacios):")
    if toret.isalpha():
        return toret
    else:
        print("Cadena no Valida")
        toret = inp()
        if toret.isalpha():
            return toret


s1 = inp()
print("Cadena 1 es:", s1)
s2 = inp()
print("Cadena 2 es:", s2)
print("La cadena", s1, "y la cadena", s2, "son anagramas:", es_anagrama(list(s1), list(s2)))
