TOL = 0.5e-8

function secant(f::Function, x₀::Real, x₁::Real; 
                ε::Real = TOL, iₘₐₓ::Int = 100)
    i = 0
    xᵢ, x₋ = x₁, x₀
    εᵢ = abs(xᵢ - x₋)
    while εᵢ >= ε && i < iₘₐₓ
        xᵢ, x₋ = xᵢ - (f(xᵢ) * (xᵢ - x₋))/ (f(xᵢ) - f(x₋)), xᵢ
        εᵢ = abs(xᵢ - x₋)
        i += 1
    end
    xᵢ, εᵢ, i 
end

