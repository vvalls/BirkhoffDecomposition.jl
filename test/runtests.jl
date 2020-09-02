using Test

using BirkhoffDecomposition

# Generate a random doubly stochastic matrix (n is the dimension)
n  = 3;
x  = randomDoublyStochasticMatrix(n);

# Find decomposition
P, w = birkdecomp(x);
