"""
Crea un programa que permita guardar y hacer búsquedas sobre pares de (nombre, e.mail).
El programa presentará un menú principal, con las opciones introducir, borrar y buscar.
Al introducir datos, se pide un nombre y un e.mail, y se guardan.
Para borrar, sólo se pide el nombre, se busca y se borra.
Para buscar, sólo se pide el nombre, se busca y se muestra.
-   Se debe utilizar un diccionario para guardar los datos.
    Créese una función que pida un nombre y devuelva el valor asociado
    (el métodod get() devuelve None si no se encuentra la clave), como soporte para las otras tres.
-   ¿Puedes crear fácilmente una opción más, listado, que liste todas las entradas (nombre, email)?
"""
dicco = {}


def menu():
    print("1. Introducir datos.\n2. Buscar datos.\n3. Borrar datos.")
    print("4. Muestra un dato.\n5. Muestra datos.\n0. Salir.\n")
    op = input()
    return int(op)


def insert():
    nom = str(input("Introduce un nombre:"))
    email = str(input("Introduce un email:"))
    if not dicco.get(nom):
        dicco[nom] = email
    elif dicco.get(nom):
        dicco[nom] = email


def buscar():
    val = str(input("Introduce el nombre a buscar:"))
    if not dicco.get(val):
        print("Nombre no encontrado")
    elif dicco.get(val):
        print(dicco[val])


def borrar():
    val = str(input("Introduce el nombre a borrar:"))
    if not dicco.get(val):
        print("Nombre no encontrado")
    elif dicco.get(val):
        dicco.pop(val)
        print("Borrado")


def muestraObjeto():
    val = str(input("Introduce el nombre a mostrar:"))
    if not dicco.get(val):
        print("Nombre no encontrado")
    elif dicco.get(val):
        print("{0}: {1}".format(val, dicco[val]))


def muestra():
    for i in dicco.keys():
        print("{0}: {1}".format(i, dicco[i]))


op = 1
while op != 0:
    op = menu()
    if op == 1:
        insert()
    elif op == 2:
        buscar()
    elif op == 3:
        borrar()
    elif op == 4:
        muestraObjeto()
    elif op == 5:
        muestra()
    elif op != 1 and op != 2 and op != 3 and op != 4 and op != 5 and op == 0:
        print("Saliendo")
