# Secant method

Uso del método de Newton-Raphson para encontrar la raiz de una funcion, reemplazando la derivada de la funcion por:

$f'(x_n) = \Large{{f(x_{n-1}) - f(x_n)} \over {x_{n-1} - x_n}}$

### Ejemplo de uso
```Octave
	Metodo Secante

--> x^3-9x^2+x+(90/%pi)

...

f(x) = (1)x^3 + (-9)x^2 + (1)x + (28.64789)
x = -1.5976471
iteraciones = 18

--> exit
```
