# Estimación Puntual

## Indice
* [Introducción](#introducción)
    * [Conceptos generales](#conceptos-generales)
* [Estimador de la media poblacional](#estimador-de-la-media-poblacional)
* [Estimador de la varianza poblacional](#estimador-de-la-varianza-poblacional)

## Introducción
En este tema se hacen inferencias sobre una población basándonos en información contenida en una muestra.

### Conceptos generales
Se está interesado en el estudio de una variable aleatoria $X$ cuya función de distribución $F_{θ}(x)$ es en mayor o menor medida desconocida. En muchas situaciones esta función se supondrá que pertenece a una familia de distribuciones conocida que depende únicamente de un parámetro desconocido $θ \in Θ$ de modo que el objetivo de la estimación puntual es emplear una muestra para calcular un número que represente en algún sentido el verdadero valor de ese parámetro.

Se supondrá con carácter general que se dispone de un conjunto de valores numéricos $x_1, . . . , x_n$ que constituyen una *muestra aleatoria* de $X$.

La manera de proceder consiste en seleccionar una función llamada *estadístico* o **estimador** $T (X_1, X_2, . . . , X_n)$ y tomar como estimación del parámetro $θ$, el valor de $T$ calculado a partir de la muestra obtenida.

>  Un estadístico o estimadores cualquier función $T (X_1, X_2, . . . , X_n)$ de la muestra $X_1, X_2, . . . , X_n$, por tanto es también una variable aleatoria con una distribución de probabilidad, llamada distribución en el muestreo de $T$.
>> Ejemplos de estadísticos:
>> * media muestral
>> * varianza muestral
>> * menor de los valores muestrales, frente a la estimación $x_{(1)}$
>> * mayor de los valores muestrales, frente a la estimación $x_{(n)}$

> **Curtosis**: La curtosis es una medida de la forma de una distribución de probabilidad o de un conjunto de datos. Se refiere a la cantidad de datos que están concentrados alrededor del promedio, o a la simetría de la distribución en torno a su mediana. Una distribución con curtosis positiva, también conocida como leptocúrtica, tiene una gran cantidad de datos concentrados en torno al promedio, lo que significa que hay pocos valores extremos. Por otro lado, una distribución con curtosis negativa, también conocida como platícúrtica, tiene menos datos concentrados alrededor del promedio, lo que significa que hay más valores extremos.

## Estimador de la media poblacional
Sea $X_1,...,X_n$ una muestra aleatoria de una variable aleatoria $X$ con media $E(X) = µ$ y varianza $Var(X) =σ^2$. Entonces el estimador de la media $µ$, es la media muestral que viene dado por:
$$\overline{X}=\frac{1}{n}\sum_{i=1}^nX_i$$

## Estimador de la varianza poblacional
Sea $X_1,...,X_n$ una muestra aleatoria de una variable aleatoria $X$ con media $E(X) = µ$ y varianza $Var(X) =σ^2$. El estimador más razonable de la varianza poblacional $σ^2$ es la varianza muestral.
$$S^2=\frac{1}{n}\sum_{i=1}^n(X_i-\overline{X})^2=\frac{1}{n}\sum_{i=1}^nX_i^2-\overline{X}^2$$
