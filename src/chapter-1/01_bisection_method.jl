TOL = 0.5e-8

function bisection(f::Function, a::Real, b::Real; 
                   ε::Real = TOL, iₘₐₓ::Int = 100)

    fa = f(a)
    fb = f(b)
    if fa * fb >= 0
        throw(DomainError("The signs of the interval [f($(a)), f($(b)] must
                          differ."))
    end

    if a > b # enforces that the condition a ≦ b holds
        a, b = b, a
    end

    c = (a + b) / 2
    i = 0
    
    while (b - a) > 2ε && n < iₘₐₓ
        c = (a + b) / 2
        fc = f(c)
        if fc == 0
            break
        elseif fc * fa < 0
            b = c
            fb = fc
        else
            a = c
            fa = fc
        end
        i += 1
    end
    c, i
end
