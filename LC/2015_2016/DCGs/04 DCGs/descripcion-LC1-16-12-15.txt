Título: Análisis sintáctico

DESCRIPCIÓN:

El alumno deberá implementar un predicado de sintaxis:

frase(Frase, Arbol)

tal que Arbol es el árbol sintáctico resultante de analizar la frase
Frase. Deberán garantizarse las congruencias de número y género.

REQUISITOS:

El alumno deberá diseñar un analizador sintáctico capaz de analizar las frases del primer párrafo de

https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxzZmFwcmltZXJvZGVwcmltYXJpYXxneDo2MTIyMDI0MWIxMjg5N2Jh

En caso de no ser así el profesor valorará la dificultad y entidad de
las carencias observadas.

DOCUMENTACIÓN A PRESENTAR: El código se enviará, junto con el texto e
indicando claramente su origen, a través de Faitic. El nombre del
fichero estará formado por los apellidos de los autores en orden
alfabético.

Ej.- DarribaBilbao-VilaresFerro.pl

GRUPOS: Se podrá realizar individualmente o en grupos de dos personas.

DEFENSA: Consistirá en una demo al profesor, que calificará tanto los
resultados como las respuestas a las preguntas que realice acerca de
la implementación de la práctica. La puntuación dependerá de la
complejidad del texto que se analice.

FECHA DE ENTREGA Y DEFENSA: El mismo día.

CALIFICACIÓN: MAXIMA: 1'5 ptos

NOTA ORIENTATIVA: El alumno puede tomar como ejemplo orientativo la
siguiente DCG: 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DCG para un subconjunto del español (picoSpanish)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Definicion del operador de diferencias de listas

:-op(600,xfy,[\]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Base de datos intensiva (sintaxis).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Clausula de interfaz para pasar de listas a diferencias de listas

frase(Arbol,Frase) :- frase_dl(Arbol,Frase\[]).

% Estructura de la frase

frase_dl(f(SN,SV),P0\P2):- sn(SN,Num,P0\P1),sv(SV,Num,P1\P2).

% Estructura de un sintagma nominal

sn(sn(nil),_,P0\P0).

sn(sn(Det,N,Adj),Num,P0\P3):-det(Det,Num,Gen,P0\P1),
                             n(N,Num,Gen,P1\P2),
                             adj(Adj,Num,Gen,P2\P3).

sn(sn(Det,N),Num,P0\P2):-det(Det,Num,Gen,P0\P1),
                         n(N,Num,Gen,P1\P2).

sn(sn(N),Num,P0\P1):-n(N,Num,_,P0\P1).

% Estructura de un sintagma verbal

sv(sv(nil),_,P0\P0).

sv(sv(V),Num,P0\P1):-v(V,Num,P0\P1).

sv(sv(V,SN),Num,P0\P2):-v(V,Num,P0\P1),
                        sn(SN,_,P1\P2).

sv(sv(V,SPREP),Num,P0\P2):-v(V,Num,P0\P1),
                           sprep(SPREP,P1\P2).

sv(sv(V,SN,SPREP),Num,P0\P3):-v(V,Num,P0\P1),
                              sn(SN,_,P1\P2),
                              sprep(SPREP,P2\P3).

% Estructura de un sintagma preposicional

sprep(sprep(Prep,SN),P0\P2):-prep(Prep,P0\P1),sn(SN,_,P1\P2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Base de datos extensiva (diccionario).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

det(el, sing, masc, [el|X]\X).
det(la, sing, fem, [la|X]\X).
det(los, plu, masc, [los|X]\X).
det(las, plu, fem, [las|X]\X).

prep(de,[de|X]\X).
prep(a,[a|X]\X).
prep(con,[con|X]\X).
prep(en,[en|X]\X).

n(chico,sing, masc,[chico|X]\X).
n(chica,sing, fem, [chica|X]\X).
n(chicos,plu, masc, [chicos|X]\X).
n(chicas,plu, fem, [chicas|X]\X).

n('Juan',sing, masc,['Juan'|X]\X).
n('Elena',sing, fem,['Elena'|X]\X).

v(come,sing,[come|X]\X).
v(comia,sing,[comia|X]\X).
v(comen,plu,[comen|X]\X).
v(comian,plu,[comian|X]\X).

v(bebe,sing,[bebe|X]\X).
v(bebia,sing,[bebia|X]\X).
v(beben,plu,[beben|X]\X).
v(bebian,plu,[bebian|X]\X).

n(cafeteria,sing,fem,[cafeteria|X]\X).
n(cafeterias,plu,fem,[cafeterias|X]\X).

n(casa,sing,fem,[casa|X]\X).
n(casas,plu,fem,[casas|X]\X).

n(cafe,sing,masc,[cafe|X]\X).
n(cafes,plu,masc,[cafes|X]\X).

adj(alto,sing,masc,[alto|X]\X).
adj(alta,sing,fem,[alto|X]\X).
adj(altos,plu,masc,[altos|X]\X).
adj(altas,plu,fem,[altas|X]\X).

adj(bueno,sing,masc,[bueno|X]\X).
adj(buena,sing,fem,[buena|X]\X).
adj(buenos,plu,masc,[buenos|X]\X).
adj(buenas,plu,fem,[buenas|X]\X).
adj(malo,sing,masc,[malo|X]\X).
adj(mala,sing,fem,[mala|X]\X).
adj(malos,plu,masc,[malos|X]\X).
adj(malas,plu,fem,[malas|X]\X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ejemplo de pregunta:
% ? frase(Arbol,[los,chicos, buenos, bebian, el, cafe, en, la, cafeteria]).
% Arbol = f(sn(los, chicos, buenos), sv(bebian, sn(el, cafe), sprep(en, sn(la, cafeteria)))) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
