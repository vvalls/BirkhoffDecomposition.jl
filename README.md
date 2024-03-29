[![Build Status](https://travis-ci.com/vvalls/BirkhoffDecomposition.jl.svg?token=wfxaqfDxVdXnz8s4hjc3&branch=master)](https://travis-ci.com/vvalls/BirkhoffDecomposition.jl)
[![codecov](https://codecov.io/gh/vvalls/BirkhoffDecomposition.jl/branch/master/graph/badge.svg?token=L3R6JM6Q65)](https://codecov.io/gh/vvalls/BirkhoffDecomposition.jl)

[BirkhoffDecomposition.jl](https://github.com/vvalls/BirkhoffDecomposition.jl) is a [Julia](https://julialang.org) package for decomposing a [doubly stochastic matrix](https://en.wikipedia.org/wiki/Doubly_stochastic_matrix) as the sum of permutation matrices. 

**Installation**: `julia> import Pkg; Pkg.add("BirkhoffDecomposition")`


## Exact Birkhoff decomposition

```julia
# Load the package
using BirkhoffDecomposition

# Generate a random doubly stochastic matrix (n is the dimension)
n  = 3             
X  = randomDoublyStochasticMatrix(n);

# Compute exact decomposition
P, w = birkdecomp(X);
```
The output of ``birkdecomp(X)`` is an array ``P`` of ``n*n`` permutation matrices and ``w`` a vector of weights. We can now write the doubly stochastic matrix ``X`` in vector form as ``P*w``

##  Approximate Birkhoff decomposition

The command ``birkdecomp(X,ε)`` obtains an ε-approximate Birkhoff decomposition of matrix ``X``. In particular, the resulting decomposition ``Y = reshape(P*w,n,n)`` ensures that the [Frobenious norm](https://en.wikipedia.org/wiki/Matrix_norm#Frobenius_norm) of ``X-Y`` is smaller than ``ε``. 

```julia
n  = 16; X = randomDoublyStochasticMatrix(n);
ε = 1e-2;
P, w = birkdecomp(X,ε);

Y = reshape(P*w,n,n);
sqrt(sum((X-Y).^2)) <= ε  # Frobenius norm
```
## Cite
The algorithm implemented in the package is the ```Birkhoff+``` presented in:

Valls, V., Iosifidis, G. and Tassiulas, L., 2021. Birkhoff’s Decomposition Revisited: Sparse Scheduling for High-Speed Circuit Switches. IEEE/ACM Transactions on Networking, 29(6), pp.2399-2412.

## Acknowledgements

This work has received funding from the European Union’s Horizon 2020 research and innovation programme under the Marie Skłodowska-Curie grant agreement No. 795244.
