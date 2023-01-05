# Cálculo de probabilidades

## Índice

* [Introducción](#introducción)
* [Probabilidad](#probabilidad)
* [Combinatoria](#combinatoria)
    * [Variaciones (sin repetición)](#variaciones-sin-repetición)
    * [Variaciones (con repetición)](#variaciones-con-repetición)
    * [ Permutaciones (sin repetición)](#permutaciones-sin-repetición)
    * [ Permutaciones (con repetición)](#permutaciones-con-repetición)
    * [Combinaciones (sin repetición)](#combinaciones-sin-repetición)
    * [Combinaciones (con repetición)](#combinaciones-con-repetición)
* [Probabilidad condicionada e Independencia](#probabilidad-condicionada-e-independencia)
* [Regla del Producto](#regla-del-producto)
* [Experimentos Compuestos](#experimentos-compuestos)

## Introducción

El cálculo de probabilidades nos suministra las reglas para el estudio de los experimentos aleatorios o de azar, constituyendo el soporte teórico para la Estadística.

Se distinguen dos tipos de experimentos:

* **Experimento determinista**: Aquel que repetido en idénticas condiciones, proporciona siempre el mismo resultado. *Ejemplo*: Leyes físicas.
* **Experimento aleatorio**: Aquel que repetido varias veces en las mismas condiciones puede dar lugar a diferentes resultados conocidos previamente. *Ejemplo*: el número obtenido al lanzar un dado.

> La Teoría de la Probabilidad estudia los *experimentos aleatorios*.

### Definiciones previas

* **Suceso elemental ($w$)**: Cada uno de los posibles resultados de un experimento aleatorio.
* **Espacio muestral ($\Omega$)**: Conjunto de todos los posibles resultados de un experimento aleatorio.
* **Suceso**: Diremos que un suceso ocurre, cuando se presenta alguno de los posibles resultados que lo definen. Son sucesos de interés:
    * Suceso seguro: es aquel que siempre se verifica. ( $\Omega$ )
    * Suceso imposible: es aquel que nunca se verifica, suceso vacío. ( $\emptyset$ )
    * Suceso complementario: se denomina suceso complementario de un suceso $A$, al que se verifica cuando no se verifica $A$. ( $\overline{A}$ )
    > EJEMPLO: 
    >> $\Omega = \{1,2,3,4,5,6\}$, $A = "par" = \{2,4,6\}$, entonces $\overline{A} = "impar" = \{1,3,5\}$

### Operaciones básicas con sucesos aleatorios
* **Unión**: Dados dos sucesos aleatorios $A$ y $B$, se denomina suceso unión de $A$ y $B$ al conjunto formado por todos los sucesos elementales que pertenecen a $A$ o bien que pertenecen a $B$. $$A \cup B = \{ w \in \Omega \text{ tal que } w \in A \text{ o } w \in B\}$$
* **Intersección**: Dados dos sucesos aleatorios $A$ y $B$, se denomina suceso intersección de $A$ y $B$ al conjunto formado por todos los sucesos elementales que pertenecen a $A$ y $B$ a la vez. $$A \cap B = \{ w \in \Omega \text{ tal que } w \in A \text{ y } w \in B\}$$
> Diremos que dos sucesos $A$ y $B$ son ***incompatibles*** si $A \cap B = \emptyset$.
* **Diferencia**: Dados dos sucesos aleatorios $A$ y $B$, se llama suceso diferencia de $A$ y $B$, al suceso aleatorio formado por todos los sucesos elementales que pertenecen a $A$ pero no a $B$. $$A \setminus B = A-B = \{ w \in \Omega \text{ tal que } w \in A \text{ y } w \notin B\} = A \cap \overline{B}$$
* **Diferencia simétrica**: : Dados dos sucesos aleatorios $A$ y $B$, se llama suceso diferencia simétrica de $A$ y $B$, aquel que ocurre cuando sucede sólo $A$ o sólo $B$. $$A \Delta B = (A \cup B) \setminus (A \cap B)$$

<p align="center">
   <img src="https://github.com/StephanJ98/Univ_Codes/blob/main/EST/2022_23/Resumenes/imagen_sucesos_aleatorios.png">
</p>

## Probabilidad

La probabilidad de un suceso se define como la proporción de veces que ocurriría dicho suceso si se repitiese un experimento en un número grande de ocasiones bajo condiciones similares.

> ***Definición axiomática de Kolmogorov***: 
> Una probabilidad $P$ sobre una $\sigma\text{-algebra}$ $A$ es una aplicación $$P : A \rightarrow [0,1]$$ verificando:
> 1. $P(\Omega)=1$.
> 2. $P(B) \geq 0$.
> 3. Si una colección de sucesos $\{B_i\}\_{i=1}^\infty \in A$,  incompatibles dos a dos, entonces $P(\cup_{i=1}^\infty B_i) = \sum_{i=1}^\infty P(B_i)$.
>> A la terna (Ω, A, P) se le llama espacio de probabilidades. <br>
>> Propiedades derivadas de los axiomas de Kolmogorov:
>> 1. $P(\emptyset)=0$.
>> 2. Para cualquier suceso $B,0 \leq P(B) \leq 1$.
>> 3. Si $B$ y $C$ son dos sucesos tales que $B \subseteq C$, entonces $P(B) \leq P(C)$.
>> 4. $P(\overline{B})=1-P(B)$.
>> 5. Si una colección de sucesos $\{B_i\}\_{i=1}^{n} \in A$,  incompatibles dos a dos, entonces $P(\cup_{i=1}^nB_i)=\sum_{i=1}^nP(B_i)$.
>> 6. $P(B \cup C)=P(B)+P(C)-P(B \cap C)$.

### Métodos de asignación de probabilidades
* A partir de un estudio previo, identificando las probabilidades con las frecuencias relativas.
* *Ley de Laplace*: $P(A)= \frac{\text{N\{Casos Favorables\}}}{\text{N\{Casos Posibles\}}}$.
* *Probabilidad geométrica*: Una extensión de la Ley de Laplace al caso de experimentos donde el espacio muestral $\Omega$ es no numerable y la probabilidad es *al azar*, se puede calcular la probabilidad de un suceso $A$ como $P(A)= \frac{m(A)}{m(\Omega)}$, siendo $m$ una determinada medida geométrica como la longitud, el área, el volumen, etc.

## Combinatoria

La combinatoria estudia las diferentes formas en que se pueden realizar la ordenación o agrupamiento de unos cuantos objetos siguiendo unas determinadas condiciones o reglas.

### Variaciones (sin repetición)
Se llama variaciones de $n$ elementos tomados de $m$ en $m (m \leq n)$ a los distintos grupos formados por $m$ elementos de forma que los $m$ elementos que forman el grupo son distintos.
> Dos grupos son distintos si se diferencian en algún elemento o en el orden en que están colocados (influye el orden).

$$V_{n,m}= V_n^m = \frac{n!}{(n-m)!}$$

### Variaciones (con repetición)
Se llama variaciones con repetición de $n$ elementos tomados de $m$ en $m$ a los distintos grupos formados por $n$ elementos de manera que los elementos que forman cada grupo pueden estar repetidos.
> Dos grupos son distintos si se diferencian en algún elemento o en el orden en que estos están colocados (influye el orden).

$$VR_{n,m}=VR_n^m=n^m$$

### Permutaciones (sin repetición)
Se llama permutaciones de $n$ elementos a las diferentes agrupaciones de esos $n$ elementos de forma que en cada grupo intervienen los $n$ elementos sin repetirse ninguno (intevienen todos los elementos).
> Dos grupos son diferentes si el orden de colocación de alguno de esos n elementos es distinto (influye el orden).
$$P_n=V_n^n=n!$$

### Permutaciones (con repetición)
Se llama permutaciones con repetición de $n$ elementos donde el primer elemento se repite $a$ veces , el segundo $b$ veces , el tercero $c$ etc. A los distintos grupos que pueden formarse con esos $n$ elementos de forma que intervienen todos los elementos.
> Dos grupos se diferencian en el orden de colocación de alguno de sus elementos.

$$PR_n^{a,b,c...}= \frac{n!}{a!*b!*c!...}$$

### Combinaciones (sin repetición)
Se llama combinaciones de $n$ elementos tomados de $m$ en $m (m \leq n )$ a todas las agrupaciones posibles que pueden hacerse con los $n$ elementos de forma que cada agrupación está formada por $m$ elementos distrintos entre si y dos agrupaciones distintas se diferencian al menos en un elemento, sin tener en cuenta el orden.
$$C_{n,m}=C_n^m=(_m^n)= \frac{n!}{m!*(n-m)!}$$

### Combinaciones (con repetición)
Se llama combinaciones con repetición de $n$ elementos tomados de $m$ en $m$, a los distintos grupos formados por $m$ elementos de manera que los elementos que forman cada grupo pueden estar repetidos y dos agrupaciones distintas se diferencian al menos en un elemento, sin tener en cuenta el orden.
$$CR_{n,m}=CR_n^m= \frac{(n+m-1)!}{m!*(n-1)!}$$

## Probabilidad condicionada e Independencia
Supongamos que lanzamos un dado, la probabilidad de obtener un $3$ es de $1/6$, pero si sabemos que ha salido impar, la probabilidad de obtener un $3$ pasa a ser $1/3$. Vemos pues, que la presencia de información a priori puede cambiar el espacio muestral y también las probabilidades.

### Probabilidad condicionada
Dados dos sucesos $B$ y $C$ (con $P(C)>0$), definimos la probabilidad condicionada de $B$ a $C$ como: $$P(B/C)= \frac{P(B \cap C)}{P(C)}$$

Como consecuencia de la definición se puede ver $P(B \cap C)=P(B/C)*P(C)$

### Independencia
Dos sucesos $B$ y $C$ se dice que son independientes si la ocurrencia o no de uno no influye en la ocurrencia o no del otro, es decir: $P(B/C)=P(B)$ , o lo que es lo mismo $P(B \cap C)=P(B)*P(C)$.

## Regla del Producto
Si $A$ y $B$ son eventos independientes entonces $P(AyB) = P(A)*P(B)$

## Experimentos compuestos
Un experimento compuesto es aquel que consta de dos o más experimentos aleatorios simples.
