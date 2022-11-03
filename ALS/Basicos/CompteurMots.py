"""
Cuenta la aparicion de palabras en un texto introducido por el usuario.
Por ejemplo:
Texto: Esto es una prueba una dura prueba
esto: 1
es: 1
una: 2
prueba: 2
dura: 1
"""


def conteo_palabras(texto):
    txt = texto.lower().split()
    dix= {}
    for palabra in txt:
        contador = dix.get(palabra)
        if contador == None:
            dix[palabra] = 1
        else:
            dix[palabra] = contador +1
    return dix


text = input("Introduce texto:")
result = conteo_palabras(text)
for palabra, cont in result.items():
    print({palabra}, {cont})
