# CSP implementations in C++

Here you can find some example implementations of the popular `SEND + MORE = MONEY` puzzle.

The `src/gt.cpp` file contains the source code for **generate & test algorithm** that solves SEND + MORE = MONEY puzzle. The enerate & test algorithm generates all the possible solutions one by one from the domain and checks wether the constraints are satisfied. If yes the prints the solutions, otherwise continues searching.

The `src/sbt.cpp` file contains the source code for **simple backtracking algorithm** that solves SEND + MORE = MONEY puzzle. The simple backtracking algorithm for each assignment to a variable verifies the constraints that can be verified. If this "partial" constraints are satisfied then it continues searhing for the solutions, otherwise tries a new assignement for that variable.

## Usage

Download source code
```
git clone https://github.com/lparolari/csp-puzzles-in-cpp
cd csp-puzzle-in-cpp
```
compile it
```
chmod u+x compile
./compile
```
and run it
```
chmod u+x try
./try
```


# Author

Luca Parolari <<luca.parolari23@gmail.com>>


# License

The MIT license.
