# Estatística Descritiva con R

## Índice

* [Introducción](#1---introducción)
    * [Conceptos Generales](#11---conceptos-generales)
* [Estadística Descriptiva Unidimensional](#2---estadística-descriptiva-unidimensional)
    * [Representaciones Gráficas](#21---representaciones-gráficas)
    * [Principales características numéricas](#22---principales-características-numéricas)
    * [Medidas de posición de tendencia central](#23---medidas-de-posición-de-tendencia-central)
    * [Medidas de posición no centrales: los Cuantiles](#24---medidas-de-posición-no-centrales-los-cuantiles)
    * [Medidas de Dispersión](#25---medidas-de-dispersión)
    * [Medidas de Dispersión relativas](#26---medidas-de-dispersión-relativas)
    * [Medidas de Forma](#27---medidas-de-forma)

    


## 1 - Introducción 
### 1.1 - Conceptos Generales
 
* ***Población:*** Cualquier conjunto de personas, objetos, ideas o acontecimientos.
* ***Muestra:*** Subconjunto de individuos pertenecientes a una población determinada y preferiblemente *representativo* de esta.
* ***Variables:*** En los elementos de una población se pueden observar uno o varios caracteres:
    * **Variable cualitativa (o atributo):** Es un carácter de una población que no es susceptible de ser medido numéricamente. Se clasifican en nominales y ordinales.
        * *Cualitativa Ordinal:* Se pueden ordenar. **Ejemplos:** el nivel de estudios, la escala de grises.
        * *Cualitativa nominal:* No se pueden ordenar ya que representan características. **Ejemplos:** el color de ojos, la raza, el sexo, la inclinación política.
    * **Variable cuantitativa:** Es cualquier carácter de una población susceptible de tomar valores numéricos. Se clasifican en discretas y continuas. 
        * *Cuantitativa discreta:* Toman únicamente un número finito o infinito numerable de valores. **Ejemplos:** número de trabajos en cola en un servidor, número de hijos, número de caras obtenidas al lanzar dos monedas.
        * *Cuantitativa continua:* Tomar todos los valores de un determinado intervalo. **Ejemplos:** salario, peso, estatura.

### Ejemplos:
- tipo de procesador >> Cualitativa nominal
- velocidad de un procesador (MHz) >> Cuantitativa discreta
- modelo de impresora >> Cualitativa nominal
- número de páginas impresas por minuto >> Cuantitativa discreta
- variable representando un byte >> Cuantitativa continua
- la altura y el peso de una persona >> Cuantitativa continua
- la parte entera de la medición de la altura de una persona >> Cuantitativa continua
- la variable número de núcleos de un procesador >> Cuantitativa discreta

---

## 2 - Estadística Descriptiva Unidimensional

Sea $X$ la variable de interés, y sean $x_{1}, x_{2}, . . . , x_{k}$ los valores distintos que toma dicha variable medidos en una muestra de tamaño $N$.

* **Frecuencia absoluta:** Número de veces que se repite cada valor de la variable.
* **Frecuencia relativa:** Frecuencia absoluta dividida por el número total de datos, $N$.
* **Frecuencia absoluta acumulada:** Número de datos menores o iguales que el valor elegido.
* **Frecuencia relativa acumulada:** Frecuencia absoluta acumulada dividida por el número total de datos, $N$.

| Frecuencia absoluta de $x_{i}$ <br> $n_{i}$ | Frecuencia relativa de $x_{i}$ <br> $f_{i}$ |
| :---: | :---: |
| Frecuencia absoluta acumulada de $x_{i}$ <br> $N_{i} = n_{i} + ... + \sum_{k=1}^i n_{k}$ | Frecuencia relativa acumulada de $x_{i}$ <br> $F_{i} = n_{i} + ... + \sum_{k=1}^i f_{k} = N_{i}/N$ |

### 2.1 - Representaciones Gráficas

Los tipos de gráficos más utilizados son:

1. Para fenómenos ***cualitativos***: Cartograma, pictograma, nube de palabras, diagrama de sectores y diagrama de rectángulos.
2. Para fenómenos ***cuantitativos***: 
    1. **Distribuciones no agrupadas**: Diagrama de barras y polígono de frecuencias.
    2. **Distribuciones agrupadas (en intervalos definidos)**: Histograma de frecuencias, polígono de frecuencias y polígono acumulativo.

### 2.2 - Principales características numéricas

La información suministrada por una tabla de distribución de frecuencias se puede resumir en un conjunto de medidas que la caracterizan y que se pueden clasificar en:
* *Medidas de posición:* Proporcionan valores que determinan posiciones dentro del conjunto de los datos. Las dividimos en medidas de tendencia central y de tendencia no central.
* *Medidas de dispersión:* Indican la desviación de los datos respecto de ciertas medidas de posición.
* *Medidas de forma:* Relacionadas con la representación gráfica de la distribución.

### 2.3 - Medidas de posición de tendencia central

* **Media aritmética $\overline{X}$**: Cociente entre la suma de todos los valores observados
de la variable y el número total de observaciones $N$. $$\overline{X}=\frac{\sum_{i=1}^k X_{i}n_{i}}{N}$$

> Para datos agrupados se toman como $x_{i}$ las marcas de clase.

### *Propiedades*:
1. $ \sum_{i=1}^k (x_{i} - \overline{x})n_{i} = 0 $.
2. **Teorema de König:** $ min_{c}\sum_{i=1}^k (x_{i} - c)^2 n_{i} = \sum_{i=1}^k (x_{i}-\overline{x})^2 n_{i} $.
3. Linealidad de la media: dados $a,b \in \real$ e $Y = a + bX$ se verifica $\overline{y}=a+b\overline{x}$.
4. $min(x_{i})\leq \overline{X} \leq max(x_{i})$

### Ejemplos

1. Calcula la media aritmética de los 10 primeros números naturales.

> $ X=10 \\ x_{1}=1, x_{2}=2, x_{3}=3, ... ,x_{10}=10 \\  n_{i} = 1, i = 1,2,3,4,...,10 $

$$ \overline{x} = \frac{1+2+3+...+10}{10} = \frac{55}{10} = 5.5 $$

2. Supón ahora que la ponderación de cada valor es inversamente proporcional a su valor.

> $ X=10 \\ x_{1}=1, x_{2}=2, x_{3}=3, ... ,x_{10}=10 \\  w_{i} = 1, i = 1,\frac{1}{2},\frac{1}{3},\frac{1}{4},...,\frac{1}{10} $

$$ \overline{x}_{w} = \frac{1+2*\frac{1}{2}+3*\frac{1}{3}+...+10*\frac{1}{10}}{1+\frac{1}{2}+\frac{1}{3}+\frac{1}{4}+...+\frac{1}{10}} = \frac{10}{2.928968} =  3.414172 $$

---

* **Mediana $Me$**: Llamamos mediana, al valor de la variable que deja a su izquierda la misma frecuencia que a su derecha.

***Cálculo de la mediana:*** 
1. Distribuciones no agrupadas: Se observa cuál es la primera frecuencia absoluta acumulada $N_{i}$ que supera o iguala a $N/2$ distinguiéndose dos casos:
    1. Si $ N_{i} > N/2 $ entonces $ Me = x_{i}$.
    2. Si $ N_{i} = N/2 $ entonces $ Me = \frac{x_{i} + x_{i+1}}{2}$.
2. Distribuciones agrupadas: `null`.

### Ejemplos

1. Calcula la mediana de la siguiente tabla de frecuencias:

| $x_{i}$ | $n_{i}$ | $N_{i}$ |
| :---: | :---: | :---: |
| $1\\2\\3\\4$ | $1\\1\\1\\1$ | $1\\2\\3\\4$ |
|  | $N = 4$ |  |

Variable discreta y como $N_{2} = \frac{4}{2}$, la mediana es $ \frac{x_{i}+x_{i+1}}{2} = 2.5$.

2. Calcula la mediana de la siguiente tabla de frecuencias:

| $x_{i}$ | $n_{i}$ | $N_{i}$ |
| :---: | :---: | :---: |
| $1\\2\\3\\4$ | $10\\5\\15\\10$ | $10\\15\\30\\40$ |
|  | $N = 40$ |  |

Variable discreta y como $N_{3} > \frac{40}{2} = 20$, la mediana es $ 3 $.

---

* **Moda $Mo$**: Valor de la variable que más veces se repite.

***Cálculo de la moda:*** 
* *Distribuciones no agrupadas*: valor de la variable de mayor frecuencia absoluta o relativa.

---

### 2.4 - Medidas de posición no centrales: los Cuantiles

Se define cuantil de orden $p$ con $ 0 < p < 1 (x_{p})$, como el valor que deja a lo sumo $pN$ observaciones a su izquierda y $(1 − p)N$ observaciones a su derecha.

***Cálculo del cuantil de orden $p$ para distribuciones no agrupadas:*** Se observa cuál es la primera frecuencia absoluta acumulada $N_{i}$ que supera o iguala a $pN$ distinguiéndose dos casos:
* Si $N_{i}>pN$ entonces $x_{p} = x_{i}$.
* Si $N_{i}=pN$ entonces $x_{p} = \frac{x_{i}+x_{i+1}}{2}$.

---

### 2.5 - Medidas de Dispersión

Son medidas que nos indican la desviación de los valores de la variable respecto de ciertas medidas de posición como la media aritmética o la mediana.

* **Varianza**: De todas las medidas de dispersión absolutas respecto a la media aritmética, la varianza y su raíz cuadrada, la desviación típica son las más importantes.
$$ s^2=\frac{\sum_{i=1}^k(x_{i}-\overline{x})^2n_{i}}{N} $$

* **Desviación típica**: Es la raíz cuadrada de la varianza:

$$ s = \sqrt{s^2} = \sqrt{\sum_{i=1}^k(x_{i}-\overline{x})^2n_{i}} $$

**Propiedades de la varianza:**
1. La varianza y la desviación típica **NUNCA** pueden ser negativas $ s^2 \geq 0, s^ \geq 0$.
2. La varianza es la medida cuadrática de dispersión óptima, ya que:
$$ min_{c}\sum_{i=1}^k (x_{i} - c)^2 n_{i} = \sum_{i=1}^k (x_{i}-\overline{x})^2 n_{i}$$
3. La varianza es igual al momento de segundo orden respecto al origen menos el de primer orden elevado al cuadrado.
4. Si en la distribución de frecuencias sumamos a todos los valores de la variable una constante, la varianza no varía.
5. Al multiplicar todos los valores de una distribución de frecuencias por una constante, la varianza queda multiplicada por el cuadrado de dicha constante.

### 2.6 - Medidas de Dispersión relativas

Si queremos comparar los promedios de dos distribuciones para saber cuál de los dos es más representativo debemos utilizar medidas adimensionales, es decir, que no vengan afectadas por las unidades de medida. Estas medidas de dispersión, llamadas relativas, siempre se concretan en forma de cociente. Las más utilizadas son:

* **Recorrido relativo**: Se define como el cociente entre el recorrido y la media aritmética $ R_{t} = \frac{Re}{\overline{x}} $
* **Coeficiente de variación de Pearson**: Se define como la relación por cociente entre la desviación típica y la media aritmética. Si $ \overline{x} \neq 0 $, $ v = \frac{s}{\overline{x}} $.

> Cuanto mayor sea $v$, menor es la representatividad de la media aritmética.

### 2.7 - Medidas de Forma

Están relacionadas con la representación gráfica de la distribución. Pueden ser:

* **Medidas de simetría**:
    * *Asimetría positiva*: Si las frecuencias más altas se encuentran en el lado izquierdo de la media, mientras que en derecho hay frecuencias más pequeñas (cola).
    * *Asimetría negativa*: Cuando la cola está en el lado izquierdo.

* **Tipificación**: Una variable estadística se dice tipificada o estandarizada si su media es cero y su varianza o su desviación típica es uno. Dada una variable $X$ con media $µ$, y varianza $σ^2$, la nueva variable $ Z = \frac{X - µ}{σ}$, es su tipificada.

