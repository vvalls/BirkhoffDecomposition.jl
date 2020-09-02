
function getBirkhoffStepSize(x_star,x,y)
    return minimum((x_star-x).*y - (y.-1));
end
