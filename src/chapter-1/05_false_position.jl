TOL = 0.5e-8

function falseposition(f::Function, a::Real, b::Real; 
                       ε::Real = TOL, iₘₐₓ::Int = 100)
    i = 0
    xᵢ = 0
    while f(xᵢ) == 0 && i < iₘₐₓ 
        fa, fb, fxᵢ = f(a), f(b), f(xᵢ)
        xᵢ = (b * fa - a * fb) / (fa - fb)

        if fa * fxᵢ < 0
            b = xᵢ
        else
            a = xᵢ
        end
        i += 1
    end
    xᵢ, i
end

