TOL = 0.5e-8

function newton(f::Function, ∂f::Function, x₀::Real; 
                ε::Real = TOL, iₘₐₓ::Int = 100)
    xᵢ = x₀
    εᵢ = xᵢ
    i = 0
    while εᵢ >= ε && i < iₘₐₓ 
        x₋, xᵢ = xᵢ, xᵢ - f(xᵢ) / ∂f(xᵢ)
        εᵢ = abs( xᵢ - x₋ )
        n += 1
    end
    xᵢ, εᵢ, i 
end

