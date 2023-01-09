# Estimación Puntual

## Indice
* [Introducción](#introducción)
    * [Conceptos generales](#conceptos-generales)
* [Estimador de la media poblacional](#estimador-de-la-media-poblacional)
* [Estimador de la varianza poblacional](#estimador-de-la-varianza-poblacional)
* [Ejemplos Practicos](#ejemplos-practicos)
    * [1. Como calcular el intervalo de confianza, para un nivel de confianza dado](#1-como-calcular-el-intervalo-de-confianza-para-un-nivel-de-confianza-dado)
    * [2. Como afirmar una hipotesis a partir de un conjunto de datos y un nivel de confianza](#2-como-afirmar-una-hipotesis-a-partir-de-un-conjunto-de-datos-y-un-nivel-de-confianza)

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

# Ejemplos Practicos

## 1. Como calcular el intervalo de confianza, para un nivel de confianza dado

> **R-Commander**: 
> 1. Cargar conjunto de datos.
> 2. Estadisticos>Medias>Test t para una muestra

> **R-Commander V2**
> 1. Cargar conjunto de datos.
> 2. Estadistica Basica>Inferencia Estadistica>Intervalos de Confianza>... para una muestra>{1a o 2a opcion}

Para calcular el intervalo de confianza para una media poblacional con un nivel de confianza dado, necesitarás conocer la *media muestral*, la *desviación estándar* de la muestra y el *tamaño de la muestra*. Una vez que tengas estos valores, puedes calcular el intervalo de confianza de la siguiente manera:
1. **Calcular el margen de error**. Este es el valor que se añadirá y restará del valor de la media muestral para obtener el intervalo de confianza. 
> Para calcularlo, multiplica la *desviación estándar* de la muestra por el valor crítico $t$ del tamaño de la muestra que corresponda al nivel de confianza deseado.
>> El valor crítico $t$ se puede obtener de una tabla $t$ o utilizando una función en un software estadístico.
>>> Para obtener el valor crítico t en R Commander, primero debes cargar los datos en el programa y seleccionar el menú "Statistics" y luego "Distributions". A continuación, selecciona "t" en la lista de distribuciones y elige el nivel de confianza deseado en el cuadro "Confidence level". A continuación, introduce el tamaño de la muestra en el cuadro "Sample size" y haz clic en "Compute". <br>
>>> El valor crítico t se mostrará en el cuadro "Result". Puedes usar este valor para calcular el margen de error y, a continuación, el intervalo de confianza


2. **Calcular el intervalo de confianza**. Añade y resta el margen de error al valor de la media muestral.
> El intervalo de confianza será entonces (media muestral - margen de error, media muestral + margen de error).

***Por ejemplo***, supongamos que quieres calcular el intervalo de confianza del 95% para la media poblacional de una muestra de tamaño 30 con una media muestral de 10 y una desviación estándar de 2. El valor crítico t para un nivel de confianza del 95% y un tamaño de muestra de 30 es 2.04. El margen de error sería entonces 2 * 2.04 = 4.08. El intervalo de confianza sería (10 - 4.08, 10 + 4.08) = (5.92, 14.08).

> Es importante tener en cuenta que este método solo se aplica si la distribución de la población es normal o si la muestra es suficientemente grande (por lo general, más de 30). Si la distribución de la población no es normal o si la muestra es pequeña, es posible que deba utilizar otro método para calcular el intervalo de confianza.
>> Cuando la distribución de la población no es normal o cuando la muestra es pequeña, es posible que deba utilizar el intervalo de confianza para la mediana en lugar de la media. En este caso, se utiliza la distribución de Wilcoxon o la distribución t de Student para calcular el intervalo de confianza.

## 2. Como afirmar una hipotesis a partir de un conjunto de datos y un nivel de confianza
Para afirmar una hipótesis a partir de un conjunto de datos y un nivel de confianza, primero debes definir la hipótesis y elegir un nivel de confianza. Una vez que tengas esto, puedes utilizar una prueba estadística para evaluar la hipótesis y ver si es compatible con los datos. Si el resultado de la prueba estadística es significativo a tu nivel de confianza, entonces puedes afirmar la hipótesis.

Por ejemplo, supongamos que quieres afirmar la hipótesis de que el promedio de la altura de las mujeres es igual a 1.65 metros. Primero, eliges un nivel de confianza del 95%. Luego, recopilas un conjunto de datos de alturas de mujeres y utilizas una prueba estadística para evaluar si el promedio de alturas en el conjunto de datos es compatible con la hipótesis de que el promedio de alturas es igual a 1.65 metros. Si el resultado de la prueba estadística es significativo a tu nivel de confianza del 95%, entonces puedes afirmar la hipótesis de que el promedio de alturas de las mujeres es igual a 1.65 metros.

Es importante tener en cuenta que afirmar una hipótesis no significa que la hipótesis sea cierta, sino que simplemente es compatible con los datos que se tienen. Es posible que la hipótesis sea falsa o que existan otras explicaciones para los datos.

> * En el ejemplo anterior, la hipótesis que querías afirmar era que el promedio de la altura de las mujeres es igual a 1.65 metros. Para evaluar esta hipótesis, podrías utilizar una prueba de hipótesis para comparar la media de alturas de las mujeres con el valor conocido de 1.65 metros. En r-commander, podrías utilizar la opción "One-sample t-test" para realizar esta prueba de hipótesis.
> * Para realizar la prueba de hipótesis, primero debes seleccionar el conjunto de datos de alturas de mujeres en r-commander y luego ir a la opción "Statistics -> One-sample t-test". En la ventana que se abre, debes especificar el valor conocido de 1.65 metros en el campo "Hypothesized mean" y seleccionar el nivel de confianza del 95% en el campo "Confidence level". Luego, debes hacer clic en el botón "OK" para realizar la prueba de hipótesis.
> * Una vez que hayas realizado la prueba de hipótesis, r-commander te mostrará el resultado de la prueba, que incluirá el valor del estadístico t y el valor del p-valor. Si el valor del p-valor es menor que tu nivel de confianza del 95%, entonces puedes afirmar la hipótesis de que el promedio de alturas de las mujeres es igual a 1.65 metros.
