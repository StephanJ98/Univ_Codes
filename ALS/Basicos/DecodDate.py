def decoder(code):
    dicco = {
        "enero": "01", "febrero": "02", "marzo": "03", "abril": "04",
        "mayo": "05", "junio": "06", "julio": "07", "agosto": "08",
        "septiembre": "09", "octubre": "10", "noviembre": "11", "diciembre": "12",
    }
    if dicco.get(code) != None:
        mois = dicco[code]
    else:
        mois = "###Error###"
    return mois


def getData(text):
    raw = text
    txt = raw.lower().split()
    dicco = {}
    cont = 0
    for mot in txt:
        dicco[cont] = mot
        cont = cont + 1
    return dicco


text = input("Introduce la fecha \nEl formato correcto es 12 Febrero 2015\n")
dicco = getData(text)
print(dicco[2], decoder(dicco[1]), dicco[0])


"""
Crea una función decodificadora de fechas.
Aceptará fechas del estilo “12 Feb 2015”, y las convertirá al sistema ISO-8601, es decir, “2015-02-12” en el ejemplo.
"""
