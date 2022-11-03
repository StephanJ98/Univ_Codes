"""
Supón las siguientes líneas de datos. La primera especifica los nombres de las empresas,
y las siguientes la empresa, la fecha del lunes de esa semana, y las ventas para cada día de la semana.
Crea una función que lea esa información como una cadena de texto separada por cambios de línea,
y genere un informe que sea sencillo de entender por el ser humano.

Microsoft, 1, Apple, 2, Google, 3, Yahoo, 4
1, 2015-01-09, 120, 34, 256, 78, 93, 222, 5
2, 2015-01-09, 900, 346, 730, 456, 33, 345, 234
3, 2015-01-09, 934, 922, 866, 444, 235, 999, 789
4, 2015-01-09, 45, 56, 78, 23, 44, 90, 9
"""
data = {
    "Microsoft", 1,
    "Apple", 2,
    "Google", 3,
    "Yahoo", 4,
    1, {"2015-01-09", str("120 34 256 78 93 222 5")},
    2, {"2015-01-09", str("900 346 730 456 33 345 234")},
    3, {"2015-01-09", str("934 922 866 444 235 999 789")},
    4, {"2015-01-09", str("45 56 78 23 44 90 9")}
}