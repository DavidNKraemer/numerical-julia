TOL = 0.5e-8

function fixedpointiter(fun::Function, x₀::Real; 
                        ε = TOL, iₘₐₓ::int = 100)
    i = 0
    xᵢ = x₀
    x₋ = 2xᵢ + 2 # not close to xᵢ and far greater than ε
    while abs( xᵢ - x₋) / abs(xᵢ) >= ε && i < iₘₐₓ
        x₋, xᵢ = xᵢ, fun(xᵢ)
        i += 1
    end
    xᵢ, i
end
