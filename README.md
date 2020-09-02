[![Build Status](https://travis-ci.com/vvalls/BirkhoffDecomposition.jl.svg?token=wfxaqfDxVdXnz8s4hjc3&branch=master)](https://travis-ci.com/vvalls/BirkhoffDecomposition.jl)

BirkhoffDecomposition.jl is a Julia package for decomposing a doubly stochastic matrix as the sum of permutation matrices. 

**Installation**: `julia> Pkg.add("BirkhoffDecomposition.jl")`

## Quick Example

Now let's find a Birkhoff decomposition.
```julia
# Let us first make the BirkhoffDecomposition.jl module available
using BirkhoffDecomposition

# Generate a random doubly stochastic matrix (n is the dimension)
n  = 3;             
x  = randomDoublyStochasticMatrix(n);

# Find decomposition
P, w = birkdecomp(x);
```
The output of ``birkdecomp(x)`` is an array ``p`` of ``n*n`` permutation matrices and ``w`` a vector of weights. We can now write the doubly stochastic matrix ``x`` as
``
sum(P.*w) = P[1]*w[1] + P[2]*w[2] + ... + P[k]*w[k]
``

## Documentation

The detailed documentation can be found [here](https://www.google.com). This includes some application examples as well as how to tune the parameters to obtain (sparse) approximate Birkhoff decompositions.
