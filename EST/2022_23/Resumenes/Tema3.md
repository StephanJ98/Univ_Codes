# Variables Aleatorias Unidimensionales

## Indice

* [Variable aleatoria unidimensional](#variable-aleatoria-unidimensional)
    * [Ejemplo *v.a*](#ejemplo)
    * [Clasificación de variables aleatorias](#clasificación-de-variables-aleatorias)
* [Principales distribuciones discretas](#principales-distribuciones-discretas)
    * [Uniforme en n puntos U\{x_1, ..., x_n\}](#uniforme-en-n-puntos)
    * [Bernoulli Be(p)](#bernoulli)
    * [Binomial B(n,p)](#binomial)
    * [Geométrica Geom(p)](#geométrica)
    * [Distribución de Poisson Pois(λ)](#distribución-de-poisson)
    * [Aproximación de la binomial por la Poisson](#aproximación-de-la-binomial-por-la-poisson)
* [Principales distribuciones continuas](#principales-distribuciones-continuas)

## Variable aleatoria unidimensional

### Introducción de la definición de Variable Aleatoria a partir de un espacio probabilístico
> El cálculo de probabilidades utiliza tanto variables estadísticas cualitativas y/o cuantitativas. 

***Variable Aleatoria***: Dado un espacio probabilístico $(\Omega, A, P)$ se define una variable aleatoria $X$ como una función $X: \Omega \rightarrow \mathbb{R}$ tal que se asigna un número real a cada elemento de $\Omega$. $X(\omega) \in \mathbb{R}$ para todo $\omega \in \Omega$ y $X^{-1}(B)= \{\omega \text{ tal que }X(\omega \in B) \} \in A, \text{ para todo } B \in \mathbb{B}$.

Es decir, una *v.a*. es una regla “bien definida” para asignar valores numéricos a todos los resultados posibles de un experimento.

***Función de Distribución***: Decimos que $F:\mathbb{R} \to \mathbb{R}$ es una Función de Distribución cuando verifica:

1. F es no decreciente
2. F es continua por la derecha.
3. $\lim_{x \to - \infty} F(x) = 0$.
4. $\lim_{x \to + \infty} F(x) = 1$.

###  Clasificación de variables aleatorias
* Variables aleatorias discretas: Una v.a. es discreta si el conjunto de posibles valores (dado por X (Ω)) que puede tomar es finito o infinito numerable.

* Variables aleatorias continuas: Una v.a. es continua si toma valores en un intervalo o que también se considera una variable continua si existe una función no negativa $f(x)\geq 0$, para todo $x \in \mathbb{B}$.

### Características de una v. a
* Esperanza $E(X)$: La esperanza matemática es un concepto de probabilidad que se refiere al valor esperado de una variable aleatoria. Se calcula sumando cada posible valor de la variable $(X)$ multiplicado por su probabilidad de ocurrencia y luego tomando la suma de todos estos valores. Por ejemplo, si lanzamos una moneda al aire, la esperanza matemática de obtener cara sería de 0.5, ya que hay una probabilidad del 50% de que la moneda caiga cara.
$$E(X) := \sum_{i \in I} x_i p_i$$

* Momento de orden r para la v.a. X centrado en el origen $(a_r)$: Es una medida de la dispersión de los valores de X alrededor del punto cero. Se calcula como el valor esperado del r-ésimo poder de la variable aleatoria menos el valor esperado de la variable aleatoria elevado a la potencia r, donde E[X] es la esperanza matemática de X. 
$$a_r = E((X - E(X))^r)$$

* Momento de orden r para la v.a. X centrado en la media (m_r): Se define como el valor esperado del producto de la variable aleatoria X menos la media de X elevado a la potencia r, donde E[X] es la esperanza matemática de X.
$$m_r = E((X - E(X))^r)$$

* Varianza de una v.a $Var(X) = σ^2(X)$: Es una medida de la dispersión de la distribución de probabilidad de X alrededor de su media. Matemáticamente, se puede expresar como $$\sigma^2(X) = E((X - E(X))^2)$$ La varianza es una medida de la cantidad de variabilidad o dispersión de una distribución de probabilidad. Una distribución con una varianza pequeña tiene sus valores agrupados cerca de la media, mientras que una distribución con una varianza grande tiene sus valores más dispersos.

### Tipificación de una v.a
El proceso de tipificación o estandarización de una v.a. consiste en su transformación en una nueva v.a. de media cero y varianza 1, es decir, dada X construir $$\Upsilon = \frac{X - E(X)}{\sigma(X)}$$

> Una función de masa de probabilidad es una función matemática que describe la distribución de probabilidad de una variable aleatoria discreta. Se representa con la letra "p" y se define como: $$p(x) = P(X = x)$$ Donde "p(x)" es la función de masa de probabilidad, "X" es la variable aleatoria y "x" es un valor posible que puede tomar la variable aleatoria. El valor "p(x)" nos da la probabilidad de que la variable aleatoria X tome el valor "x".
>> Por ejemplo, si lanzamos una moneda al aire, podríamos definir la función de masa de probabilidad para la variable aleatoria "número de caras obtenidas" como: $$p(0) = P(X = 0) = 0.5 \\ p(1) = P(X = 1) = 0.5$$ Esto significa que la probabilidad de obtener 0 caras al lanzar una moneda es del 50% y la probabilidad de obtener 1 cara es del 50%.

## Principales distribuciones discretas

Recordemos que una variable aleatoria X tiene una distribución de probabilidad discreta si:
$$P(X = x_i) = {p_i \quad \text{si} \quad x = x_i \quad (i = 1, 2, ...)}, {0 \quad \text{en el otro caso}} \quad \text{con } p_i \ge 0 \quad \text{y} \quad \sum_{i} p_i = 1$$

### Uniforme en n puntos
$U\{x_1, ..., x_n\}$: Describe el comportamiento de una variable aleatoria que puede tomar n valores distintos con la misma probabilidad. $$X(\Omega) = \{x_1, ..., x_n\} \quad \text{donde} \quad x_1 < x_2 < ... < x_n$$

#### Función masa de probabilidad: $$P(X = x_i) = \frac{1}{n} \quad \text{para todo} \quad i = 1, ..., n$$

---

###  Bernoulli
$Be(p)$: Consideremos un experimento aleatorio que da lugar a dos únicos posibles sucesos: $$E = “Éxito” \\ F = \overline{E} = “Fracaso”$$ donde $p = P(E) \quad \text{y} \quad q = P(F) = 1 - P(E) = 1 - p$.

#### Función masa de probabilidad: $$P(X = 1) = P(E) = p \quad y \quad P(X = 0) = P(F) = q$$

#### Características:
$$E(X) = p \\ Var(X) = pq$$

---

### Binomial 
$B(n,p)$: Supongamos que realizamos n experimentos o pruebas de Bernoulli independientes, es decir, la probabilidad de “Éxito” es siempre la misma para todos los experimentos.
La variable X de interés será $$X = \text{“Número de éxitos en n realizaciones de un proceso de Bernoulli”}$$ que denominaremos binomial de parámetros $n, p$ y la representaremos por $B(n, p)$, donde $n$ es el número de realizaciones y $p$ la probabilidad de éxito en cada una de ellas (que estamos suponiendo fija).


#### Función masa de probabilidad: $$P(X = k) = \frac{n!}{k!*(n-k)!}*p^kq^{n-k} \quad con \quad k = 0, 1, . . . , n$$

> * La distribución de Bernoulli es una $B(1,p)$.
> * Una v.a. Binomial puede ser considerada como una suma de n variables aleatorias de Bernoulli de parámetro p, es decir, como la variable indicadora del número de exitos en n pruebas de Bernoulli.

---

### Geométrica
$Geom(p)$: En las mismas condiciones del experimento binomial, consideremos la variable aleatoria $$X =\text{“Número de fracasos hasta obtener el primer éxito”}$$ La variable así definida tiene una distribución geométrica de parámetro $p$ (donde $p$ es, de nuevo, la probabilidad de éxito).

#### Función masa de probabilidad: $$P(X = k) = q^kp \quad con \quad k = 0, 1, 2, ...$$

#### Características:
$$E(X) = q/p \\ Var(X) = q/p^2$$

--- 

###  Distribución de Poisson
$Pois(λ)$: Consideremos un experimento en el que observamos el número de sucesos (llamadas telefónicas a una centralita, llegadas de aviones al aeropuerto, número de clientes que llegan a un banco, etc) que ocurren en un soporte continuo (en un intervalo de tiempo, longitud, . . . )

A este experimento se le denomina experimento o proceso de Poisson y verifica que:
* *Es estable*: produce, a largo plazo, un número medio de sucesos constante λ por unidad de observación (tiempo, espacio,área,. . . )
* Los sucesos aparecen de forma independiente, es decir, el proceso no tiene memoria: conocer el número de sucesos en un intervalo no ayuda a predecir el número de sucesos en el siguiente.

La variable de Poisson se define en el proceso anterior como: $$X_t = \text{“Número de sucesos en un intervalo de longitud t”}$$

#### Función masa de probabilidad: $$P(X_t = k) = e^{−λt}\frac{(λt)^k}{k!} \quad donde \quad k =0, 1, 2 . . .$$

#### Características:
$$E(X_t) = λt \\ Var (X_t) = λt$$

---

### Aproximación de la binomial por la Poisson
La distribución de Poisson aparece como límite de la distribución binomial si suponemos que el número de realizaciones del experimento, $n$, es muy grande pero la probabilidad de éxito, $p$, es pequeña.

1. Si $X ∼ Bi(n, p)$ con $p < 0.01$ y $n ≥ 30$ entonces $X$ puede aproximarse por una $Pois(np)$.
2. Si $X ∼ Bi(n, p)$ con $p > 0.99$ y $n ≥ 30$ entonces $X$ puede aproximarse por una $Pois(n(1 − p))$.

## Principales distribuciones continuas
Recordemos que una variable aleatoria $X$ tiene una distribución de probabilidad continua si existe una función de densidad $f : R → R$, no negativa y de área $1$ donde las probabilidades verifican.

### Uniforme continua
Una variable aleatoria sigue una distribución uniforme en un intervalo, cuando su función de densidad es constante en dicho intervalo y se anula fuera de él.
