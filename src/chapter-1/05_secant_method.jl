TOL = 0.5e-8

function secant(f::Function, x₀::Real, x₁::Real, 
                ε::Real = TOL, max_iter::Int = 100)
    x₊, x₋ = x₁, x₀
    iter = 0
    while iter < max_iter
        x₊, x₋ = x₊ - (f(x₊)*(x₊ - x₋))/(f(x₊) - f(x₋)), x₊
        if abs((x₊ - x₋) / x₊) < ε
            break
        end
        iter += 1
    end
    x₊, iter
end

