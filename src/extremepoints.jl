function getEPBplus(x_star, x, B, max_rep, ε)

    n = sqrt(size(x_star,1))
    d  = size(x_star,1);
    i = 1;
    y = 0;
    α = 0;

    while(i <= max_rep)

        z = Int16.(x_star - x .> ε)
        s = getBirkhoffStepSize(x_star,x,z)
        beta = (s + ε/d)*0.5

        c = -ones(d) + beta ./ (x_star - x .+ ε/d)
        b = (n/ε).*Int16.(x_star - x .<= α)
        y_iter = LP(c + b, B);
        y_z = x;
        if(c'*y_iter > c'*y_z)
            y_iter = y_z
        end

        α_iter = getBirkhoffStepSize(x_star, x, y_iter);
        if(α < α_iter)
            α = α_iter;
            y = y_iter;
        else
            return y;
        end
        i = i + 1;
    end

    return y
end
