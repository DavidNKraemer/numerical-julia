TOL = 0.5e-8

function bisection(fun::Function, a::Real, b::Real, ε = TOL)

    fun_a = fun(a)
    fun_b = fun(b)
    if fun_a * fun_b >= 0
        throw(DomainError("The signs of the interval [f($(a)), f($(b)] must
                          differ."))
    end
    if a >= b # enforces that the condition a < b holds
        a, b = b, a
    end

    c = (a + b) / 2
    
    while (b - a) / 2 > ε
        c = (a + b) / 2
        fun_c = f(c)
        if fun_c == 0
            break
        elseif fun_c * fun_a < 0
            b = c
            fun_b = fun_c
        else
            a = c
            fun_a = fun_c
        end
    end
    c
end
