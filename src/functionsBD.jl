struct polytope
    A;
    b;
    l;
    u;
    model;
    x;
end

function LP(c,P)

    @objective(P.model, Min, c'* P.x)
    optimize!(P.model)
    return value.(P.x)

end


function randomDoublyStochasticMatrix(n; num_perm = n^2)

    M = zeros(n,n);
    α = rand(num_perm)

    α = α / sum(α);

    for i=1:num_perm
        perm = randperm(n);
        for j=1:n
            M[perm[j],j] += α[i];
        end
    end

    return M;
end


function birkhoffPolytope(n)

    M = zeros(n*n,2*n);
    for i=1:n
        M[(i-1)*n*n + (i-1)*n + 1 : (i-1)*n*n + (i-1)*n + n ] = ones(n,1);
    end
    for i=1:n
        for j=1:n
            M[n*n*n + (i-1)*n*n + (j-1)*n + i] = 1;
        end
    end

    A = sparse(M');
    b = ones(2*n);

    model = Model(with_optimizer(Clp.Optimizer))
    set_silent(model)
    @variable(model, 0 <= x[1:n*n] <= 1)
    @constraint(model, A * x .== b)

    return polytope(A,b,0,1,model,x)

end
