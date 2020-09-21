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

# Compute exact decomposition
P, w = birkdecomp(X);
```
The output of ``birkdecomp(X)`` is an array ``P`` of ``n*n`` permutation matrices and ``w`` a vector of weights. We can now write the doubly stochastic matrix ``X`` in vector form as ``P*w``

The command ``birkdecomp(X,ε)`` obtains an ε-approximate decompositios of matrix ``X``. That is, the resulting decomposition ``Y = reshape(P*w,n,n)`` satisfies  ![formula](https://render.githubusercontent.com/render/math?math=e^{i \pi} = -1)

