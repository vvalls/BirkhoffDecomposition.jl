module BirkhoffDecomposition

    using MathOptInterface
    using JuMP
    using Clp
    using Ipopt
    using Random
    using SparseArrays

    function __init__()

    end

    include("functionsBD.jl")
    include("birkdecomp.jl")
    include("extremepoints.jl")
    include("stepsizes.jl")

    export randomDoublyStochasticMatrix
    export birkdecomp

end # module
