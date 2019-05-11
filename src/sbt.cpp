/*
 * SEND + MORE = MONEY with SIMPLE BACKTRACKING algorithm
 *
 * This is a C++ implementation for SEND+MORE=MONEY puzzle,
 * with simple backtracking algorithm.
 */

// Puzzle: SEND + MORE = MONEY
// Vars: S, E, N, D, M, O, R, Y
// Domains: 0..9
// Number of cases: 10^8 = |Domain|^|Vars| = 100000000

#include <iostream>

const bool debug = false;

const int VARS_NO = 8;
const int EMPTY = -1;
const int DOM_NO = 10;

const int S=0, E=1, N=2, D=3, M=4, O=5, R=6, Y=7;
const char var_names[] = {'S', 'E', 'N', 'D', 'M', 'O', 'R', 'Y'};

int vars[VARS_NO] = {EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY };
int dom[] = {0,1,2,3,4,5,6,7,8,9};

int sol_no = 0;

/** 
 * Helper function for validating the constraints.
 * Verify that the i-variable is different from the others.
 * @param i The variable index.
 * @param n The number of variables.
 * @return True if all variables are different from each others, false otherwise.
 */
bool allDifferent(int i, int n) {
  if (vars[i] == -1) return true;
  if (i > VARS_NO - 1) return true;
  for (int j = i; j < n; ++j) {
    if (i != j && vars[i] == vars[j]) return false;
  }
  return allDifferent(i+1, n);
}

/**
 * Verify wether the problem's constraints are satisfied or no.
 * 
 * Constraints:
 *  - variables are all different;
 *  - variable S and M are different from 0;
 *  - SEND + MORE = MONEY
 */
bool isConstraintsSatisfied() {
  // some tests:
  //  (1) return true;
  //  (2) return false;
  //  (3) real constrints;

  bool ok = true;
  
  if (!allDifferent(0, VARS_NO))
    ok = false;
  
  if (vars[S] != -1 && vars[S] == 0)
    ok = false;
  if (vars[S] != -1 && vars[M] == 0)
    ok = false;

  if (vars[S] != -1 && vars[E] != -1 && vars[N] != -1
      && vars[D] != -1 && vars[M] != -1 && vars[O] != -1
      && vars[R] != -1 && vars[Y] != -1)
    {
      int send = vars[S] * 1000 + vars[E] * 100 + vars[N] * 10 + vars[D];
      int more = vars[M] * 1000 + vars[O] * 100 + vars[R] * 10 + vars[E];   
      int money = vars[M] * 10000 + vars[O] * 1000 + vars[N] * 100 + vars[E] * 10 + vars[Y];

      if (send + more != money)
	ok = false;  
  }
    
  return ok;
}

/**
 * Show the found solution.
 */
void solutionFound() {
  ++sol_no;
  // Note: cout can be commented out for better performance
  //  with test cases like isConstraintSatisfied() always true.
  std::cout << "Solution found!" << std::endl;
  std:: cout << "  ";
  for (int i = 0; i < VARS_NO; ++i) {
    std::cout << var_names[i] << "=" << vars[i] << ", ";
  }
  std::cout << std::endl;

  int send = vars[S] * 1000 + vars[E] * 100 + vars[N] * 10 + vars[D];
  int more = vars[M] * 1000 + vars[O] * 100 + vars[R] * 10 + vars[E];   
  int money = vars[M] * 10000 + vars[O] * 1000 + vars[N] * 100 + vars[E] * 10 + vars[Y];

  std::cout << "  " << send << " + " << more << " = " << money << std::endl; 
  
}

/**
 * Solve the problem generating all possible values for variables from 
 *  domains and verifying the constraints.
 */
void solve(int i) {
  // if the variable is the "righter" one (i.e. all variables now have
  //  a values), check the constraints.
  if (i == VARS_NO) {
    solutionFound();
  }
  // else continue with assignments.
  else {
    if (vars[i] == EMPTY) {
      for (int j = 0; j < DOM_NO; ++j) {
	// assign a value from the domain.
	vars[i] = dom[j];

	if (isConstraintsSatisfied()) {
	  solve(i + 1);
	}
      }
      // free the variable.
      vars[i] = EMPTY;
    }
    else {
      solve(i + 1);
    }
  }
}

int main() {
  solve(0);
  std::cout << sol_no << " solution(s) found." << std::endl;
  return 0;
}
