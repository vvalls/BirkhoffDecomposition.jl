function birkdecomp(X, ε=1e-12; max_rep = 1)

    n = size(X,1);                                  # get size of Birkhoff polytope
    x_star = reshape(X, n*n);                       # reshape doubly stochastic to vector
    B = birkhoffPolytope(n);                        # Birkhoff polytope
    ε = max(ε,1e-15);                               # fix the maximum minimum precision
    max_iter = (n-1)^2 + 1;

    x = zeros(n*n);                                 # initial point

    extreme_points = zeros(n*n,max_iter);           # extreme points matrix
    θ = zeros(max_iter);                            # weights vector
    approx = Inf;                                   # approximation error
    i = 1;                                          # iteration index

    # Algorithms
    while(approx > ε)

        y = getEPBplus(x_star, x, B, max_rep, ε)
        θi = getBirkhoffStepSize(x_star,x,y)
        x = x .+ θi.*y;
        θ[i] = θi;

        approx = sqrt(sum((abs.(x_star.-x)).^2));
        extreme_points[:,i] = abs.(y);
        i = i + 1;

    end

    return Int16.(extreme_points[:,1:i-1]), θ[1:i-1]

end
