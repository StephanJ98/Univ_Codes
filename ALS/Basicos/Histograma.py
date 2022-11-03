def normaliza():
    diccionario = {"enero": 0, "febrero": 0, "marzo": 0, "abril": 0,
                   "mayo": 0, "junio": 0, "julio": 0, "agosto": 0,
                   "septiembre": 0, "octubre": 0, "noviembre": 0, "diciembre": 0}

    for mes in diccionario.keys():
        diccionario[mes] = int(input("Ventas en {0}: ".format(mes)))

    for mes in diccionario.keys():
        valor_max = max(diccionario.values())
        valor_actual = int(diccionario[mes])
        diccionario[mes] = int((40 * valor_actual) / valor_max)

    for mes in diccionario.keys():
        print("{0}: {1}".format(mes.capitalize(), "*" * diccionario[mes]))


normaliza()
