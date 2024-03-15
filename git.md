https://github.com/profeInformatica101/git
# Log 
```sh
git log --pretty=format:"%h - %an, %ar : %s"
```
%h: Muestra el hash abreviado del commit. Este es un identificador corto para el commit, más fácil de leer y manejar que el hash completo.

%an: Muestra el nombre del autor del commit. Este es el individuo que realizó los cambios y ejecutó el commit.

%ar: Muestra la fecha relativa del commit, como "hace 2 días". Es una manera más humana y fácil de entender de cuándo se hizo el commit, en lugar de una fecha y hora exactas.

%s: Muestra el mensaje del commit. Este es el mensaje que el autor del commit agregó para explicar qué cambios se hicieron y por qué.
