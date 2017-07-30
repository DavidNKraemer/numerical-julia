TOL = 0.5e-8

function fixedpointiter(fun::Function, x₀::Real, ε = TOL, max_iter::Int = 100)
    x = x₀
    xprev = x
    iter = 0
    while iter < max_iter
        iter += 1
        x = fun(x)
        if abs(x - xprev) / abs(x) < ε
            break
        end
        xprev = x
    end
    x, iter
end
