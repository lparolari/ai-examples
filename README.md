# AI Examples

Here you can find some example solutions for **artificial intelligence** main problems.

The main objective is to try some implementations of AI main problems and explore realted topics.
See the [table of contents](#table-of-contents) for more details.

The repository, for now, contains implementations in C++ and Prolog. Many other languages like Picat, Java, Haskell 
and maybe others are planned for some examples. 


# Table of Contents

The table of contents will help you understand what this repository contains.

* [AI Examples](#ai-examples)
* [Table of Contents](#table-of-contents)
* [Usage](#usage)
* [Artificial Intelligence](#artificial-intelligence)
   * [CSP problems](#csp-problems)
      * [Money puzzle](#money-puzzle)
* [Author](#author)
* [License](#license)



# Usage

Download source code
```
git clone https://github.com/lparolari/ai-examples
cd ai-examples
```
and run the examples.


# Artificial Intelligence

## CSP problems

### Money puzzle 

You can find some C++ implementations in `cpp/money` folder, using below listed techniques.

**Generate & test** implementation in *C++*. The `gt` directory contains source code for solving SEND + MORE = MONEY 
puzzle with *g&t algorithm*. The algorithm generates all the possible solutions one by one from the domain and checks 
wether the constraints are satisfied. If yes the prints the solutions, otherwise continues searching.

**Simple backtracking** implementation in *C++*. The `sbt` directory contains source code for solving SEND + MORE = 
MONEY puzzle with *simple backtracking*. The simple backtracking algorithm for each assignment to a variable verifies 
the constraints that can be verified. If this "partial" constraints are satisfied then it continues searhing for the 
solutions, otherwise tries a new assignement for that variable.


# Author

Luca Parolari <<luca.parolari23@gmail.com>>


# License

The MIT license.
