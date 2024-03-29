module BirkhoffDecomposition

    using JuMP
    using HiGHS
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

end
