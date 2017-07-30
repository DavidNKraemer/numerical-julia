TOL = 0.5e-8

function newton(f::Function, ∂f::Function, x₀::Real, ε::Real = TOL, max_iter::Int = 100)
    x = x₀
    iter = 0
    while iter < max_iter
        xprev = x
        x = x - f(x) / ∂f(x)
        if abs( (x - xprev) / x) < ε
            break
        end
        iter += 1
    end
    x, iter
end

