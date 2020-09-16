[![Build Status](https://travis-ci.com/vvalls/BirkhoffDecomposition.jl.svg?token=wfxaqfDxVdXnz8s4hjc3&branch=master)](https://travis-ci.com/vvalls/BirkhoffDecomposition.jl)
[![codecov](https://codecov.io/gh/vvalls/BirkhoffDecomposition.jl/branch/master/graph/badge.svg?token=L3R6JM6Q65)](https://codecov.io/gh/vvalls/BirkhoffDecomposition.jl)

BirkhoffDecomposition.jl is a Julia package for decomposing a doubly stochastic matrix as the sum of permutation matrices. 

**Installation**: `julia> import Pkg; Pkg.add("BirkhoffDecomposition")`

## Quick Example

```julia
# Load the package
using BirkhoffDecomposition

# Generate a random doubly stochastic matrix (n is the dimension)
n  = 3;             
X  = randomDoublyStochasticMatrix(n);

# Compute decomposition
P, w = birkdecomp(X);
```
The output of ``birkdecomp(X)`` is an array ``P`` of ``n*n`` permutation matrices and ``w`` a vector of weights. We can now write the doubly stochastic matrix ``X`` as
``
sum(P.*w) = P[1]*w[1] + P[2]*w[2] + ... + P[k]*w[k]
``
