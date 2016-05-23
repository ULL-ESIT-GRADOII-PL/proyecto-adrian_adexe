# project-PL

## Descripción

Escribir un analizador del lenguaje PL0 usando PEGjs así como las tecnologías vistas durante el curso: ECMA6, Node.js, expressJS, MongoDB, Mongoose, SASS, etc. La salida debe ser el árbol de análisis sintáctico del programa de entrada.

## Repositorio GitHuB

* [Repositorio de trabajo y organización](https://github.com/ULL-ESIT-GRADOII-PL/proyecto-adrian_adexe)

## Página de la práctica

* [Aplicación en heroku](https://analizador-pl0-adrian-adexe.herokuapp.com/)

## Forma de uso

Para poder utilizar el proyecto primero se deben instalar las dependencias:

```bash
$ npm install
```

Para compilar la gramática pegjs nos situaremos en la raíz del proyecto y ejecutaremos:

```bash
$ pegjs lib/pl0.pegjs public/javascript/parser.js
```

Cambiaremos la primera línea del fichero parser.js:
```js
module.exports = (function() {
```
ahora será:
```js
pl0 = (function() {
```

Para correr la aplicación en local:

```bash
$ npm start
```

La aplicación estará disponible a través de `http://localhost:3000/`
## Página de los autores

* [Adexe Sabina](http://alu0100769609.github.io/)
* [Adrián Calzadilla](http://adcalzadilla.github.io/)
