# AI Examples

**This repository contains example solutions for artificial intelligence main problems, implemented in different languages.**

The main objective is to try some implementations in different languages of AI main problems and explore realted topics. 
This project is done with learning purposed.
See the [repository organization](#repository-organization) section to understand what this repository is about.


## Table of Contents

The table of contents will help you understand what this repository contains.

* [Usage](#usage)
* [Repository Organization](#repository-organization)
   * [Money puzzle](#money-puzzle)
   * [Planning](#planning)
   * [Graphs](#graphs)
* [Author](#author)
* [License](#license)



## Usage

Download source code
```
git clone https://github.com/lparolari/ai-examples
cd ai-examples
```
and run the examples.


## Repository Organization

Sources are organized in the main folder by covered topic. The numbering is for convenience only.

### Money puzzle 

You can find money puzzle implementations in [001_money](001_money) folder using different techniques and programming languages.

Implementations:
 - *C++ with generate & test*. The puzzle is solved with with *g&t algorithm*. The algorithm generates all the possible solutions one by one from the domain and checks wether the constraints are satisfied. If yes the prints the solutions, otherwise continues searching.

- *C++ with simple backtracking*. The puzzle si solved with *simple backtracking*. The simple backtracking algorithm for each assignment to a variable verifies the constraints that can be verified. If this "partial" constraints are satisfied then it continues searhing for the solutions, otherwise tries a new assignement for that variable.

- *Prolog with clp(fd)*. The puzzle is solved with Prolog library for constraint logic programming.

- *Prolog with backtracking*. The puzzle is solved with Prolog backtracking. Prolog selects values for variables from theri domains and tries the assignments. A set of assignments are a solutions if constraints are satisfied.

### Planning

Some **planning** example implementations can be found at [002_planning](002_planning).

The folder contains:
 - 2 implementations of a labyrinth escape planning problem;
 - the old *banana* planning problem.

Files are self documented, explore them!

### Graphs

Examples treating **graphs** are located at [003_graphs](003_graphs).

Files are self documented, explore them!

### Many other examples

Stay tuned! ;)


## Author

Luca Parolari <<luca.parolari23@gmail.com>>


## License

This project is licensed under MIT license. See [LICENSE](LICENSE.txt) file for more informations.
